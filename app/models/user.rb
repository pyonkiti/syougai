class User < ApplicationRecord

    # passwordをハッシュ化する
    has_secure_password

    validates :name, presence: true                         # 名前
    validates :name_id, presence: true, uniqueness: true    # ログインID

    # 親子関係
    has_many :tasks
end
