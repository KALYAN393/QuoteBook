class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :User, null: false, foreign_key: true
      t.references :Post, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
