class FavoritesController < ApplicationController
  def create
    @user_id = session[:id] #ログインしたユーザのID
    @player_id = Player.find(params[:id]).id #特定の選手のID
    #player_idに@player_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
    @favorite = Favorite.new(player_id: @player_id, user_id: current_user.id)
    if @favorite.save
      #保存に成功した場合、選手一覧画面に戻る
      redirect_to players_path, notice: '選手を登録しました'
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to user_path(current_user.id), notice: '選手を削除しました'
    end
  end
end
