class CreateCustomData < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_data do |t|
      t.references :customizable, polymorphic: true, index: true
      t.references :custom_attribute, foreign_key: true

      t.text :content

      t.timestamps
    end
  end
end
