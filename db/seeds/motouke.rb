#rails db:seed:motouke �R�}���h�Ŏ��s����

# motoukes�e�[�u���̃e�X�g�f�[�^���쐬
3.times do |i|
    Motouke.create!(
        motouke_cd:  "#{(i + 1) * 1}",
        motouke_nm: "�������������#{i + 1}"
    )
end
