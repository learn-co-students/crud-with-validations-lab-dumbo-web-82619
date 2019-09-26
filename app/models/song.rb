class Song < ApplicationRecord
  validates :title, presence: true 
  validates :release_year, 
    presence: true, if: :released,
    uniqueness: true,  
    numericality: {less_than_or_equal_to: Date.today.year}, if: :released
end
