class Genre < ApplicationRecord
	has_many :subgenres , dependent: :destroy
	has_many :genrescores , dependent: :destroy
end
