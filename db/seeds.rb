

User.create!(name: "test", email: "dummy@email.com", password: "test1234")


Player.create!(
  [
    {
      name:  'Rafael Nadal',
      name_jp:  'ラファエル・ナダル',
      name_etc: 'R.Nadal',
      name_search_1: 'ナダル',
      name_search_2: 'ラファ',
    },
    {
      name:  'Roger Federer',
      name_jp:  'ロジャー・フェデラー',
      name_etc: 'R.Federer',
      name_search_1: 'フェデラー',
      name_search_2: 'ロジャー',
    },
    {
      name:  'Novak Djokovic',
      name_jp:  'ノバク・ジョコビッチ',
      name_etc: 'N.Djokovic',
      name_search_1: 'ジョコビッチ',
      name_search_2: 'ジョコ',
    },
    {
      name:  'Fabio Fognini',
      name_jp:  'ファビオ・フォニーニ',
      name_etc: 'F.Fognini',
      name_search_1: 'フォニーニ',
      name_search_2: 'ファビオ',
    },
    {
      name:  'Nick Kyrgios',
      name_jp:  'ニック・キリオス',
      name_etc: 'N.Kyrgios',
      name_search_1: 'キリオス',
      name_search_2: 'ニック',
    },
    {
      name:  'Kei Nishikori',
      name_jp:  '錦織圭',
      name_etc: 'K.Nishikori',
      name_search_1: '錦織',
      name_search_2: '圭',
    },
    {
      name:  'Yoshihito Nishioka',
      name_jp:  '西岡 良仁',
      name_etc: 'Y.Nishioka',
      name_search_1: '西岡良仁',
      name_search_2: '良仁',
    },
    {
      name:  'Gael Monfils',
      name_jp:  'ガエル モンフィス',
      name_etc: 'G.Monfils',
      name_search_1: 'Monfils',
      name_search_2: 'Gael',
    },
    {
      name:  'Daniil Medvedev',
      name_jp:  'ダニル・メドベージェフ',
      name_etc: 'D.Medvedev',
      name_search_1: 'メドヴェージェフ',
      name_search_2: 'ダニエル',
    }
  ]
)
