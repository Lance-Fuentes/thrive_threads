class CategoriesController < InheritedResources::Base

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def index
    @categories = Category.all
  end


  private

    def category_params
      params.require(:category).permit(:name)
    end
end
