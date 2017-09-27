class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.references :user, foreign_key: true
      t.references :quizz, foreign_key: true
      t.boolean :complete
      t.integer :score
      t.integer :count

      t.timestamps
    end
  end
end
