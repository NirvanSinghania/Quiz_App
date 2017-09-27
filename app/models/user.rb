class User < ApplicationRecord
  has_secure_password
  has_many :quesusers , dependent: :destroy
  has_many :states , dependent: :destroy
  has_many :genrescores , dependent: :destroy
  has_many :subgenrescores , dependent: :destroy


end
