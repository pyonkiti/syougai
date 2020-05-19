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
