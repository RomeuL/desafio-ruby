class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Redirecionar para a página inicial após login
  def after_sign_in_path_for(resource)
    root_path
  end

  # Redirecionar para a página de login após logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
