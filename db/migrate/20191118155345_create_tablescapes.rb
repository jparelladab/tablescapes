class CreateTablescapes < ActiveRecord::Migration[5.2]
  def change
    create_table :tablescapes do |t|
      t.string :name
      t.integer :price_per_person
      t.text :description
      t.references :user, foreign_key: true
      t.string :tag
      t.string :location

      t.timestamps
    end
  end
end
