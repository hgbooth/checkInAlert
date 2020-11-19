class AddAlertToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :alert_sent, :boolean
  end
end
