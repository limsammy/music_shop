class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      flash[:success] = "#{@item.title} has been created."
      redirect_to item_path(@item)
    else
      flash[:message] = "Item has not been created"
      redirect_to new_admin_item_path
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "#{@item.title} has been updated."
      redirect_to admin_items_path
    else
      flash[:message] = "Item has not been updated"
      redirect_to edit_admin_item_path
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admin_items_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :price, :category_id, :image, :status, :audio)
    end
end
