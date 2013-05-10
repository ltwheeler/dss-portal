class CreateAppBookmarks < ActiveRecord::Migration
  def change
    create_table :app_bookmarks do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :uid

      t.timestamps
    end
  end
end
