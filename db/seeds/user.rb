#rails db:seed:user �R�}���h�Ŏ��s����

# User�e�[�u���̃e�X�g�f�[�^���쐬
User.create!(
    name:            '�Ǘ���',
    name_id:         'admin',
    password:        'admin',
    password_confirmation: 'admin',
    admin:           'true'
)

User.create!(
    name:            '���[�U�[',
    name_id:         'user',
    password:        'user',
    password_confirmation: 'user',
    admin:           'false'
)
