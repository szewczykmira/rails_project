class Game < ActiveRecord::Base
  validates :name, :dscr, :release_date, :category_id, presence: true
  validates :name, uniqueness: true

  belongs_to :category
  has_many :comments
end
