# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def class_to_if_current(name, options = {})
    name if current_page?(options)
  end
end
