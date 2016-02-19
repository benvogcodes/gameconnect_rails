module UsersHelper
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    else
      nil
    end
  end


  def signed_in?
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
