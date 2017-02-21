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
   @food = Food.create({ingredient: params[:ingredient], spice: params[:spice], measurement: params[:measurement]})
   redirect_to "/foods/#{@food.id}"
  end
  def edit
    @food = Food.find(params[:id])
  end
 
  def update
    @food = Food.find(params[:id])
    @food.update({id: params[:id], ingredient: params[:ingredient], spice: params[:spice], measurement: params[:measurement]})

    redirect_to "/foods/#{@food.id}"
  end
 
  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to "/foods"
    flash[:warning] = "food deleted"
  end
end
