class Song < ApplicationRecord
    validates :title, presence:true
    validates :release_date, presence: true, if: 'released'
    validates_uniqueness_of :title, scope[ :artist_name, :released_date, :released, :genre]
end
