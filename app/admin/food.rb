ActiveAdmin.register Food do
  permit_params :name, :tags, :calories, :image
end
