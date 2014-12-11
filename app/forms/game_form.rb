class GameForm
  include ActiveModel::Model
  include Virtus.model

  attr_reader :game

  attribute :name, String
  attribute :dscr, String
  attribute :release_date, Date
  attribute :category_id, Integer

  validates :name, presence: true
  validates :dscr, presence: true
  validates :release_date, presence: true
  validates :category_id, presence: true
  validate :name_unique

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private
  def name_unique
    errors.add(:name, "Name already exist") if Game.where(name: name).exists?
  end

  def persist!
    @game = Game.create!(name: name, dscr: dscr, release_date: release_date,
                         category_id: category_id)
  end
end