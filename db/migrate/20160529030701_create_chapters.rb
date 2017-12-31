class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :name
      t.belongs_to :book
      t.timestamps null: false
    end
  end
end
