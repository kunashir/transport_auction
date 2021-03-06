#coding: utf-8
module SessionsHelper

  def sign_in(user, ip=nil, agent=nil) #вход
    cookies.permanent.signed[:remember_token] = [user.id, user.salt, ip, agent] #[tk, user.salt]
    session[:id]  = [user.id, user.salt] #[tk, user.id]
    self.current_user = user
  end

  # def sign_out(user=nil) #выход

  #   cookies.delete(:remember_token)
  #   self.current_user = nil
  # end

  # def current_user=(user)
  #   @current_user = user
  # end

  # def current_user
  #   @current_user ||= user_from_remember_token
  # end

  # def signed_in?
  #   !current_user.nil?
  # end

  # def deny_access
  #   store_location
  #   redirect_to signin_path, :notice => "Пожалуйста войдите для доступа к этой странице."
  # end

  def save_location
   # store_location
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to]||default)
    clear_return_to
  end

  #проверка являетс ли пользователь менеждером, который может добавлять заявки
  def manager?
    current_user.manager?
  end

  def is_admin?
    current_user.admin?
  end

  def is_block_user?
    current_user.is_block?
  end

  def set_cur_client(client)
    session[:cur_client] = client
  end

  def get_cur_client
    session[:cur_client]
  end

  def set_cur_storage(storage)
	 session[:cur_storage] = storage
  end

  def get_cur_storage
	 sesseion[:cur_storage]
  end
private
  # def user_from_remember_token
  #   User.authenticate_with_salt(*remember_token)
  # end

  # def remember_token
  #   cookies.signed[:remember_token] || [nil, nil, nil, nil]
  # end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
