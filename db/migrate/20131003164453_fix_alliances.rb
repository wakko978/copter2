class FixAlliances < ActiveRecord::Migration
  def up
    ## Was used to fix alliances and now, with the change to allow generals to be linked in many alliances, this code would break
    
    # bad_alliances1 = Alliance.where("primary_link = secondary_link or secondary_link = tertiary_link or primary_link = tertiary_link")
    # bad_alliances1.each do |ba|
    #   ba.destroy
    # end
    #
    # recruits = Recruit.includes(:primary_alliance,:secondary_alliance,:tertiary_alliance)
    #   .where("alliances.primary_link IS NOT NULL OR alliances.secondary_link IS NOT NULL OR alliances.tertiary_link IS NOT NULL")
    # recruits.each do |r|
    #   if r.primary_alliance and (r.secondary_alliance or r.tertiary_alliance)
    #     r.profile.alliances.destroy_all
    #   end
    # end
  end

  def down
  end
end
