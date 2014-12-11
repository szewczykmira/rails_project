class GameService
  def call(form_object)
    form_object.validate!

    ActiveRecord::Base.transaction do
      game = Game.create!(name: form_object.name, dscr: form_object.dscr,
                          category_id: form_object.category_id,
                          release_date: form_object.release_date)
    end

    form_object
  rescue form_object.class::ValidationError
    false
  rescue ActiveRecord::RecordNotUnique
    form_object.errors.add(:name, 'Name already exists')
    false
  end
end