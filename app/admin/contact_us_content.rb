ActiveAdmin.register ContactPageContent do
  permit_params :content
  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
  end
end
