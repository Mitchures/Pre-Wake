class AddUserPostToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :user_post, :integer
  end
end
