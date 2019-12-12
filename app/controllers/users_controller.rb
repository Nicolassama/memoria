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
	end

	def exit
	end

end
