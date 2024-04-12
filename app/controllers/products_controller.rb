class ProductsController < InheritedResources::Base

  def index
    @products = Product.all
    add_breadcrumb "Home", :root_path

    if
      params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products
      add_breadcrumb "Categories", :categories_path
      add_breadcrumb @category.name, category_path(@category)
      add_breadcrumb "Products", category_products_path(@category)

    elsif
      params[:sale] == 'true'
      @products = @products.on_sale
      add_breadcrumb 'On Sale Products', products_path(sale: true)

    elsif
      params[:new] == 'true'
      @products = Product.where('created_at >= ?', 3.days.ago)
      add_breadcrumb 'New Products', products_path(new: true)

    elsif
      params[:updated] == 'true'
      updated_products = @products.where('updated_at >= ?', 3.days.ago)
                                  .where.not('created_at >= ?', 3.days.ago)
      @products = updated_products
      add_breadcrumb 'Recently Updated Products', products_path(updated: true)

    else
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
