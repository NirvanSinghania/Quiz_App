class UsersController < ApplicationController
 
  def new
    if logged_in? ==   true
      redirect_to root_path
    end
  	@user = User.new
  end
  
  def show
      validate(params[:id])
      @user = User.find_by(id: params[:id])
      @arr = Array.new
      @quizzes = Quizz.all
      @quizzes.each do |qui|
        curquiz = State.find_by(user_id: current_user.id , quizz_id: qui.id)
        if curquiz == nil
          @arr.push(0)
        elsif curquiz.complete == true
          @arr.push(curquiz.score)
         
        else 
          @arr.push(-curquiz.score-1)
        end
      end


    
  end

  def index 
      validate(params[:id])
  		@users = User.all
  end

  def create 
       if logged_in? == true
      redirect_to root_path
      end
      @user = User.new(user_params)
      if @user.save
          #Handle unsuccessful
          log_in @user
          redirect_to @user
      else
          render 'new'
      end
  end

  def validate(id)
    if !current_user
      redirect_to root_path
    elsif current_user.isadmin == true
        #Do nothing
    else
    redirect_to user_path(current_user.id) unless current_user.id.to_s == id
    end
  end


   def destroy 
    authorize
    User.find_by(id: params[:id]).destroy
    flash[:success] = "User deleted successfully"
    redirect_to users_path
  
  end


  private
     def set_user
        @user = current_user
      end

     def user_params
            params.require(:user).permit(:name, :email, :password,:password_confirmation)
     end

end