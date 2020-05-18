class CreateBrandUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_users do |t|
      t.references :user, null:false, index: true #外部キー
      t.references :brand, null:false, index: true #外部キー
    end
  end
end
