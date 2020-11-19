# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  # validates :phone_number, :uniqueness => { :case_sensitive => false }
  validates :phone_number, :presence => true
  has_secure_password

  has_many(:notifications, { class_name: "Notification", foreign_key: "flight_description", dependent: :destroy })
end
