class ProfilesController < ApplicationController
  def index
    @profiles = current_user.profiles.paginate(:page => params[:page])
  end
  
  def new
    @profile = Profile.new
  end

  def edit
    @profile = current_user.profiles.find(params[:id])
  end
  
  def show
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json {
        json = {}
        json['level'] = @profile.level
        json['energy'] = @profile.energy
        json['stamina'] = @profile.stamina
        json['attack'] = @profile.attack
        json['defense'] = @profile.defense
        json['health'] = @profile.health
        json['army_size'] = @profile.army_size
        json['attack_ia'] = @profile.attack_ia
        json['defense_ia'] = @profile.defense_ia
        json['attack_rune'] = @profile.attack_rune
        json['defense_rune'] = @profile.defense_rune
        json['health_rune'] = @profile.health_rune
        json['damage_rune'] = @profile.damage_rune
        render json: json
      }
    end
  end
  
  def div_stats
    @profile = current_user.profiles.find(params[:id])
    
    @div_weapons = @profile.div_weapons
    @div_powers = @profile.div_powers
    @div_generals = @profile.div_generals
    @div_shields = @profile.div_items('shield')
    @div_helmets = @profile.div_items('helmet')
    @div_armors = @profile.div_items('armor')
    @div_amulets = @profile.div_items('amulet')
    @div_gloves = @profile.div_items('glove')
    @div_boots = @profile.div_items('boot')
    @div_banners = @profile.div_items('banner')
    
    respond_to do |format|
      format.html { render partial: 'div_stats'}
    end
  end
  
  def duel_stats
    @profile = current_user.profiles.find(params[:id])
    
    duel_lookups()
    
    respond_to do |format|
      format.html { render partial: 'duel_stats'}
    end
  end
  
  def war_stats
    @profile = current_user.profiles.find(params[:id])
    
    @war_weapons = @profile.war_weapons
    @war_powers = @profile.war_powers
    @war_generals = @profile.war_generals
    @war_shields = @profile.war_items('shield')
    @war_helmets = @profile.war_items('helmet')
    @war_armors = @profile.war_items('armor')
    @war_amulets = @profile.war_items('amulet')
    @war_gloves = @profile.war_items('glove')
    @war_boots = @profile.war_items('boot')
    @war_banners = @profile.war_items('banner')
    
    respond_to do |format|
      format.html { render partial: 'war_stats'}
    end
  end
  
  def army_stats
    @profile = current_user.profiles.find(params[:id])
    
    @generals_during_attack = @profile.best_recruits((@profile.army_in_use/5.to_f).ceil,'attack')
    @generals_during_defend = @profile.best_recruits((@profile.army_in_use/5.to_f).ceil,'defense')
    @fighters_during_attack = @profile.best_fighters(@profile.army_in_use,'attack')
    @fighters_during_defend = @profile.best_fighters(@profile.army_in_use,'defense')
    @spells_during_attack = @profile.best_spells(@profile.army_in_use,'attack')
    @spells_during_defend = @profile.best_spells(@profile.army_in_use,'defense')
    @arms_during_attack = @profile.best_arms(@profile.army_in_use,'attack')
    @arms_during_defend = @profile.best_arms(@profile.army_in_use,'defense')
    @accessories_during_attack = @profile.best_accessories(@profile.army_in_use,'attack')
    @accessories_during_defend = @profile.best_accessories(@profile.army_in_use,'defense')
    
    respond_to do |format|
      format.html { render partial: 'army_stats'}
    end
  end
  
  def create
    @profile = Profile.new(params[:profile])
    @profile.user = current_user
    @profile.army_bonus = 0
    
    respond_to do |format|
      if @profile.save
        flash[:notice] = 'Profile was successfully created.'
        format.html { redirect_to profile_path(@profile) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update_all
    @profile = current_user.profiles.find(params[:id])
    to_update = params['to_update']
    @results = Hash.new
    @result = @profile.update_stats('keep' => to_update)
    
    respond_to do |format|
      format.html { render partial: 'profiles/changes' }
    end
  end
  
  def update
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Profile was successfully updated.'
        format.html { redirect_to profile_path(@profile) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
    end
  end
  
  def level
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {
          bsi: @profile.bsi, rbsi: @profile.rbsi, ribsi: @profile.ribsi, lsi: @profile.lsi,
          html: render_to_string(partial: 'properties.html.erb')}
        }
      end
    end
  end
  
  def energy
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {lsi: @profile.lsi}}
      end
    end
  end
  
  def stamina
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {lsi: @profile.lsi}}
      end
    end
  end

  def health
    @profile = current_user.profiles.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {success: true}}
      end
    end
  end
  
  def health_rune
    @profile = current_user.profiles.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {success: true}}
      end
    end
  end
  
  def damage_rune
    @profile = current_user.profiles.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {success: true}}
      end
    end
  end
  
  def attack
    @profile = current_user.profiles.find(params[:id])
    
    duel_lookups()
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {
          e_attack: @profile.e_attack.round(1), r_e_attack: @profile.r_e_attack,
          ri_e_attack: @profile.ri_e_attack, e_defense: @profile.e_defense.round(1),
          r_e_defense: @profile.r_e_defense, ri_e_defense: @profile.ri_e_defense,
          bsi: @profile.bsi, rbsi: @profile.rbsi, ribsi: @profile.ribsi}
        }
      end
    end
  end
  
  def attack_rune
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {
          r_e_attack: @profile.r_e_attack, ri_e_attack: @profile.ri_e_attack,
          r_e_defense: @profile.r_e_defense, ri_e_defense: @profile.ri_e_defense,
          rbsi: @profile.rbsi, ribsi: @profile.ribsi}
        }
      end
    end
  end
  
  def attack_ia
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {
          ri_e_attack: @profile.ri_e_attack, ri_e_defense: @profile.ri_e_defense,
          ribsi: @profile.ribsi}
        }
      end
    end
  end
  
  def defense
    @profile = current_user.profiles.find(params[:id])
    
    duel_lookups()
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {
          e_attack: @profile.e_attack.round(1), r_e_attack: @profile.r_e_attack,
          ri_e_attack: @profile.ri_e_attack, e_defense: @profile.e_defense.round(1),
          r_e_defense: @profile.r_e_defense, ri_e_defense: @profile.ri_e_defense,
          bsi: @profile.bsi, rbsi: @profile.rbsi, ribsi: @profile.ribsi}
        }
      end
    end
  end
  
  def defense_rune
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {
          r_e_attack: @profile.r_e_attack, ri_e_attack: @profile.ri_e_attack,
          r_e_defense: @profile.r_e_defense, ri_e_defense: @profile.ri_e_defense,
          rbsi: @profile.rbsi, ribsi: @profile.ribsi}
        }
      end
    end
  end
  
  def defense_ia
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.json { render json: {
          ri_e_attack: @profile.ri_e_attack, ri_e_defense: @profile.ri_e_defense,
          ribsi: @profile.ribsi}
        }
      end
    end
  end
  
  def income_bonus
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { render :partial => 'properties' }
      end
    end
  end
  
  def army_bonus
    @profile = current_user.profiles.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        @generals_during_attack = @profile.best_recruits((@profile.army_in_use/5.to_f).ceil,'attack')
        @generals_during_defend = @profile.best_recruits((@profile.army_in_use/5.to_f).ceil,'defense')
        @fighters_during_attack = @profile.best_fighters(@profile.army_in_use,'attack')
        @fighters_during_defend = @profile.best_fighters(@profile.army_in_use,'defense')
        @spells_during_attack = @profile.best_spells(@profile.army_in_use,'attack')
        @spells_during_defend = @profile.best_spells(@profile.army_in_use,'defense')
        @arms_during_attack = @profile.best_arms(@profile.army_in_use,'attack')
        @arms_during_defend = @profile.best_arms(@profile.army_in_use,'defense')
        @accessories_during_attack = @profile.best_accessories(@profile.army_in_use,'attack')
        @accessories_during_defend = @profile.best_accessories(@profile.army_in_use,'defense')
        
        format.html { render :partial => 'army_stats' }
      end
    end
  end
  
  def updater
    @profile = current_user.profiles.find(params[:id])
  end
  
  def upload_files
    unless current_user.nil?
      @profile = current_user.profiles.find(params[:id])
    
      case params[:Filename]
      when 'land.php', 'land.html', 'land.htm', 'land.php.htm', 'land.php.html'
        @profile.land = params[:file]
      when 'generals.php', 'generals.html', 'generals.htm', 'generals.php.htm', 'generals.php.html'
        @profile.general = params[:file]
      when 'soldiers.php', 'soldiers.html', 'soldiers.htm', 'soldiers.php.htm', 'soldiers.php.html'
        @profile.soldier = params[:file]
      when 'magic.php', 'magic.html', 'magic.htm', 'magic.php.htm', 'magic.php.html'
        @profile.magic = params[:file]
      when 'item.php', 'item.html', 'item.htm', 'item.php.htm', 'item.php.html'
        @profile.item = params[:file]
      when 'keep.php', 'keep.html', 'keep.htm', 'keep.php.htm', 'keep.php.html'
        @profile.keep = params[:file]
      end
          
      respond_to do |format|
        if @profile.save!
          format.all { render :nothing => true, :status => 200 }
        else
          format.all { render :nothing => true, :status => 404 }
        end
      end
    else
      respond_to do |format|
        format.all { render :nothing => true, :status => 404 }
      end
    end
  end
  
  def upload_file
    unless current_user.nil?
      @profile = current_user.profiles.find(params[:id])
      process = []
      my_hash = Hash.new()
      @results = Hash.new()
    
      if params[:attachment]      
        case params[:attachment].original_filename
        when 'land.php', 'land.html', 'land.htm', 'land.php.htm', 'land.php.html'
          @profile.land = params[:attachment]
          process.push("land")
        when 'generals.php', 'generals.html', 'generals.htm', 'generals.php.htm', 'generals.php.html'
          @profile.general = params[:attachment]
          process.push("general")
        when 'soldiers.php', 'soldiers.html', 'soldiers.htm', 'soldiers.php.htm', 'soldiers.php.html'
          @profile.soldier = params[:attachment]
          process.push("soldier")
        when 'magic.php', 'magic.html', 'magic.htm', 'magic.php.htm', 'magic.php.html'
          @profile.magic = params[:attachment]
          process.push("magic")
        when 'item.php', 'item.html', 'item.htm', 'item.php.htm', 'item.php.html'
          @profile.item = params[:attachment]
          process.push("item")
        when 'keep.php', 'keep.html', 'keep.htm', 'keep.php.htm', 'keep.php.html'
          @profile.keep = params[:attachment]
          process.push("keep")
        else
          @results["Error"] = {"File name" => "Invalid"}
        end
    
        if @profile.save!
          process.each do |load|
            unless @profile.send("#{load}_url").nil?
              my_hash[load] = Hash.new
              doc = Nokogiri::HTML(open(@profile.send("#{load}_url")))

              case load
              when 'land'
                parse_land(doc,load,my_hash)
                @profile.remove_land = true
                @profile.save
                @results[load] = @profile.update_lands(my_hash)
              when 'soldier'
                parse_soldiers(doc,load,my_hash)
                @profile.remove_soldier = true
                @profile.save
                @results[load] = @profile.update_soldiers(my_hash)
              when 'magic'
                parse_magic(doc,load,my_hash)
                @profile.remove_magic = true
                @profile.save
                @results[load] = @profile.update_magic(my_hash)
              when 'item'
                parse_items(doc,load,my_hash)
                @profile.remove_item = true
                @profile.save
                @results[load] = @profile.update_items(my_hash)
              when 'general'
                parse_generals(doc,load,my_hash)
                @profile.remove_general = true
                @profile.save
                @results[load] = @profile.update_generals(my_hash)
              when 'keep'
                parse_keep(doc,load,my_hash)
                @profile.remove_keep = true
                @profile.save
                @results[load] = @profile.update_stats(my_hash)
              end
            end
          end
        end
      end
    
      respond_to do |format|
        if @profile && params[:attachment]
          format.html { render :action => "process_data" }
        else
          flash[:alert] = "There was an error processing the files."
          format.html { render :action => "updater" }
        end
      end
    else
      respond_to do |format|
        flash[:alert] = "Please try the \"Single File\" option if you are having problems uploading/processing files."
        format.html { redirect_to root_path }
      end
    end
  end

  def process_data
    unless current_user.nil?
      @profile = current_user.profiles.find(params[:id])
    
      my_hash = Hash.new()
      @results = Hash.new()
    
      ['land','soldier','magic','item','general','keep'].each do |load|
        unless @profile.send("#{load}_url").nil?
          my_hash[load] = Hash.new
          doc = Nokogiri::HTML(open(@profile.send("#{load}_url")))
      
          case load
          when 'land'
            parse_land(doc,load,my_hash)
            @profile.remove_land = true
            @profile.save
            @results[load] = @profile.update_lands(my_hash)
          when 'soldier'
            parse_soldiers(doc,load,my_hash)
            @profile.remove_soldier = true
            @profile.save
            @results[load] = @profile.update_soldiers(my_hash)
          when 'magic'
            parse_magic(doc,load,my_hash)
            @profile.remove_magic = true
            @profile.save
            @results[load] = @profile.update_magic(my_hash)
          when 'item'
            parse_items(doc,load,my_hash)
            @profile.remove_item = true
            @profile.save
            @results[load] = @profile.update_items(my_hash)
          when 'general'
            parse_generals(doc,load,my_hash)
            @profile.remove_general = true
            @profile.save
            @results[load] = @profile.update_generals(my_hash)
          when 'keep'
            parse_keep(doc,load,my_hash)
            @profile.remove_keep = true
            @profile.save
            @results[load] = @profile.update_stats(my_hash)
          end
        end
      end
    
      respond_to do |format|
        if @profile
          format.html
        else
          flash[:alert] = "There was an error processing the files."
          format.html { render :action => "updater" }
        end
      end
    else
      respond_to do |format|
        flash[:alert] = "Please try the \"Single File\" option if you are having problems uploading/processing files."
        format.html { redirect_to root_path }
      end
    end
  end
  
  # def process_data_bak
  #   unless current_user.nil?
  #     @profile = current_user.profiles.find(params[:id])
  #   
  #     my_hash = Hash.new()
  #     @results = Hash.new()
  #   
  #     ['land','soldier','magic','item','general','keep'].each do |load|
  #       if File.exists?(@profile.send("#{load}_file").url(:original, timestamp: false))
  #         my_hash[load] = Hash.new
  #         doc = Nokogiri::HTML(open(@profile.send("#{load}_file").url(:original, timestamp: false)))
  #     
  #         case load
  #         when 'land'
  #           parse_land(doc,load,my_hash)
  #           @profile.land_file.destroy
  #           @results[load] = @profile.update_lands(my_hash)
  #         when 'soldier'
  #           parse_soldiers(doc,load,my_hash)
  #           @profile.soldier_file.destroy
  #           @results[load] = @profile.update_soldiers(my_hash)
  #         when 'magic'
  #           parse_magic(doc,load,my_hash)
  #           @profile.magic_file.destroy
  #           @results[load] = @profile.update_magic(my_hash)
  #         when 'item'
  #           parse_items(doc,load,my_hash)
  #           @profile.item_file.destroy
  #           @results[load] = @profile.update_items(my_hash)
  #         when 'general'
  #           parse_generals(doc,load,my_hash)
  #           @profile.general_file.destroy
  #           @results[load] = @profile.update_generals(my_hash)
  #         when 'keep'
  #           parse_keep(doc,load,my_hash)
  #           @profile.keep_file.destroy
  #           @results[load] = @profile.update_stats(my_hash)
  #         end
  #       end
  #     end
  #   
  #     respond_to do |format|
  #       if @profile
  #         format.html
  #       else
  #         flash[:alert] = "There was an error processing the files."
  #         format.html { render :action => "updater" }
  #       end
  #     end
  #   else
  #     respond_to do |format|
  #       flash[:alert] = "Please try the \"Single File\" option if you are having problems uploading/processing files."
  #       format.html { redirect_to root_path }
  #     end
  #   end
  # end
  
  protected
    def duel_lookups
      @duel_weapons = @profile.duel_weapons
      @duel_powers = @profile.duel_powers
      @duel_shields = @profile.duel_items('shield')
      @duel_helmets = @profile.duel_items('helmet')
      @duel_armors = @profile.duel_items('armor')
      @duel_amulets = @profile.duel_items('amulet')
      @duel_gloves = @profile.duel_items('glove')
      @duel_boots = @profile.duel_items('boot')
      @duel_banners = @profile.duel_items('banner')
    end

    def parse_generals(doc=nil,load=nil,my_hash=nil)
      (doc/"div.generalSmallContainer2").each do |general|
        name = (general/"div.general_name_div3_padding").inner_text.strip
        level = (general/"div//div[text()*='Level ']").inner_html.strip.scan(/\d+/).first.to_i
        
        my_hash[load][name] = level
      end
      
      return my_hash
    end
    
    def parse_land(doc=nil,load=nil,my_hash=nil)
      (doc/"div[@style]").each do |land|
        next unless land[:style].match(/town_land_bar*/)
        next if land[:style].match(/town_land_bar_closed/)
        
        name = (land/"div/div/strong").first.inner_html.strip
        owned = (land/"div/div//span[text()*='Owned:']").inner_html.strip.scan(/\d+/).first.to_i
        
        my_hash[load][name] = owned
      end
      
      return my_hash
    end
    
    def parse_soldiers(doc=nil,load=nil,my_hash=nil)
      (doc/"div[@style]").each do |buy_soldier|
        next unless buy_soldier[:style].match(/town_unit_bar*/)
        next if buy_soldier[:style].match(/town_unit_bar_closed/)

        name = (buy_soldier/"div/div/strong").first.inner_html.strip
        attack = (buy_soldier/"div/div/div[text()*='Attack']").inner_html.strip.scan(/\d+/).first.to_i
        defense = (buy_soldier/"div/div/div[text()*='Defense']").inner_html.strip.strip.scan(/\d+/).first.to_i
        owned = (buy_soldier/"div/div//span[text()*='Owned:']").inner_html.strip.scan(/\d+/).first.to_i

        my_hash[load][name] = {owned: owned, attack: attack, defense: defense}
      end
      
      return my_hash
    end
    
    def parse_magic(doc=nil,load=nil,my_hash=nil)
      (doc/"div[@style]").each do |buy_power|
        next unless buy_power[:style].match(/town_unit_bar*/)
        next if buy_power[:style].match(/town_unit_bar_closed/)

        name = (buy_power/"div/div/strong").first.inner_html.strip
        attack = (buy_power/"div/div/div[text()*='Attack']").inner_html.strip.scan(/\d+/).first.to_i
        defense = (buy_power/"div/div/div[text()*='Defense']").inner_html.strip.strip.scan(/\d+/).first.to_i
        owned = (buy_power/"div/div//span[text()*='Owned:']").inner_html.strip.scan(/\d+/).first.to_i

        my_hash[load][name] = {owned: owned, attack: attack, defense: defense}
      end
      
      return my_hash
    end
    
    def parse_items(doc=nil,load=nil,my_hash=nil)
      (doc/"div[@style]").each do |buy_thing|
        next unless buy_thing[:style].match(/town_unit_bar*/)
        next if buy_thing[:style].match(/town_unit_bar_closed/)

        name = (buy_thing/"div/div/strong").first.inner_html.strip
        attack = (buy_thing/"div/div/div[text()*='Attack']").inner_html.strip.scan(/\d+/).first.to_i
        defense = (buy_thing/"div/div/div[text()*='Defense']").inner_html.strip.strip.scan(/\d+/).first.to_i
        owned = (buy_thing/"div/div//span[text()*='Owned:']").inner_html.strip.scan(/\d+/).first.to_i

        my_hash[load][name] = {owned: owned, attack: attack, defense: defense}
      end
      
      return my_hash
    end
    
    def parse_keep(doc=nil,load=nil,my_hash=nil)
      my_hash[load][:level] = doc.at_css('div#main_sts_container').try(:text).try(:match,/Level: (\d+)/).try(:captures).try(:first) || @profile.level
      my_hash[load][:energy] = doc.at_css('div#energy_max').try(:previous_element).try(:text).try(:strip) || @profile.energy
      my_hash[load][:stamina] = doc.at_css('div#stamina_max').try(:previous_element).try(:text).try(:strip) || @profile.stamina
      my_hash[load][:attack] = doc.at_css('div#attack').try(:previous_element).try(:text).try(:strip).try(:match,/\d+/).try(:to_s) || @profile.attack
      my_hash[load][:defense] = doc.at_css('div#defense').try(:previous_element).try(:text).try(:strip).try(:match,/\d+/).try(:to_s) || @profile.defense
      my_hash[load][:health] = doc.at_css('div#health_max').try(:previous_element).try(:text).try(:strip).try(:match,/\d+/).try(:to_s) || @profile.health
      my_hash[load][:army_size] = doc.at_css('div#army_desc').try(:previous_element).try(:text).try(:strip).try(:match,/\d+/).try(:to_s) || @profile.army_size
      my_hash[load][:attack_rune] = doc.at_css('div#runes_2').try(:text).try(:match,/(\d+) (Atk|Attack)/).try(:captures).try(:first) || @profile.attack_rune
      my_hash[load][:attack_ia] = doc.at_css('div#attack').try(:text).try(:match,/(\d+) Item Archive Bonus/).try(:captures).try(:first) || @profile.attack_ia
      my_hash[load][:defense_rune] = doc.at_css('div#runes_2').try(:text).try(:match,/(\d+) (Def|Defense)/).try(:captures).try(:first) || @profile.defense_rune
      my_hash[load][:defense_ia] = doc.at_css('div#defense').try(:text).try(:match,/(\d+) Item Archive Bonus/).try(:captures).try(:first) || @profile.defense_ia
      my_hash[load][:damage_rune] = doc.at_css('div#runes_2').try(:text).try(:match,/(\d+) (Dmg|Damage)/).try(:captures).try(:first) || @profile.damage_rune
      my_hash[load][:health_rune] = doc.at_css('div#runes_2').try(:text).try(:match,/(\d+) (Hth|Health)/).try(:captures).try(:first) || @profile.health_rune
      
      return my_hash
    end
end