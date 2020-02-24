class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
end

def full_name
  "#{self.first_name} #{self.last_name}"
end