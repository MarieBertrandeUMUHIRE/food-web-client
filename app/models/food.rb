class Food
  attr_accessor :id, :ingredient, :spice, :measurement

  def initialize(hash)
    @id = hash["id"]
    @ingredient = hash["ingredient"]
    @spice = hash["spice"]
    @measurement = hash["measurement"]
  end

  def self.find(id)
    food_hash = Unirest.get("http://localhost:3000/api/v2/foods.json", :headers => {"Accept"=> "application/json", "X-User-Email" => "berryumuhire@yahoo.com",
"Authorization" => "Token token=2020"}).body
    @food = Food.new(food_hash)
  end

  def self.all
    food_hashes = Unirest.get("http://localhost:3000/api/v2/foods.json", :headers => {"Accept"=> "application/json", "X-User-Email" => "berryumuhire@yahoo.com",
"Authorization" => "Token token=2020"}).body
     foods = []
      food_hashes.each do |food_hash|
     foods << Food.new(food_hash)
    end
   return foods
  end

  def destroy
   @food = Unirest.delete("http://localhost:3000/api/v2/foods/#{id}.json").body
  end

  def create
    food_hash = Unirest.post("http://localhost:3000/api/v2/foods.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement],}).body
    @food = Food.new(food_hash)
    @food.save
   
  end
end