# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Userテーブルのテストデータを作成
User.create!(
    name:            '管理者',
    name_id:         'admin',
    password:        'admin',
    password_confirmation: 'admin',
    admin:           'true'
)

User.create!(
    name:            'ユーザー',
    name_id:         'user',
    password:        'user',
    password_confirmation: 'user',
    admin:           'false'
)

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

# motoukesテーブルのテストデータを作成
3.times do |i|
    Motouke.create!(
        motouke_cd:  "#{(i + 1) * 1}",
        motouke_nm: "元請け株式会社#{i + 1}"
    )
end

# userkeys
3.times do |i|
    Userkey.create!(
        userkey_cd:  "user_#{i + 1}",
        userkey_nm:  "a"
    )
end

# Tasksテーブルのテストデータを作成
Task.create!(
    dantai_kbn:     '1',
    todofuken:      '北海道',
    jigyou_kbn:     '1',
    kijyou:         '機場A',
    naiyou:         '内容ああ',
    jisyou:         '事象ああ',
    syochi:         '処置ああ',
    biko:           '備考ああ',
    syubetu_kbn:    '通常',
    hosyou_kbn:     '年間保守',
    renraku_d:      '2020-04-01',
    renraku_t:      '10:01:02',
    syanai:         '5.0',
    genchi_d:       '2020-04-01',
    genchi_t:       '10:01:02',
    sagyou_d:       '2020-04-01',
    sagyou_t:       '10:01:02',
    syagai:         '5.0',
    idou:           '4.0',
    teishi:         '20.0',
    project_cd:     '45-99-001',
    taiou_cd:       '123',
    taiou_sub:      '1',
    del_flg:        '0',
    user_id:        '1',
    enduser_id:     '1',
    motouke_id:     '1',
    userkey_id:     '1'
)

