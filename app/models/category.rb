class Category < ActiveRecord::Base
  validates :name, :dscr, presence: true
  validates :name, uniqueness: true
end
