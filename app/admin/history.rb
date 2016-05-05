ActiveAdmin.register History do
  index do
    selectable_column
    id_column
    column :user_id
    column :food_id
    actions
  end

  permit_params :user_id, :food_id

  form do |f|
    f.inputs "User Details" do
      f.input :user_id, :label => 'users', :as => :select, :collection => User.all.map{|u| ["#{u.email}, #{u.first_name} #{u.last_name}", u.id]}
      f.input :food_id, :label => 'foods', :as => :select, :collection => Food.all
    end
    f.actions
  end
end
