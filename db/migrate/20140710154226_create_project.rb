class CreateProject < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :user
      t.string :council
      t.string :troop
      t.string :date
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
