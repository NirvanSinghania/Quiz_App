class CreateSubgenrescores < ActiveRecord::Migration[5.1]
  def change
    create_table :subgenrescores do |t|
      t.references :user, foreign_key: true
      t.references :subgenre, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
