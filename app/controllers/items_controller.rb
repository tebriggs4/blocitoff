class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = @user
    
    if @item.save
      redirect_to @user, notice: "Item was saved successfully."
    else
      flash.now[:alert] = "Error creating item. Please try again."
      render :create
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name)
  end
end
