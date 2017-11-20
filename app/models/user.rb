class User < ApplicationRecord
  include Clearance::User

  has_many :rentals

  #include Clearance::User
end
