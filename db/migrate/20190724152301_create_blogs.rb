class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.string :title
      t.text :blog_body
      t.string :blog_image

      t.timestamps
    end
  end
end
