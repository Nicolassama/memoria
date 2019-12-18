class FavoritesController < ApplicationController
	#before_action :authenticate_user!, only: [:create, :destroy]

	def index
		@user = User.find_by(id: params[:id])
  	@favorites = Favorite.where(user_id: current_user.id)

	end

	def create
		#@favorite = current_user.favorites.create(memo_id: params[:memo_id])
    #redirect_back(fallback_location: root_path)

    @memo = Memo.find(params[:memo_id])
    @memo.favorites.find_or_create_by(user_id: params[:user_id])
		@favorite = current_user.favorites.build(memo_id: @memo.id)
		if @favorite.save
			redirect_to favorites_index_path(current_user), notice: "お気に入りに追加しました"
		else
			redirect_to favorites_index_path(current_user), alert: "この質問はお気に入りに登録できません"
		end
	end

	def destroy
    @favorite = Favorite.find_by(memo_id: params[:memo_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to post_path(params[:memo_id])
  end

end
