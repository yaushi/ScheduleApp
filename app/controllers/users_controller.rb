class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show]}
  
  def index
    @user = User.all
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render 'new'
      
    end
    
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @meetings = Meeting.where(userid: params[:id]).to_ary().dup()
    
    if @user.id == @current_user.id

      relationships_each_test(@current_user.id).each do |relation|
        tmp = Meeting.where(userid: relation, hidden: false).to_ary

          tmp.each do |record|
            @meetings.push(record)
          end
      end

    end
    
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
                                   
    end
    
    def relationships_each_test(userid)
      
      relationships_follower = Relationship.where(follower_id: userid).pluck(:followed_id)
      Relationship.where(followed_id: userid).where(follower_id: relationships_follower).pluck(:follower_id)
      
    end
  
end
