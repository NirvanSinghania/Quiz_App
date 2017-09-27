class CreateQuesusers < ActiveRecord::Migration[5.1]
  def change
    create_table :quesusers do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :quizid

      t.timestamps
    end
  end
end
