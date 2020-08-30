class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,               null: false,  foreign_key: true
      t.string     :name,               null: false
      t.text       :writings,           null: false
      t.integer    :category_id,        null: false,  foreign_key: true
      t.integer    :condition_id,       null: false,  foreign_key: true
      t.integer    :shipping_charge_id, null: false,  foreign_key: true
      t.integer    :prefecture_id,      null: false,  foreign_key: true
      t.integer    :delivery_day_id,   null: false,  foreign_key: true
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
