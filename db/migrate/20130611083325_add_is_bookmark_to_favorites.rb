class AddIsBookmarkToFavorites < ActiveRecord::Migration
  def change
	add_column :favorites, :is_bookmark, :boolean
  end
end
