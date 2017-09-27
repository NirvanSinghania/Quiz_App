class CreateQuizzs < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzs do |t|
      t.string :name
      t.integer :numquestions
      t.references :subgenre, foreign_key: true

      t.timestamps
    end
  end
end
