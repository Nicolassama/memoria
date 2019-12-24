class UsersController < ApplicationController
	def index
		@user = current_user
		@memo = Memo.new
		@memos = Memo.all
		@thememo = Memo.where(user_id: current_user.id)
    	@followings = @user.followings
    	@followers = @user.followers
	end

	def show
		@user = User.find(params[:id])
		@memos = @user.memos.all
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
	   	if @user.update(user_params)
	    	redirect_to edit_user_path(@user), notice: '変更しました'
	 		else
	    	render :edit
	  	end
	end

	def destroy
		current_user.destroy
		redirect_to root_path, notice: '退会しました'
	end

	def exit
		@user = current_user
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :image)
	end

end