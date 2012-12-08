class AddViewCountToHashtag < ActiveRecord::Migration
  def change
     add_column :hashtags, :view_count, :integer
     add_column :hashtags, :wins, :integer
  end
end
