module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def country_list
    cities = [] 
    states = CS.states(:in) 
    states.keys.last(36).each do |state| 
    cities << CS.cities(state.to_sym, :IN)   
    end
    return cities.flatten
  end
end
