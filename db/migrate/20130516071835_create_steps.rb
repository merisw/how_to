class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :order
      t.text :description
      t.references :instruction

      t.timestamps
    end
    add_index :steps, :instruction_id
  end
end
