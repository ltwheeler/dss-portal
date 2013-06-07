class AddLoginidToFavorites < ActiveRecord::Migration
  def change
	add_column :favorites, :loginid, :string
  end
end
