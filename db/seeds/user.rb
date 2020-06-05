# Userテーブルのテストデータを作成
User.create!(
    name:            '管理者',
    syain_id:        '0',
    name_id:         'kankyou',
    password:        'nsk_syougaidb',
    password_confirmation: 'nsk_syougaidb',
    admin:           'true'
)

User.create!(
    name:            'テストユーザー',
    syain_id:        '0',
    name_id:         'test_admin',
    password:        'nsk_admin',
    password_confirmation: 'test_admin',
    admin:           'true'
)
