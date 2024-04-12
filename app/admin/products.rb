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
      f.input :images, as: :file, input_html: { multiple: true }, hint: f.object.images.present? ? f.object.images.map { |image| image_tag(image) }.join.html_safe : content_tag(:span, "")
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :category_id
      row :images do |product|
        product.images.each do |image|
          span do
            image_tag url_for(image.file)
          end
        end
      end
    end
  end
end
