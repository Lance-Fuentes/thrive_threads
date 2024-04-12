class ProductsController < InheritedResources::Base

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products
      add_breadcrumb "Home", :root_path
      add_breadcrumb "Categories", :categories_path
      add_breadcrumb @category.name, category_path(@category)
      add_breadcrumb "Products", category_products_path(@category)
    else
      @products = Product.all
      add_breadcrumb "Home", :root_path
      add_breadcrumb "All Products", products_path
    end
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Categories", :categories_path
    add_breadcrumb @category.name, category_path(@category)
    add_breadcrumb @product.name, product_path(@product)
  end


  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id)
    end

end
