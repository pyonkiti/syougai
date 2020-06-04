class User < ApplicationRecord

    # passwordをハッシュ化する
    has_secure_password

    validates :name, presence: true                         # 名前
    validates :name_id, presence: true, uniqueness: true    # ログインID

    # 親子関係
    has_many :tasks

    # Userテーブルの出力項目
    def self.csv_attributes
        ["name", "syain_id", "name_id", "password_digest", "admin", "created_at", "updated_at"]
    end

    # UserテーブルをCSV出力する
    def self.generate_csv
        CSV.generate(headers: true) do |csv|
            csv << csv_attributes
            all.each do |user|
                csv << csv_attributes.map{|attr| user.send(attr)}
            end
        end
    end

    # UserテーブルにCSVファイルをインポートする
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            user = new
            user.attributes = row.to_hash.slice(*csv_attributes)
            user.save!
        end
    end
end
