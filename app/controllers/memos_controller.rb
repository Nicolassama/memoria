class MemosController < ApplicationController
	#before_action :authenticate_user!, only: [:show, :create]

	def index
		@random = Memo.order("RANDOM()").limit(50)
		@memo = Memo.new
		@memos = Memo.all
		#@thememo = Memo.find(params[:id])
    	@favorite = Favorite.new
	end

	def about
	end

	def show
		@thememo = Memo.find(params[:id])
    	@favorite = Favorite.new
	end

	def search
		if search
			@search = Memo.search(params[:search])
			redirect_to memos_search_path
		else
			render action: :index
		end
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

	def self.search(search)
      if search
        Memo.where(['content LIKE ?', "%#{search}%"])
      else
        Memo.all
      end
    end

    private

    def memo_params
        params.require(:memo).permit(:title, :body, :memo_image_id)
    end

end
