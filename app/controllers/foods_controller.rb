class FoodsController < ApplicationController
  def index
    @foods = Food.all
    end


  def show
  @food = Food.find(params[:id])

  end

  def new
  end

  def create
   @food = Food.last
   redirect_to "/foods/#{@food.id}"
 end
 def edit
   @food = Unirest.get("http://localhost:3000/api/v2/foods/#{params[:id]}.json").body
 end
 
 def update
   @food = Unirest.patch("http://localhost:3000/api/v2/foods/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement],}).body
   redirect_to "/foods/#{@food['id']}"
 end
 
 def destroy
  @food = Food.find(params[:id])
  @food.destroy
  redirect_to "/foods"
  flash[:warning] = "food deleted"
end
end
