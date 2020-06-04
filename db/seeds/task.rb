#rails db:seed:task 

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
    taiou_sub:      '営業Aさん',
    del_flg:        '0',
    user_id:        '1',
    enduser_id:     '1',
    motouke_id:     '1',
    userkey_id:     '1'
)

