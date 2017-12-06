class User < ApplicationRecord
  include Clearance::User

  has_many :rentals
  has_many :notifications

  #include Clearance::User
end
