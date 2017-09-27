class CreateGenrescores < ActiveRecord::Migration[5.1]
  def change
    create_table :genrescores do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
