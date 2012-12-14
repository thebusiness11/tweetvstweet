class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :name
      t.text :query
      t.text :url

      t.timestamps
    end
  end
end
