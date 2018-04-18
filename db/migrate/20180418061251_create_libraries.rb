class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.integer :floor_count
      t.integer :floor_area

      t.timestamps
    end
  end
end
