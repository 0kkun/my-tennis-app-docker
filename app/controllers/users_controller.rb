class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show
    @user = User.find(params[:id])
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorites = Favorite.where("user_id = ?", @user)
    # @favorite_brand = BrandUser.where("user_id = ?", @user)
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: '更新しました'
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, player_ids: [], brand_ids: [])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
