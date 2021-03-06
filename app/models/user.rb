class User < ApplicationRecord

    # passwordをハッシュ化する
    has_secure_password

    # 親子関係
    has_many :tasks

    validates :name,    presence: true                              # 名前
    validates :name_id, presence: true, uniqueness: true            # ログインID

    # 半角英数字6文字以上50文字以下
    VALD_PASSWORD_1 = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,50}+\z/i

    # 半角英(記号含む)数字6文字以上50文字以下
    valid_kigo = "\!\"\#\$\%\&\'\(\)\=\~\|\\\^\-\`\{\@\[\+\*\}\;\:\]\<\>\?\_\,\.\/"
    VALD_PASSWORD_2 = /\A(?=.*?[a-z#{valid_kigo}])(?=.*?\d)[a-z#{valid_kigo}\d]{6,50}+\z/

    validates :password, format: { with: VALD_PASSWORD_2 }            # パスワード 半角英数字6文字以上50文字以下

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
