#rails db:seed:enduser �R�}���h�Ŏ��s����

# endusers�e�[�u���̃e�X�g�f�[�^���쐬
3.times do |i|
    Enduser.create!(
        enduser_cd:  "#{(i + 1) * 100}",
        todofuken:   "�k�C��",
        enduser_nm:  "�D�y�s#{i + 1}"
    )
end
3.times do |i|
    Enduser.create!(
        enduser_cd:  "#{(i + 1) * 1}",
        todofuken:   nil,
        enduser_nm:  "AA�������#{i + 1}"
    )
end
