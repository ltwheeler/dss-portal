class ChangeAppBookmarkToFavorites < ActiveRecord::Migration
	def change
		rename_column :favorites, :AppBookmark_id, :app_id
	end
end
