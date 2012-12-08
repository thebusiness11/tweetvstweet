class AddIndexToHashtag < ActiveRecord::Migration
  def change
    add_index :hashtags, [:id, :hashtag]
  end
end
