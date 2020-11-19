# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  alert_sent         :boolean          default(FALSE)
#  flight_datetime    :datetime
#  flight_description :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
class Notification < ApplicationRecord

  belongs_to(:user, { required: false, class_name: "User", foreign_key: "flight_description" })
  
end
