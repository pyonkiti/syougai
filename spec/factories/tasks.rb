FactoryBot.define do
    factory :task do
        dantai_kbn { '1' }
        enduser { '米原市' }
        motouke { 'ウォーターエージェンシー' }
        naiyou { '内容' }
        syubetu_kbn { '通常' }
        renraku_d { '2020/01/01' }
        renraku_t { '12:01:01' }
        sagyou_d { '2020/02/01' }
        idou { '5.50' }
        taiou_cd { '123' }
        del_flg { '0' }
        user
    end
end