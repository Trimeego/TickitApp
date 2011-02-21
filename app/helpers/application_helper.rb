module ApplicationHelper
  def format_dt(datetime)
    datetime.strftime("%m/%d/%Y")
  end
end
