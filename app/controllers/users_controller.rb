class UsersController < ApplicationController


  def index
  end

  def edit
  end

  def show
  end

  def login
    @user = User.new
  end

  def create #login用
    user = @User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: ‘ログインしました’
     else
      render "users/login"
    end
  end

  def logout
  end

  def item_management
    @item = current_user.items.order("created_at DESC")
  end

  private 
    def session_params
        params.require(:session).permit(:password,:email)
    end

end
