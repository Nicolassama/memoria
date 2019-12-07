class MemosController < ApplicationController

	def index
		@memo = Memo.new
		@memos = Memo.all
	end

	def about
	end

	def show
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
		memo = Memo.new(memo_params)
		memo.save
		redirect_to root_path
	end

	def edit
	end

	def destroy
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
        params.require(:memo).permit(:title, :body)
    end

end
