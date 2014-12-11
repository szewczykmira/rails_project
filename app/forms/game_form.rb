class GameForm
  ValidationError = Class.new(StandardError)
  include Virtus.model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :name, String
  attribute :dscr, String
  attribute :release_date, Date
  attribute :category_id, Integer

  validates :name, presence: true
  validates :dscr, presence: true
  validates :release_date, presence: true
  validates :category_id, presence: true

  def persisted?
    false
  end

  def validate!
    raise ValidationError, errors unless valid?
  end
end