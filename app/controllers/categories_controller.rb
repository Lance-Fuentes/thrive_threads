class CategoriesController < InheritedResources::Base

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Categories", :categories_path
    add_breadcrumb @category.name, category_path(@category)
  end

  def index
    @categories = Category.all
  end


  private

    def category_params
      params.require(:category).permit(:name)
    end
end
