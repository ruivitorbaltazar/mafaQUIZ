class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :quiz, foreign_key: true
      t.string :name
      t.float :score

      t.timestamps
    end
  end
end
