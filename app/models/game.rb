class Game < ActiveRecord::Base
  validates :name, :dscr, :release_date, :category_id, presence: true
  validates :name, uniqueness: true
end
