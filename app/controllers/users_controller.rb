class UsersController < ApplicationController
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
    #----表示対象としたいユーザーのmeetingレコードを取得----#
    
    ##whereメソッドの戻り値は、「relationクラス」のインスタンスの為、「arrayクラス」に変換（ pushメソッドを使用したい）
    ##dupメソッドにてコピーを作成（arrayクラスに変換すると、freeze=trueとなっており、pushメソッドが使用できない）
    @meetings = Meeting.where(userid: params[:id]).to_ary().dup()
 
    tmp = Meeting.where(userid: 1).to_ary()
    #↑相互フォローユーザのMeeting取得時に、本人のMeetingを取得しないようにコントロールが必要
    tmp.each do |record|
      @meetings.push(record)
    end
    
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
                                   
    end
  
end
