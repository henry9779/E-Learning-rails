class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string   :subject, null: false
      t.decimal  :price, precision: 8, scale: 2, default: 0, null: false
      t.integer  :currency, default: 0, null: false
      t.integer  :category, default: 0, null: false
      t.integer  :status, default: 0, null: false
      t.string   :url
      t.text     :description, null: false
      t.integer  :valid_day, default: 1, null: false

      t.timestamps
    end
  end
end
