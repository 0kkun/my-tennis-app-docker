class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null:false, index: true #外部キー
      t.references :player, null:false, index: true #外部キー
    end
  end
end
