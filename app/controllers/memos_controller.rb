class MemosController < ApplicationController
	before_action :authenticate_user!, only: [:show, :create]
	before_action :correct_user, only: [:edit, :update]

	def index
		@user = current_user
		@random = Memo.order("RANDOM()").limit(50)
		@memo = Memo.new
		@comments = @memo.comments
    	@favorite = Favorite.new
		@thememo = Memo.find_by(id: params[:id])
    	if !@user.nil?
    		followings = @user.followings
    		@memos = Memo.where(user_id: followings).order(created_at: :desc)
    	end
	end

	def show
		@memo = Memo.find(params[:id])
		@user = @memo.user
		@comments = @memo.comments
    	@comment = Comment.new
	end

	def search
		@memos = Memo.search(params[:keyword])
	end

	def create
		@random = Memo.order("RANDOM()").limit(50)
		@memo = Memo.new(memo_params)
		@memo.user_id = current_user.id
		if @memo.save
			flash[:notice]="You have created memo successfully"
			redirect_to root_path
		else
			flash[:alert] = "error"
			render action: :index
		end
	end

	def edit
		@user = current_user
		@memo = Memo.find(params[:id])
	end

	def update
		@memo = Memo.find(params[:id])
		if @memo.update(memo_params)
			flash[:notice]="変更しました"
			redirect_to users_path
		else
			flash[:notice]="error"
			render action: :edit
		end
	end

	def destroy
		@memo = Memo.find(params[:id])
		@memo.destroy
		redirect_to users_path
	end

    private

    def memo_params
        params.require(:memo).permit(:title, :body, :memo_image_id)
    end

	def correct_user
		@memo = Memo.find(params[:id])
    	@user = @memo.user
    	redirect_to memo_path(@memo) unless current_user == @user
 	end

end
