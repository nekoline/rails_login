class LoginsController < ApplicationController
  def index
  end

  def show
    render 'new'
  end

  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:pass])
      # セッションのキー:user_idへユーザーのIDを登録
      session[:user_id] = user.id
      redirect_to root_path
    else
      # flash変数にメッセージをセット
      flash.now.alert = 'try again.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path
  end
end
