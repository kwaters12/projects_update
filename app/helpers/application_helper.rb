module ApplicationHelper
  def formatted_date(date)
    date.strftime("%d-%B-%y")
  end
  def truncate_string(body)
    truncate(body, length: 50, omission: '.....')
  end

end
