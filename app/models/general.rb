class General < ActiveRecord::Base
  attr_accessible :name, :attack, :defense, :upkeep, :base_cost, :e_attack, :e_defense, :div_power,
    :attack_increment, :defense_increment, :description, :general_type, :url, :base_piercing, :base_resistance,
    :alliance_type, :general_id, :general, :bonus_type, :bonus
  
  validates :name, :presence => true
  validates :attack, :defense, :base_piercing, :base_resistance, :presence => true, :numericality => { :only_integer => true }
  validates :attack_increment, :defense_increment, :base_cost, :upkeep, :div_power, :numericality => { :only_integer => true }, :allow_nil => true
  
  has_many :recruits
  belongs_to :loadoutable, :polymorphic => true
  belongs_to :general
  has_many :weapons
  has_many :items
  has_many :powers
  has_many :soldiers
  has_many :generals
  
  before_save :update_e_attack
  before_save :update_e_defense
  
  cattr_reader :per_page
  @@per_page = 25
  @permitted_columns = ['name','attack','defense','e_attack','e_defense','base_cost','upkeep','div_power','general_type']
  
  def self.max_level
    122
  end
  
  def is_unowned?
    !recruits.exists?
  end
  
  def image_path(t)
    unless url.blank?
      url
    else
      'favor_clear.gif'
    end
  end
  
  def has_special_leveling_increment?
    false
  end
  
  def has_at_least?(num,profile,recruit)
    [
      profile.generals.where(general_id: recruit.general_id).count,
      profile.weapons.where(general_id: recruit.general_id).count,
      profile.items.where(general_id: recruit.general_id).count,
      profile.powers.where(general_id: recruit.general_id).count,
      (['Dragan','Strider','Sophia','Penelope'].include?(self.name) && profile.weapons.find_by_name('Soulforge')) ? 1 : 0
    ].sum >= num
  end
  
  def monster_bonus_only?
    false
  end
  
  def monster_attack(recruit)
    0
  end
  
  def resistance(recruit)
    base_resistance
  end
  
  def piercing(recruit)
    base_piercing
  end
  
  def update_e_attack
    self.e_attack = attack + defense*0.7
  end
  
  def update_e_defense
    self.e_defense = defense + attack*0.7
  end
  
  def self.search(*args)
    options = args.extract_options!

    options[:c] = @permitted_columns.include?(options[:c]) ? options[:c] : 'e_attack'

    General.order(options[:c] + " " + ((options[:d] == 'up') ? "ASC" : "DESC")).paginate(:page => options[:page])
  end
  
  def attack_with_mods(profile,recruit)
    return [
      recruit.attack,
      recruit.attack_alliance_bonus,
      recruit.attack_set_bonus,
      profile.weapons.attack.where(general_id: recruit.general_id).sum(:bonus),
      profile.items.attack.where(general_id: recruit.general_id).sum(:bonus),
      profile.powers.attack.where(general_id: recruit.general_id).sum(:bonus)
    ].sum
  end

  def defense_with_mods(profile,recruit)
    return [
      recruit.defense,
      recruit.defense_alliance_bonus,
      recruit.defense_set_bonus,
      profile.weapons.defense.where(general_id: recruit.general_id).sum(:bonus),
      profile.items.defense.where(general_id: recruit.general_id).sum(:bonus),
      profile.powers.defense.where(general_id: recruit.general_id).sum(:bonus)
    ].sum
  end
  
  def e_attack_with_bonus(profile,recruit)
    # return ((attack_with_mods(profile,recruit) + profile.ri_attack) + (profile.ri_defense + defense_with_mods(profile,recruit))*0.7).round(1)
    e_attack = General.eatt(
      [
        attack_with_mods(profile,recruit),
        attack_bonus(profile,recruit),
        profile.ri_attack
      ].sum,
      [
        defense_with_mods(profile,recruit),
        defense_bonus(profile,recruit),
        profile.ri_defense
      ].sum
    )
    return (e_attack * (1 + (piercing(recruit) / 1000.0))).round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    # return ((defense_with_mods(profile,recruit) + profile.ri_defense) + (profile.ri_attack + attack_with_mods(profile,recruit))*0.7).round(1)
    e_defense = General.edef(
      [
        attack_with_mods(profile,recruit),
        attack_bonus(profile,recruit),
        profile.ri_attack
      ].sum,
      [
        defense_with_mods(profile,recruit),
        defense_bonus(profile,recruit),
        profile.ri_defense
      ].sum
    )
    return (e_defense * (1 + (resistance(recruit) / 1000.0))).round(1)
  end
  
  def attack_bonus(profile,recruit)
    return 0
  end
  
  def defense_bonus(profile,recruit)
    return 0
  end
  
  def step_function(level=1,opts={})
    opts[:pos_index] ||= 0
    opts[:multiplier] ||= 1
    opts[:offset] ||= 0
    opts[:period] ||= 1
    
    mod = opts[:pos_index] + opts[:multiplier]*level -
      ((level-opts[:offset])/opts[:period]).floor
    return mod
  end
  
  def self.edef(attack,defense)
    return defense + attack * 0.7
  end
  
  def self.eatt(attack,defense)
    return attack + defense * 0.7
  end
  
  def self.stub_model(name)
    model_name = name.gsub(/\*/,'').gsub(/\s/,'_').classify.underscore
    class_name = name.gsub(/\*/,'').gsub(/\s/,'_').classify
    content = <<-RUBY
