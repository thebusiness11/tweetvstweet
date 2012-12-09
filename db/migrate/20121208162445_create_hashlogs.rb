class CreateHashlogs < ActiveRecord::Migration
  def change
    create_table :hashlogs do |t|
      t.string :tag
      t.integer :count
      t.date :latest

      t.timestamps
    end
  end
end
