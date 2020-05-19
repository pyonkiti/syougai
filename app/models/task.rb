class Task < ApplicationRecord

    # 必須入力チェック
    # referenceを貼っている項目はvalidatesを付けなくても、自動でエラーチェックがかかるので不要
    # ここにつけると逆に二重チェックが掛かってしまう
    # validates :enduser_id, presence: true           # エンドユーザー
    # validates :motouke_id, presence: true           # 元請け
    validates :taiou_cd,   presence: true           # 対応者コード

    # カンマエラーチェック
    #validate :vali_not_including_comma         # エンドユーザー

    # 親子関係
    belongs_to :user
    belongs_to :enduser
    belongs_to :motouke
    belongs_to :userkey

    private

    def vali_not_including_comma
        errors.add(:enduser, 'カンマを含める事はできません') if enduser&.include?(',')
    end
    

end
