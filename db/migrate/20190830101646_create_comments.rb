class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.references :user, foregin_key: true
      t.references :article, foregin_key: true
     
      t.timestamps
    end
  end
end
