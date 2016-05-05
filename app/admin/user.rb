ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :email
    column :roles
    column :first_name
    column :last_name
    actions
  end

  permit_params :email, :password, :roles, :first_name, :last_name

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, :label => 'roles', :as => :select, :collection => User::ROLES
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end
end
