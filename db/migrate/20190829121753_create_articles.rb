class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :text, null: false
      t.text :image
      t.references :user, foregin_key: true

      t.timestamps null: true
    end
  end
end
