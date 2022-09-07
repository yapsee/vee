ActiveAdmin.register User do

  permit_params :email, :name, :phone, :published_at
   action_item :publish, only: :show do
     link_to 'Publish', publish_admin_user_path(user), method: :put
   end
 
 
   member_action :publish, method: :put do
     user = User.find(params[:id])
     user.update_attribute(:published_at, Time.now)
     redirect_to admin_user_path(user)
   end
 
   index do
     selectable_column
     column :id
     column :email
     column :phone
     column :published_at
     column :created_at
     column :updated_at
     actions
   end
 
   form  do |f|
     f.inputs do
       f.input :email
       f.input :name
       f.input :phone
       # f.input :published_at
     end
     f.actions
   end
   
 end
 