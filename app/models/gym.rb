class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self

  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters
    #Access all memberships
    #our gym?
    #make array of lifters from said memberships
    self.memberships.map do |m|
      m.lifter
    end
  end

  def lifter_names
    #get lifters
    #get names
    self.lifters.map do |l|
      l.name
    end
  end

  def lift_total_for_gym
    lifter_liftable_weight = 0
    #get lifters
    self.lifters.each do |l|
      #add all of their weight
      lifter_liftable_weight += l.lift_total
    end
    lifter_liftable_weight
  end


end
