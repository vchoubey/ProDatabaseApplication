module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
    when "success"
      'alert-success'
    when "error"
      'alert-error'
    when "alert"
      'alert-block'
    when "info"
      'alert-info'
    else 
      flash_type.to_s
    end
  end


          
    # {success: "alert-success", error: "alert-error", alert: "alert-block", notice: "alert-info"}
    # [flash_type] || flash_type.to_s
  

  def flash_messages(opts = {})
    flash.each do |type, message| 
puts " type = #{type} and message = #{message}"
puts " class alert  = alert-#{bootstrap_class_for(type).inspect}"
     concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(type)} fade in") do
      concat content_tag(:button, 'x', class: "close", data: {dismiss: 'alert'})
      concat message
      end)
    end
    nil
  end
end
