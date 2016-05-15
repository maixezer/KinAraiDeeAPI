ActiveAdmin.register Store do
  index do
    selectable_column
    id_column
    column :name
    column :lat
    column :lng
    column :food_ids
    actions
  end

  permit_params :name, :lat, :lng, food_ids: []

  form do |f|
    f.inputs "Food Details" do
      f.input :name
      f.input :lat
      f.input :lng
      f.input :food_ids, :as => :check_boxes, :collection => Food.all
    end
    f.actions
  end
end
