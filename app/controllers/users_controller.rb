class UsersController < ApplicationController
    before_action :authenticate_user!
	def edit
        @user = User.find(params[:id])
        @book = Book.new
        flash[:success] = 'You have update user successfully.'
        if current_user.id != @user.id
            redirect_to user_path(current_user)
        end

    end

     def create
        users = User.all
        user = User.new(user_params)
        if user.save
           flash[:notice] = 'You have creatad book successfully.'
        redirect_to book_path(user.id)
     else
        render 'index'
    end
    end

    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
        flash[:edit] = 'You have update user successfully.'
    	redirect_to user_path(@user.id)
    else
        render 'edit'
    end
    end

    def index
    	@book = Book.new#部分テンプレートのやつを追加するのに必要な定義
    	@user = current_user
    	@users = User.all.includes(:books)
    end

    def show
    	@book = Book.new
        @user = User.find(params[:id])
      #  @users = User.while(id:)#ここで自分が投稿したものだけ表示させる
        @books = Book.all
       flash[:show] = 'You have creatad book successfully.'
    end

private

    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
