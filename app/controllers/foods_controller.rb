class FoodsController < ApplicationController
  def index
    @foods = Unirest.get("http://localhost:3000/api/v2/foods.json").body
  end

  def show
    food_hash = Unirest.get("http://localhost:3000/api/v2/foods/#{params[:id]}.json").body
    @food = Food.new(food_hash)

  end

  def new
  end

  def create
   @food = Unirest.post("http://localhost:3000/api/v2/foods.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement],}).body
   redirect_to "/foods/#{@food['id']}"
 end
 def edit
   @food = Unirest.get("http://localhost:3000/api/v2/foods/#{params[:id]}.json").body
 end
 
 def update
   @food = Unirest.patch("http://localhost:3000/api/v2/foods/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement],}).body
   redirect_to "/foods/#{@food['id']}"
 end
 
 def destroy
  @food = Unirest.delete("http://localhost:3000/api/v2/foods/#{params[:id]}.json").body
   redirect_to "/foods"
 end
end
