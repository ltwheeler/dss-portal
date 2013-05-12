class AddAttachmentIconToAppBookmarks < ActiveRecord::Migration
  def self.up
    change_table :app_bookmarks do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :app_bookmarks, :icon
  end
end
