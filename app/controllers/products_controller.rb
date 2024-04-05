class ProductsController < InheritedResources::Base

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id)
    end

end
