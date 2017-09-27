class Question < ApplicationRecord
  belongs_to :quizz
  has_many :quesusers , dependent: :destroy
end
