class Quizz < ApplicationRecord
  belongs_to :subgenre
  has_many :questions , dependent: :destroy
  has_many :states , dependent: :destroy
  
end
