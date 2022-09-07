ActiveAdmin.register Post do

  permit_params :title, :body, :user_id, :published_at

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_post_path(post), method: :put
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :user_id, :published_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  member_action :publish, method: :put do
    post = Post.find(params[:id])
    post.update_attribute(:published_at, Time.now)
    redirect_to admin_post_path(post)
  end

  index do
    selectable_column
    column :id
    column :title
    column :body
    column :user
    column :published_at
    column :created_at
    column :updated_at
    actions
  end

  form  do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :user
      # f.input :published_at
    end
    f.actions
  end
  
end
