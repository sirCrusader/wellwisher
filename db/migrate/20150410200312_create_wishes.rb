class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.references :category
      t.string     :title, null: false
      t.string     :link
      t.float      :rate
      t.attachment :image
      t.text       :description
      t.json       :tags
      t.boolean    :presented
      t.date       :present_date
      t.timestamps null: false
    end
  end
end
