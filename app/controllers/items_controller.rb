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
  
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      # flash.now[:notice] = "Item has been deleted."
      # redirect_to user_path(current_user) - no longer needed since using AJAX
    else
      # flash.now[:alert] = "There was an issue deleting the item. Please try again."
      # render :show - no longer needed since using AJAX
    end
    
    respond_to do |f|
      f.html
      f.js
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name)
  end
end
