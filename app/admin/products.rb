ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :description, :category_id, :images => []
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.has_many :images, allow_destroy: true, heading: 'Images', new_record: 'Add Image' do |i|
        if i.object.file.attached?
          i.input :file, as: :file, label: 'Image',
                             hint: image_tag(url_for(i.object.file), height: '100')
        else
          i.input :file, as: :file, label: 'Image'
        end
      end
    end

    f.actions
  end


  controller do
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id, images_attributes: [:id, :file, :_destroy])
    end
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :category do |product|
        product.category.name if product.category
      end
      row :images do |product|
        product.images.each do |image|
          span do
            image_tag(url_for(image.file), height: '500')
          end
        end
      end
    end
  end
end
