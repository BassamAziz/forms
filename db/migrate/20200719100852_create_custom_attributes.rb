class CreateCustomAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_attributes do |t|
      t.string :name
      t.integer :data_type
      t.integer :source
      t.boolean :required
      t.timestamps
    end
  end
end
