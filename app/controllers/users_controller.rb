class UsersController < ApplicationController
	def index
		@memo = Memo.new
		@memos = Memo.all
		@thememo = Memo.where(user_id: current_user.id)
		# @user = @thememo.users
	end

	def edit
		@user = current_user
	end

	def update
	end

	def destroy
		current_user.destroy
		redirect_to root_path, notice: '退会しました'
	end

	def exit
		@user = current_user
	end

	private

	def correct_user
		@memo = Memo.find(params[:id])
    @user = @memo.user
    redirect_to root_path unless current_user == @user
	end

end