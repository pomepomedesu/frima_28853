class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,               null: false,  foreign_key: true
      t.string     :image,              null: false
      t.string     :name,               null: false
      t.text       :writings,           null: false
      t.integer    :category_id,        null: false,  foreign_key: true
      t.integer    :condition_id,       null: false,  foreign_key: true
      t.integer    :sipping_charges_id, null: false,  foreign_key: true
      t.integer    :prefecture_id,      null: false,  foreign_key: true
      t.integer    :delivery_days_id,   null: false,  foreign_key: true
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
