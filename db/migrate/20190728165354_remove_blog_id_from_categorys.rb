class RemoveBlogIdFromCategorys < ActiveRecord::Migration[5.2]
  def change
    remove_column :categorys, :blog_id, :integer
  end
end