class #{class_name} < General
  def piercing(recruit)
    super
  end
  
  def resistance(recruit)
    super
  end
  
  def has_special_leveling_increment?
    false
  end
  
  def monster_bonus_only?
    false
  end
  
  def special_leveling_increment(recruit,stat)
    # case recruit.level
    # when 1
    #   return 0
    # when 2, 3, 4
    #   return 2 * (recruit.level - 1)
    # else
    #   return 6 + recruit.level - 4
    # end
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    ### Strider example
    # attack += 3 if profile.inventory_exists?('weapons','Assassins Blade')
    # attack += 2 if profile.inventory_exists?('items','Amulet of Despair')

    ### Penelope
    # attack += 3 if profile.inventory_exists?('weapons','Scepter of Light')
    return attack
  end

  def defense_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's defense on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    defense = super

    ### Strider
    # defense += 5 if profile.inventory_exists?('items','Assassins Cloak')

    ### Penelope example
    # Nothing to do as nothing modifies Penelope's defense
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    attack = profile.attack
    defense = profile.defense
    attack_rune = profile.attack_rune
    defense_rune = profile.defense_rune
    attack_ia = profile.attack_ia
    defense_ia = profile.defense_ia
    e_attack = super

    ## Aesir example
    # case recruit.level
    # when 1
    #   e_attack += 0.01 * e_attack
    # when 2
    #   e_attack += 0.02 * e_attack
    # when 3
    #   e_attack += 0.03 * e_attack
    # when 4
    #   e_attack += 0.04 * e_attack
    # else
    #   e_attack += 0.04 * e_attack
    # end
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    attack = profile.attack
    defense = profile.defense
    attack_rune = profile.attack_rune
    defense_rune = profile.defense_rune
    attack_ia = profile.attack_ia
    defense_ia = profile.defense_ia
    e_defense = super
    return e_defense.round(1)
  end
end
    RUBY
    unless File.exists?(File.join("app/models/generals/", "#{model_name}.rb"))
      File.open(File.join("app/models/generals/", "#{model_name}.rb"), 'w') do |f|
        f.puts content
      end
      return "Created #{File.join("app/models/generals/", "#{model_name}.rb")}"
    else
      Rails.logger.info "#{File.join("app/models/generals/", "#{model_name}.rb")} exists!"
      return "#{File.join("app/models/generals/", "#{model_name}.rb")} exists!"
    end
  end
end
