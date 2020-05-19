#rails db:seed:enduser

# endusersテーブルのテストデータを作成
3.times do |i|
    Enduser.create!(
        enduser_cd:  "#{(i + 1) * 100}",
        todofuken:   "北海道",
        enduser_nm:  "札幌市#{i + 1}"
    )
end
3.times do |i|
    Enduser.create!(
        enduser_cd:  "#{(i + 1) * 1}",
        todofuken:   nil,
        enduser_nm:  "AA株式会社#{i + 1}"
    )
end
