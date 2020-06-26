#rails db:seed:task 

# Tasksテーブルのテストデータを作成(Faker利用)
_date = Date.today
_time = Time.now

# 名称を取得
def get_meisyo(ikbn, i)
    case ikbn
        when 2
            case (i % 3)
                when 0 then '年間保守'
                when 1 then '年間'
                when 2 then '保守'
            end
        when 1
            case (i % 3)
                when 0 then '通常'
                when 1 then 'クレーム'
                when 2 then '手戻り'
            end
    end
end

5.times do |i|

    _date2 = _date.next_day(i).strftime("%Y-%m-%d")
    _date3 = _date.next_month(i).strftime("%Y-%m-%d")

    _time2 = (_time + i.hour).strftime("%H:%M:%S")
    _time3 = (_time + i.minute).strftime("%H:%M:%S")

    Task.create(
        dantai_kbn:     '1',
        todofuken:      Faker::Address.state,
        jigyou_kbn:     '1',
        kijyou:         "機場A　#{i.to_s.tr("A-Z0-9","Ａ-Ｚ０-９") * 3}",
        naiyou:         '内容' + 'あ'*3,
        jisyou:         '事象' + 'い'*3,
        syochi:         '処置' + 'う'*3,
        biko:           '備考' + 'え'*3,
        syubetu_kbn:    "#{get_meisyo(1, i)}",
        hosyou_kbn:     "#{get_meisyo(2, i)}",
        renraku_d:      "#{_date2}",
        renraku_t:      "#{_time2}",
        syanai:         '5.0',
        genchi_d:       "#{_date3}",
        genchi_t:       "#{_time3}",
        sagyou_d:       Faker::Date.between(from: '2020-01-01', to: '2021-12-31'),
        sagyou_t:       Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
        syagai:         i.to_i.even? ? "#{i+1}" : "#{i}",
        idou:           '4.0',
        teishi:         "#{sprintf('%0.1f',i)}",
        project_cd:     Faker::Code.npi,
        taiou_cd:       "#{i + 100}",
        taiou_sub:      Faker::JapaneseMedia::DragonBall.character,
        del_flg:        '0',
        user_id:        '1',
        enduser_id:     '1',
        motouke_id:     '1',
        userkey_id:     '1'
    )
end




# Tasksテーブルのテストデータを作成
# Task.create!(
#     dantai_kbn:     '1',
#     todofuken:      '北海道',
#     jigyou_kbn:     '1',
#     kijyou:         '機場A',
#     naiyou:         '内容ああ',
#     jisyou:         '事象ああ',
#     syochi:         '処置ああ',
#     biko:           '備考ああ',
#     syubetu_kbn:    '通常',
#     hosyou_kbn:     '年間保守',
#     renraku_d:      '2020-04-01',
#     renraku_t:      '10:01:02',
#     syanai:         '5.0',
#     genchi_d:       '2020-04-01',
#     genchi_t:       '10:01:02',
#     sagyou_d:       '2020-04-01',
#     sagyou_t:       '10:01:02',
#     syagai:         '5.0',
#     idou:           '4.0',
#     teishi:         '20.0',
#     project_cd:     '45-99-001',
#     taiou_cd:       '123',
#     taiou_sub:      '営業Aさん',
#     del_flg:        '0',
#     user_id:        '1',
#     enduser_id:     '1',
#     motouke_id:     '1',
#     userkey_id:     '1'
# )

