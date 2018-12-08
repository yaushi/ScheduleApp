class UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    #@user = User.new(name: params[:name], email: params[:email], password: params[:password])
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
    #----表示対象としたいユーザーのmeetingレコードを取得----#
    
    ##whereメソッドの戻り値は、「relationクラス」のインスタンスの為、「arrayクラス」に変換（ pushメソッドを使用したい）
    ##dupメソッドにてコピーを作成（arrayクラスに変換すると、freeze=trueとなっており、pushメソッドが使用できない）
    @meetings = Meeting.where(userid: params[:id]).to_ary().dup()
    
    #relationships1 = Relationship.where(follower_id: session[:user_id])
    #relationships2 = Relationship.where(followed_id: session[:user_id])

    relationships1 = Relationship.where(follower_id: @current_user.id)
    relationships2 = Relationship.where(followed_id: @current_user.id)
    
    relationships1.each do |relationship1|
      relation = relationships2.find_by(follower_id: relationship1.followed_id)
      
      if relation 
        tmp = Meeting.where(userid: relation.follower_id).to_ary()
        #↑相互フォローユーザのMeeting取得時に、本人のMeetingを取得しないようにコントロールが必要
        
        tmp.each do |record|
        @meetings.push(record)
        end
        
      end
      
    end
    
 
    #tmp = Meeting.where(userid: 3).to_ary()
    #↑相互フォローユーザのMeeting取得時に、本人のMeetingを取得しないようにコントロールが必要
    #tmp.each do |record|
      
      #@meetings.push(record)
    #end
    
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
                                   
    end
  
end
