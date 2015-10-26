#require 'file_size_validator'
class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :properties, :dependent => :destroy
  has_many :fighters, :dependent => :destroy
  has_many :spells, :dependent => :destroy
  has_many :arms, :dependent => :destroy
  has_many :accessories, :dependent => :destroy
  has_many :recruits, :dependent => :destroy
  has_many :loadouts, :dependent => :destroy
  has_many :alliances, :dependent => :destroy
  has_many :lands, :through => :properties
  has_many :soldiers, :through => :fighters
  has_many :powers, :through => :spells
  has_many :weapons, :through => :arms
  has_many :items, :through => :accessories
  has_many :generals, :through => :recruits
  # TODO: Add monster loot storage and graphics?
  # TODO: Transfer users from old to new
  
  attr_accessible :name, :attack, :defense, :energy, :stamina, :level, :e_attack,
    :e_defense, :health, :army_size, :income_bonus, :army_bonus, :attack_rune, :defense_rune,
    :health_rune, :damage_rune, :attack_ia, :defense_ia, :land, :general, :soldier, :item, :magic, :keep
  
  validates :name, :presence => true
  validates :attack, :defense, :energy, :stamina, :level, :health, :army_size, :attack_rune,
    :defense_rune, :health_rune, :damage_rune, :attack_ia, :defense_ia,
    :presence => true, :numericality => { :only_integer => true }
  validates :army_bonus, :income_bonus, :numericality => true
  
  before_save :update_e_attack
  before_save :update_e_defense
  after_create :populate_lands
  
  # validates :land, :general, :soldier, :item, :magic, :keep,
  #   :file_size => { :in => 0..5.megabytes }
  
  # mount_uploader :keep, ProfileUploader
  # mount_uploader :land, ProfileUploader
  # mount_uploader :general, ProfileUploader
  # mount_uploader :soldier, ProfileUploader
  # mount_uploader :item, ProfileUploader
  # mount_uploader :magic, ProfileUploader
  
  cattr_reader :per_page
  @@per_page = 25
  @permitted_columns = ['name','attack','defense','e_attack','e_defense','level','health','energy','army_size']
    
  def update_e_attack
    self.e_attack = (attack + defense*0.7).round(1)
  end
  
  def update_e_defense
    self.e_defense = (defense + attack*0.7).round(1)
  end
  
  def populate_lands
    ### Add zero properites for each land
    Land.all.each do |land|
      self.properties.create(:land_id => land.id, :owned => 0)
    end
  end
  
  def r_attack
    attack + attack_rune
  end
  
  def ri_attack
    attack + attack_rune + attack_ia
  end
  
  def r_e_attack
    (r_attack + r_defense*0.7).round(1)
  end
  
  def ri_e_attack
    (ri_attack + ri_defense*0.7).round(1)
  end
  
  def r_defense
    defense + defense_rune
  end
  
  def ri_defense
    defense + defense_rune + defense_ia
  end
  
  def r_e_defense
    (r_defense + r_attack*0.7).round(1)
  end
  
  def ri_e_defense
    (ri_defense + ri_attack*0.7).round(1)
  end
  
  def bsi
    ((attack.to_f + defense.to_f) / level.to_f).round(2)
  end
  
  def rbsi
    ((r_attack.to_f + r_defense.to_f) / level.to_f).round(2)
  end
  
  def ribsi
    ((ri_attack.to_f + ri_defense.to_f) / level.to_f).round(2)
  end
  
  def lsi
    ((energy.to_f + stamina.to_f*2.0) / level.to_f).round(2)
  end
  
  def army_in_use
    if army_size.nil?
      return 0
    else
      if army_size >= 501 && army_size <= (501 + army_bonus)
        return army_size
      elsif army_size >= (501 + army_bonus)
        return 501 + army_bonus
      else
        return army_size + army_bonus
      end
    end
  end
  
  def max_property
    (((level.to_f / 10.0).ceil) * 10.0).to_i
  end
  
  def upkeep
    self.generals.sum("generals.upkeep").to_i +
    self.fighters.joins(:soldier).sum("soldiers.upkeep * fighters.owned").to_i +
    self.arms.joins(:weapon).sum("weapons.upkeep * arms.owned").to_i +
    self.accessories.joins(:item).sum("items.upkeep * accessories.owned").to_i
  end
  
  def total_income
    (self.properties.joins(:land).sum(
      "(CASE WHEN properties.owned >= #{max_property} THEN #{max_property}
        ELSE properties.owned END) * lands.income").to_f * income_bonus).to_i
  end
  
  def cash_flow
    total_income - upkeep
  end
  
  def inventory_count(association,item_name)
    lookup = self.send(association.pluralize.to_sym).select("owned").where(name: item_name)
    lookup.empty? ? 0 : lookup.first.owned
  end
  
  def inventory_exists?(association,item_name)
    lookup = self.send(association.pluralize.to_sym).select("owned").where(name: item_name)
    lookup.empty? ? false : true
  end
  
  #### START DIVINE METHODS ###############################
  def div_generals
    generals = {}
    generals[:best] = self.generals.where("div_power IS NOT NULL").order("div_power DESC").first
    generals[:better] = General.where("div_power IS NOT NULL")
      .where(["div_power > ?",generals[:best].nil? ? 0 : generals[:best].div_power])
      .where(["id <> ?",generals[:best].nil? ? 0 : generals[:best].id]).order("div_power DESC")
    return generals
  end
  
  def div_weapons
    weapons = {}
    weapons[:best] = self.weapons.where("div_power IS NOT NULL")
      .where("owned > 0").order("div_power DESC").first
    weapons[:better] = Weapon.where("div_power IS NOT NULL")
      .where(["div_power > ?",weapons[:best].nil? ? 0 : weapons[:best].div_power])
      .where(["id <> ?",weapons[:best].nil? ? 0 : weapons[:best].id]).order("div_power DESC")
    return weapons
  end
  
  def div_items(item_type=nil)
    items = {}
    items[:best] = self.items.send(item_type.to_sym).where("div_power IS NOT NULL")
      .where("owned > 0").order("div_power DESC").first
    items[:better] = Item.send(item_type.to_sym).where("div_power IS NOT NULL")
      .where(["div_power > ?",items[:best].nil? ? 0 : items[:best].div_power])
      .where(["id <> ?",items[:best].nil? ? 0 : items[:best].id]).order("div_power DESC")
    return items
  end
  
  def div_powers
    power = {}
    power[:best] = self.powers.where("div_power IS NOT NULL")
      .where("owned > 0").order("div_power DESC").first
    power[:better] = Power.where("div_power IS NOT NULL")
      .where(["div_power > ?",power[:best].nil? ? 0 : power[:best].div_power])
      .where(["id <> ?",power[:best].nil? ? 0 : power[:best].id]).order("div_power DESC")
    return power
  end
  #### END DIVINE METHODS ###############################
  
  #### START WAR METHODS ###############################
  def war_generals
    generals = {}
    generals[:best_attack] = self.best_recruits(6,'e_attack_no_mod')
    generals[:best_defense] = self.best_recruits(6,'e_defense_no_mod')
    generals[:better_attack] = General
      .where(["e_attack > ?",generals[:best_attack].empty? ? 0 : generals[:best_attack].last.e_attack])
      .where(["id NOT IN (?)",generals[:best_attack].empty? ? 0 : generals[:best_attack].collect{|i| i.general_id}])
      .order("e_attack DESC")

    ### Add Self to top of list
    generals[:best_attack].unshift({:name => 'Self', :attack => self.attack, :defense => self.defense, :ri_e_attack => self.ri_e_attack, :ri_e_defense => self.ri_e_defense})

    generals[:better_defense] = General
      .where(["e_defense > ?",generals[:best_defense].empty? ? 0 : generals[:best_defense].last.e_defense])
      .where(["id NOT IN (?)",generals[:best_defense].empty? ? 0 : generals[:best_defense].collect{|i| i.general_id}])
      .order("e_defense DESC")

    ### Add Self to top of list
    generals[:best_defense].unshift({:name => 'Self', :attack => self.attack, :defense => self.defense, :ri_e_attack => self.ri_e_attack, :ri_e_defense => self.ri_e_defense})
    return generals
  end
  
  def war_weapons
    weapons = {}
    weapons[:best_attack] = self.best_arms(7,'attack',3)
    weapons[:best_defense] = self.best_arms(7,'defense',3)
    weapons[:better_attack] = Weapon
      .where(["e_attack > ?",weapons[:best_attack].empty? ? 0 : weapons[:best_attack].last.e_attack])
      .where(["id NOT IN (?)",weapons[:best_attack].empty? ? 0 : weapons[:best_attack].collect{|i| i.id}])
      .order("e_attack DESC")
    weapons[:better_defense] = Weapon
      .where(["e_defense > ?",weapons[:best_defense].empty? ? 0 : weapons[:best_defense].last.e_defense])
      .where(["id NOT IN (?)",weapons[:best_defense].empty? ? 0 : weapons[:best_defense].collect{|i| i.id}])
      .order("e_defense DESC")
    return weapons
  end
  
  def war_items(item_type=nil)
    items = {}
    items[:best_attack] = self.best_accessories(7,'attack',3,item_type)
    items[:best_defense] = self.best_accessories(7,'defense',3,item_type)
    items[:better_attack] = Item.send(item_type.to_sym)
      .where(["e_attack > ?",items[:best_attack].empty? ? 0 : items[:best_attack].last.e_attack])
      .where(["id NOT IN (?)",items[:best_attack].empty? ? 0 : items[:best_attack].collect{|i| i.id}])
      .order("e_attack DESC")
    items[:better_defense] = Item.send(item_type.to_sym)
      .where(["e_defense > ?",items[:best_defense].empty? ? 0 : items[:best_defense].last.e_defense])
      .where(["id NOT IN (?)",items[:best_defense].empty? ? 0 : items[:best_defense].collect{|i| i.id}])
      .order("e_defense DESC")
    return items
  end
  
  def war_powers
    powers = {}
    powers[:best_attack] = self.best_spells(7,'attack',3)
    powers[:best_defense] = self.best_spells(7,'defense',3)
    powers[:better_attack] = Power
      .where(["e_attack > ?",powers[:best_attack].empty? ? 0 : powers[:best_attack].last.e_attack])
      .where(["id NOT IN (?)",powers[:best_attack].empty? ? 0 : powers[:best_attack].collect{|i| i.id}])
      .order("e_attack DESC")
    powers[:better_defense] = Power
      .where(["e_defense > ?",powers[:best_defense].empty? ? 0 : powers[:best_defense].last.e_defense])
      .where(["id NOT IN (?)",powers[:best_defense].empty? ? 0 : powers[:best_defense].collect{|i| i.id}])
      .order("e_defense DESC")
    return powers
  end
  #### END WAR METHODS ###############################
  
  #### START DUEL METHODS ###############################
  def duel_weapons
    weapons = {}
    weapons[:best_attack] = self.weapons.where("owned > 0").order("e_attack DESC").first
    weapons[:best_defense] = self.weapons.where("owned > 0").order("e_defense DESC").first
    weapons[:better_attack] = Weapon
      .where(["e_attack > ?",weapons[:best_attack].nil? ? 0 : weapons[:best_attack].e_attack])
      .where(["id <> ?",weapons[:best_attack].nil? ? 0 : weapons[:best_attack].id])
      .order("e_attack DESC")
    weapons[:better_defense] = Weapon
      .where(["e_defense > ?",weapons[:best_defense].nil? ? 0 : weapons[:best_defense].e_defense])
      .where(["id <> ?",weapons[:best_defense].nil? ? 0 : weapons[:best_defense].id])
      .order("e_defense DESC")
    return weapons
  end
  
  def duel_items(item_type)
    items = {}
    items[:best_attack] = self.items.send(item_type.to_sym).where("owned > 0").order("e_attack DESC").first
    items[:best_defense] = self.items.send(item_type.to_sym).where("owned > 0").order("e_defense DESC").first
    items[:better_attack] = Item.send(item_type.to_sym)
      .where(["e_attack > ?",items[:best_attack].nil? ? 0 : items[:best_attack].e_attack])
      .where(["id <> ?",items[:best_attack].nil? ? 0 : items[:best_attack].id])
      .order("e_attack DESC")
    items[:better_defense] = Item.send(item_type.to_sym)
      .where(["e_defense > ?",items[:best_defense].nil? ? 0 : items[:best_defense].e_defense])
      .where(["id <> ?",items[:best_defense].nil? ? 0 : items[:best_defense].id])
      .order("e_defense DESC")
    return items
  end
  
  def duel_powers
    powers = {}
    powers[:best_attack] = self.powers.where("owned > 0").order("e_attack DESC").first
    powers[:best_defense] = self.powers.where("owned > 0").order("e_defense DESC").first
    powers[:better_attack] = Power
      .where(["e_attack > ?",powers[:best_attack].nil? ? 0 : powers[:best_attack].e_attack])
      .where(["id <> ?",powers[:best_attack].nil? ? 0 : powers[:best_attack].id])
      .order("e_attack DESC")
    powers[:better_defense] = Power
      .where(["e_defense > ?",powers[:best_defense].nil? ? 0 : powers[:best_defense].e_defense])
      .where(["id <> ?",powers[:best_defense].nil? ? 0 : powers[:best_defense].id])
      .order("e_defense DESC")
    return powers
  end
  #### END DUEL METHODS ###############################
  
  #### START BEST COLLECTION METHODS ##################
  def best_recruits(kount=0,stat=nil)
    @recruits = self.recruits.all
    
    @recruits.sort!{|a,b|
      b.send(stat) <=> a.send(stat)
    }
    
    return @recruits[0,kount]
  end
  
  def best_fighters(kount=0,stat=nil)
    @fighters = Fighter.find_by_sql(
      "SELECT s.name, s.e_#{stat}, f.owned, s.id, s.attack, s.defense
         FROM fighters f, soldiers s
        WHERE s.id = f.soldier_id
          AND f.profile_id = #{self.id}
          AND f.owned > 0
        ORDER BY s.e_#{stat} DESC"
    )
    
    total = @fighters.collect{|i| i.owned}.sum
    
    if total <= kount
      return @fighters
    else
      index = 0
      running_total = 0
      while running_total < kount
        running_total += @fighters[index].owned
        index += 1
      end
      
      if running_total > kount
        @fighters[index-1].owned -= (running_total - kount)
      end
      
      return @fighters[0,index]
    end
  end
  
  def best_arms(kount=0,stat=nil,limit=nil)
    @arms = Arm.find_by_sql(
      "SELECT s.name, s.e_#{stat}, f.owned, s.id, s.attack, s.defense
         FROM arms f, weapons s
        WHERE s.id = f.weapon_id
          AND f.profile_id = #{self.id}
          AND f.owned > 0
        ORDER BY s.e_#{stat} DESC"
    )
    
    total = @arms.collect{|i| i.owned}.sum
    
    if (limit.nil? && total <= kount) || (!limit.nil? && total <= kount)
      return @arms
    else
      index = 0
      running_total = 0
      while running_total < kount
        if limit.nil?
          running_total += @arms[index].owned
        elsif @arms[index].nil?
          kount = running_total
        elsif limit > 0
          running_total += (@arms[index].owned <= limit ? @arms[index].owned : @arms[index].owned = limit)
        end
        index += 1
      end
      
      if running_total > kount
        @arms[index-1].owned -= (running_total - kount)
      end
      
      return @arms[0,index]
    end
  end
  
  def best_accessories(kount=0,stat=nil,limit=nil,item_type=nil)
    @accessories = Accessory.find_by_sql(
      "SELECT s.name, s.e_#{stat}, f.owned, s.id, s.attack, s.defense, s.type
         FROM accessories f, items s
        WHERE s.id = f.item_id
          AND f.profile_id = #{self.id}" +
      (item_type.nil? ? '' : " AND s.type = 'Item::#{item_type.titleize}'") +
      "   AND f.owned > 0
        ORDER BY s.e_#{stat} DESC"
    )
    
    total = @accessories.collect{|i| i.owned}.sum
    
    if (limit.nil? && total <= kount) || (!limit.nil? && total <= kount)
      return @accessories
    else
      index = 0
      running_total = 0
      while running_total < kount
        if limit.nil?
          running_total += @accessories[index].owned
        elsif @accessories[index].nil?
          kount = running_total
        elsif limit > 0
          running_total += (@accessories[index].owned <= limit ? @accessories[index].owned : @accessories[index].owned = limit)
        end
        index += 1
      end
      
      if running_total > kount
        @accessories[index-1].owned -= (running_total - kount)
      end
      
      return @accessories[0,index]
    end
  end
  
  def best_spells(kount=0,stat=nil,limit=nil)
    @spells = Spell.find_by_sql(
      "SELECT s.name, s.e_#{stat}, f.owned, s.id, s.attack, s.defense
         FROM spells f, powers s
        WHERE s.id = f.power_id
          AND f.profile_id = #{self.id}
          AND f.owned > 0
        ORDER BY s.e_#{stat} DESC"
    )
    
    total = @spells.collect{|i| i.owned}.sum
    
    if (limit.nil? && total <= kount) || (!limit.nil? && total <= kount)
      return @spells
    else
      index = 0
      running_total = 0
      while running_total < kount
        if limit.nil?
          running_total += @spells[index].owned
        elsif @spells[index].nil?
          kount = running_total
        elsif limit > 0
          running_total += (@spells[index].owned <= limit ? @spells[index].owned : @spells[index].owned = limit)
        end
        index += 1
      end
      
      if running_total > kount
        @spells[index-1].owned -= (running_total - kount)
      end
      
      return @spells[0,index]
    end
  end
  #### END BEST COLLECTION METHODS ##################
  
  #### START UPDATE METHODS #########################
  def update_generals(data)
    results = {}
    i = 0
    data['general'].each do |name,level_promo|
      (level,promo) = level_promo.split(":")
      if (recruit = self.recruits.includes(:general).where(["generals.name = ?",name]).first)
        recruit.update_attributes(:level => level, :promote_level => promo)
        changes = recruit.previous_changes
        results[name] = "Set to level #{level}, #{promo} Star(s)" unless changes.empty?
        i += 1 unless (changes[:level].nil? or changes[:promote_level].nil?)
      else
        general = General.find_by_name(name)
        
        if general
          self.recruits.create(:general_id => general.id, :level => level, :promote_level => promo)
          results[name] = "Added at level #{level}, #{promo} Star(s)"
          i += 1
        else
          UserMailer.notify_admin("#{name}",self).deliver
          results[name] = 'Not found'
        end
      end
    end
    
    results.merge!({'Changed' => "#{i} Generals"})
    return results
  end
  
  def update_lands(data)
    results = {}
    i = 0
    data['land'].each do |name,owned|
      if (property = self.properties.includes(:land).where(["lands.name = ?",name]).first)
        property.update_attributes(:owned => owned)
        changes = property.previous_changes
        results[name] = textualize_change(changes[:owned]) unless changes[:owned].nil?
        i += 1 unless changes[:owned].nil?
      else
        land = Land.find_by_name(name)
        
        if land
          self.properties.create(:land_id => land.id, :owned => owned)
          results[name] = "Added #{owned}"
          i += 1
        else
          UserMailer.notify_admin("#{name}",self).deliver
          results[name] = 'Not found'
        end
      end
    end
    
    results.merge!({'Changed' => "#{i} Lands"})
    return results
  end
  
  def update_soldiers(data)
    results = {}
    i = 0
    data['soldier'].each do |name,data|
      if (fighter = self.fighters.includes(:soldier).where(["soldiers.name = ? AND soldiers.attack = ? AND soldiers.defense = ?",name,data[:attack],data[:defense]]).first)
        fighter.update_attributes(:owned => data[:owned])
        changes = fighter.previous_changes
        results[name] = textualize_change(changes[:owned]) unless changes[:owned].nil?
        i += 1 unless changes[:owned].nil?
      else
        soldier = Soldier.find_by_name_and_attack_and_defense(name,data[:attack],data[:defense])
        
        if soldier
          self.fighters.create(:soldier_id => soldier.id, :owned => data.kind_of?(Integer) ? data : data[:owned])
          results[name] = "Added #{data[:owned]}"
          i += 1
        else
          UserMailer.notify_admin("#{name} #{data[:attack]}/#{data[:defense]}",self).deliver
          results[name] = 'Not found'
        end
      end
    end
    
    results.merge!({'Changed' => "#{i} Soldiers"})
    return results
  end
  
  def update_items(data)
    results = {}
    i = 0
    data['item'].each do |name,data|
      ### Special case for Bladebourne Gauntlet
      name = (name == 'Bladebounrne Gauntlet' ? 'Bladebourne Gauntlet' : name)
      
      if (accessory = self.accessories.includes(:item).where(["items.name = ? AND items.attack = ? AND items.defense = ?",name,data[:attack],data[:defense]]).first)
        accessory.update_attributes(:owned => data[:owned])
        changes = accessory.previous_changes
        results[name] = textualize_change(changes[:owned]) unless changes[:owned].nil?
        i += 1 unless changes[:owned].nil?
      elsif (arm = self.arms.includes(:weapon).where(["weapons.name = ? AND weapons.attack = ? AND weapons.defense = ?",name,data[:attack],data[:defense]]).first)
        arm.update_attributes(:owned => data[:owned])
        changes = arm.previous_changes
        results[name] = textualize_change(changes[:owned]) unless changes[:owned].nil?
        i += 1 unless changes[:owned].nil?
      else
        if (item = Item.find_by_name_and_attack_and_defense(name,data[:attack],data[:defense]))
          self.accessories.create(:item_id => item.id, :owned => data[:owned])
          results[name] = "Added #{data[:owned]}"
          i += 1
        elsif (weapon = Weapon.find_by_name_and_attack_and_defense(name,data[:attack],data[:defense]))
          self.arms.create(:weapon_id => weapon.id, :owned => data[:owned])
          results[name] = "Added #{data[:owned]}"
          i += 1
        else
          UserMailer.notify_admin("#{name} #{data[:attack]}/#{data[:defense]}",self).deliver
          results[name] = 'Not found'
        end
      end
    end
    
    results.merge!({'Changed' => "#{i} Items"})
    return results
  end
  
  def update_magic(data)
    results = {}
    i = 0
    data['magic'].each do |name,data|
      if (spell = self.spells.includes(:power).where(["powers.name = ? AND powers.attack = ? AND powers.defense = ?",name,data[:attack],data[:defense]]).first)
        spell.update_attributes(:owned => data[:owned])
        changes = spell.previous_changes
        results[name] = textualize_change(changes[:owned]) unless changes[:owned].nil?
        i += 1 unless changes[:owned].nil?
      else
        power = Power.find_by_name_and_attack_and_defense(name,data[:attack],data[:defense])
        
        if power
          self.spells.create(:power_id => power.id, :owned => data[:owned])
          results[name] = "Added #{data[:owned]}"
          i += 1
        else
          UserMailer.notify_admin("#{name} #{data[:attack]}/#{data[:defense]}",self).deliver
          results[name] = 'Not found'
        end
      end
    end
    
    results.merge!({'Changed' => "#{i} Magic"})
    return results
  end
  
  def update_stats(data)
    results = {}
    i = 0
    
    data = data['keep']
    
    self.update_attributes(
      :level => data[:level].to_i,
      :energy => data[:energy].to_i,
      :stamina => data[:stamina].to_i,
      :army_size => data[:army_size].to_i,
      :health => data[:health].to_i,
      :attack => data[:attack].to_i,
      :defense => data[:defense].to_i,
      :attack_rune => data[:attack_rune].to_i,
      :attack_ia => data[:attack_ia] == 0 ? self.attack_ia : data[:attack_ia].to_i,
      :defense_rune => data[:defense_rune].to_i,
      :defense_ia => data[:defense_ia] == 0 ? self.defense_ia : data[:defense_ia].to_i,
      :health_rune => data[:health_rune].to_i,
      :damage_rune => data[:damage_rune].to_i
    )
    
    changes = self.previous_changes.to_hash
    changes.each do |name,c|
      results[name.titleize] = textualize_change(c) if ['level','energy','stamina','attack','defense','health','attack_rune','attack_ia',
        'defense_rune','defense_ia','health_rune','damage_rune','army_size','e_attack','e_defense'].include?(name)
    end
    
    results.merge!({'Changed' => "Nothing"}) if results.empty?
    return results
  end
  #### END UPDATE METHODS #########################
  
  def textualize_change(change)
    if change.nil?
      "No change"
    else
      diff = change[0] - change[1]
      if diff > 0
        "Decreased by #{diff.round(1)}"
      elsif diff < 0
        "Increased by #{diff.abs.round(1)}"
      end
    end
  end
end
