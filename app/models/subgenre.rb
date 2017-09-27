class Subgenre < ApplicationRecord
  belongs_to :genre
  has_many :quizzs , dependent: :destroy
  has_many :subgenrescores , dependent: :destroy
end
