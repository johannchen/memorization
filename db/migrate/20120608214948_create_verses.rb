class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.string :title
      t.string :content
      t.boolean :memorized

      t.timestamps
    end
  end
end
