class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :buyers, :slug
  end
end
