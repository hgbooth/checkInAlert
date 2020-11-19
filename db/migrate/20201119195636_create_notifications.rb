class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.datetime :flight_datetime
      t.text :flight_description
      t.integer :user_id
      t.boolean :alert_sent, {default: false}

      t.timestamps
    end
  end
end
