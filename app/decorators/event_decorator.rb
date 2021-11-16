class EventDecorator < Draper::Decorator
  delegate_all

  def full_date
    date.strftime('%d %b %Y')
  end

end
