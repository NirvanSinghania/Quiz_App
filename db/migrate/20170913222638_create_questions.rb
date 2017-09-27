class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :optionA
      t.text :optionB
      t.text :optionC
      t.text :optionD
      t.string :answer
      t.integer :qtype
      t.integer :points
      t.references :quizz, foreign_key: true

      t.timestamps
    end
  end
end
