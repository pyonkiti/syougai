class Motouke < ApplicationRecord
    # 親子関係
    has_many :tasks
end