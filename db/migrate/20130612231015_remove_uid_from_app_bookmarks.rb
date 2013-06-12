class RemoveUidFromAppBookmarks < ActiveRecord::Migration
	def change
		remove_column :app_bookmarks, :uid
	end
end
