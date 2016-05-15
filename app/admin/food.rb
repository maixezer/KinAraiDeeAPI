ActiveAdmin.register Food do
  permit_params :name, :calories, :image, :tags_raw

  form do |f|
    f.inputs "Food Details" do
      f.input :name
      f.input :calories
      f.input :image
      f.input :tags_raw, as: :text
    end
    f.actions
  end
end
