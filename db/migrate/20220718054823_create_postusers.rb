class CreatePostusers < ActiveRecord::Migration[7.0]
  def change
    create_table :postusers do |t|
      t.references :Post, null: false, foreign_key: true
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
