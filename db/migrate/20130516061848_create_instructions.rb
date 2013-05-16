class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :topic

      t.timestamps
    end
  end
end
