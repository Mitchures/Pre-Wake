class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :microposts, :image, :string
  end
end
