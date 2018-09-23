
class Lifter
  @@all = []


  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def sign_up(cost, gym)
    #Create membership
    Membership.new(self, gym, cost)
  end

  def memberships
    #Access membership => [memberships]
    #Select all memberships for specific member
    Membership.all.select do |m|
      #compare whether or not lifter property == this lifter
      m.lifter == self
    end

  end

  def gyms
    #Access the Memberships.all array
    #Determine whether or not the memberships are mine/lifters
    my_memberships = self.memberships
    #create array of gyms from the memberships array
    my_memberships.map do |m|
      m.gym
    end
  end

  def total_cost
    total_cost = 0
    self.memberships.each do |membership|
      member_cost = membership.cost
      total_cost += member_cost
    end
    total_cost
  end

##### Class Methods
  def self.all
    @@all
  end

  def self.average_lift
  all_lifter_total = 0
  total_lifters = 0
    all.each do |lifter|
      ind_total = lifter.lift_total
      all_lifter_total += ind_total
      total_lifters += 1
    end
    all_lifter_total / total_lifters
  end

end ### End of Lifter Class
