class CreatePurchasedCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :purchased_courses do |t|
      t.integer  :user_id, null: false
      t.integer  :course_id, null: false
      t.datetime :expiry_at, null: false

      t.timestamps
    end
  end
end
