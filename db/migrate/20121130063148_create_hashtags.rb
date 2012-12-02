class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.integer :tweet_id, :limit => 8
      t.string :from_user
      t.text :text
      t.text :profile_image_url
      t.date :created_at
      t.string :hashtag
      t.timestamps
    end
  end
end

