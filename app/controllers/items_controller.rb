class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Todo item saved."
      redirect_to root_path
      return
    else
      flash[:error] = "Unable to save Todo item - pleas try again"

      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @user = current_user
    find_item

    # authorize @item

    if @item.destroy
      flash[:notice] = "Item was deleted."
      redirect_to root_path
      return
    else
      flash[:error] = "Item couldn't be deleted."
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

private

  def item_params
    params.require(:item).permit(:name)
  end

  def find_item
    @item = @user.items.find(params[:id])
  end

end
