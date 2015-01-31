module ApplicationHelper
	public def nav_link_to(link:, target_controller:, action: '')
		#<li class="active"><%= link_to 'Home', controller:  'welcome'%></li>
		link = link_to(link, controller: target_controller, action: action)
		if (target_controller == controller.controller_name)
			return content_tag(:li, link, class: "active")
		else
			return content_tag(:li, link)
		end
	end

	def show_messages
		#TODO: Seems rather smelly to simply raw this output, find a better way?
		tags = ""
		flash.each do |message_type, message|
			message_class = "alert alert-" + message_type
			tags+= content_tag(:div, message, class: message_class)
		end
		return tags
	end
end
