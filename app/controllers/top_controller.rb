class TopController < ApplicationController

  # ローカル環境用
  # GOOGLE_API_KEY = Rails.application.credentials.google[:secret_access_key]
  # 本番環境用
  GOOGLE_API_KEY = 'AIzaSyC7eTtqmB2MqButUIjz7XogxOjAmO44uNU'

  # SSL関係で認定証のエラーになる。一時無視。
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  

  # 検索実行メソッド。keywordをこのメソッドに渡すと実行する
  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil

    #検索オプションの設定。
    opt = {
      #リファレンス： https://developers.google.com/youtube/v3/docs/videos/list?hl=ja
      q: keyword,
      type: 'video',
      max_results: 1,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    # パラメータの中身は、list_searches(part, フィルタ)。必須指定項目はpartのみ。
    # フィルタの中身は、(chart, id, myRating)の中から一つだけ指定可能。myRatingは承認されないと使えない
    # その他のフィルタとして、maxResults, pageToken, regionCode, videoCategoryIdがある

    service.list_searches(:snippet, opt)

  end



  def index
    if user_signed_in?
      # --------------大会日程のスクレイピング--------------------
      news_search_url = "http://news.tennis365.net/news/today/"

      # agentという変数にMechanizeクラスのインスタンスを代入。
      news_agent = Mechanize.new
      # pageという変数にsearch_urlのウェブサイトからHTML情報をgetというメソッドで、
      # Mechanizeインスタンスから抜き出したものを代入
      news_page = news_agent.get(news_search_url)

      # @elementsというクラス変数に、search_urlのトップページにあるタグを検索
      # 要素を配列形式で入れている。ビューに渡す用。
      @news_elements = news_page.search('#cntAreaL02 li a')

      # --------------大会日程のスクレイピング--------------------

      schedule_search_url = "https://news.tennis365.net/news/tour/schedule/"
      schedule_agent = Mechanize.new
      schedule_page = schedule_agent.get(schedule_search_url)

      @date_elements = schedule_page.search('td.small_day')
      @match_elements = schedule_page.search('td.small_name')
      @category_elements = schedule_page.search('td.cate')

      # --------------ランキングのスクレイピング--------------------
      rank_search_url = "https://news.tennis365.net/news/ranking/?s=head"
      rank_agent = Mechanize.new
      rank_page = rank_agent.get(rank_search_url)
      @rank_name_elements = rank_page.search('#rightCol .rankTblB a')
      @rank_elements = rank_page.search('#rightCol td.num')
      @point_elements = rank_page.search('#rightCol td.point')

      product_search_url = "https://www.yonex.co.jp/tennis/news/products/"
      product_agent = Mechanize.new
      product_page = product_agent.get(product_search_url)
      @product_elements = product_page.search('.newslist a')

    
      favorite_player = Favorite.select("player_id").where("user_id = ?", current_user)
      @favorite_player_name1 = Player.select("name").where(player_id: :favorite_player[0])
      # @favorites = Favorite.where("user_id = ?", current_user)

      @count = current_user.player.count
      # @count = 1

      search_player = []
      current_user.player.each do |player|
        search_player << player.name
      end
    
      if find_videos(search_player[0]).present?
        @youtube_function = 0 #### ココを1に変えるとyoutube apiの機能がONになる！
      else
        @youtube_function = 0
        redirect_to root_path, alert: '選手が登録されていないか、1日あたりのyoutube取得件数を超えました。'
      end


      if @youtube_function == 1
        if @count == 1 then
          @youtube_data_0 = find_videos(search_player[0])
        elsif @count == 2 then
          @youtube_data_0 = find_videos(search_player[0])
          @youtube_data_1 = find_videos(search_player[1])
        else
          @youtube_data_0 = find_videos(search_player[0])
          @youtube_data_1 = find_videos(search_player[1])
          @youtube_data_2 = find_videos(search_player[2])
        end
        # ブランドをユーザーに選択させる機能は今後実装
        favorite_brand = "YONEX"

        if favorite_brand == "YONEX"
          favorite_brand_text =  favorite_brand + " テニスラケット"
          @youtube_racket = find_videos(favorite_brand_text)
        end
      end
    end # user sign in
  end

end
