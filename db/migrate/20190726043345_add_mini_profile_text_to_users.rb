class AddMiniProfileTextToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mini_profile_text, :string
  end
end
