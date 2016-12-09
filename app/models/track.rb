class Track < ActiveRecord::Base

  validates :name, :album_id, :category, presence: true

  belongs_to :album

  has_many :notes, dependent: :destroy
end
