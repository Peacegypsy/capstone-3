class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :focus
      t.text :desire
      t.text :outside_influences
      t.text :inner_dialog
      t.text :challenges
      t.text :insight
      t.text :meditation
      t.text :resolution

      t.timestamps
    end
  end
end
