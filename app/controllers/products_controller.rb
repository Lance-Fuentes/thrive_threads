class ProductsController < InheritedResources::Base

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Categories", :categories_path
    add_breadcrumb @category.name, category_path(@category)
    add_breadcrumb "Products", category_products_path(@category)
  end


  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id)
    end

end
