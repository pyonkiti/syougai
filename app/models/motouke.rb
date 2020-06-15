class Motouke < ApplicationRecord
    
    # 親子関係
    has_many :tasks

    # 元請け名入力チェック
    validates :motouke_nm,  presence: true,
                            length: { in: 0..10 }

end