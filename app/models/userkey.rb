class Userkey < ApplicationRecord

    has_many :tasks

    # ユーザーキー入力チェック
    validates :userkey_cd,  presence: true,
                            uniqueness: true,
                            length: { in: 0..50 },
                            format: { with: /\A[a-zA-Z0-9_-]*\z/ }      # 英数字と「記号:_-」以外はエラー

    # ユーザー名入力チェック
    validates :userkey_nm,  presence: true,
                            length: { in: 0..50 }

end
