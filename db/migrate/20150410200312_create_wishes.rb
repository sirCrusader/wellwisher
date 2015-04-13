class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string    :title, null: false
      t.text      :description
      t.string    :link
      t.json      :tags
      t.string    :image
      t.float     :rate
      t.boolean   :presented
      t.date      :present_date
      t.integer   :category_id, null: false
      t.timestamps null: false
    end
  end
end
