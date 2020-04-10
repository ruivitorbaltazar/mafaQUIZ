class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :quiz, foreign_key: true
      t.string :content
      t.string :correct_answer
      t.integer :difficulty

      t.timestamps
    end
  end
end
