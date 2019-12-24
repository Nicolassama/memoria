class FavoritesController < ApplicationController
	#before_action :authenticate_user!, only: [:create, :destroy]

	def index
		@user = User.find_by(id: params[:id])
  		@favorites = Favorite.where(user_id: current_user.id)
	end

	def create
	    @memo = Memo.find(params[:memo_id])
	    @memo.favorites.find_or_create_by(user_id: params[:user_id])
		@favorite = current_user.favorites.build(memo_id: @memo.id)
		if @favorite.save
			@memo.create_notification_like!(current_user)
		end
	end

	def destroy
	    @memo = Memo.find(params[:memo_id])
    	@favorite = Favorite.find_by(memo_id: @memo.id, user_id: current_user.id)
    	@favorite.delete
  end

end
