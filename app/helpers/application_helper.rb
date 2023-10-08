module ApplicationHelper
  def login_helper
     if current_user.is_a?(GuestUser)
       (link_to 'Login', user_session_path) +
         "<br>".html_safe +
         (link_to 'Register', new_user_registration_path)
     else
       link_to 'Logout', destroy_user_session_path, data: { "turbo-method": :delete } # <!-- Rails 7+ -->
     end
  end

  def source_helper
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_helper(name, msg)
    "&copy; #{Time.now.year} | <b>#{name}</b> | #{msg}".html_safe
  end
end