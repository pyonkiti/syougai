#rails db:seed:motouke 

# motoukesテーブルのテストデータを作成
3.times do |i|
    Motouke.create!(
        motouke_cd:  "#{(i + 1) * 1}",
        motouke_nm: "元請け株式会社#{i + 1}"
    )
end

