class UsersController < ApplicationController
	def index
		@user = current_user
		@memo = Memo.new
		@memos = Memo.all
	end

	def edit
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

end
