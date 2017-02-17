class Food
  attr_accessor :id, :ingredient, :spice, :measurement

  def initialize(hash)
    @id = hash["id"]
    @ingredient = hash["ingredient"]
    @spice = hash["spice"]
    @measurement = hash["measurement"]
  end
end