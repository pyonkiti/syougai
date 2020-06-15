# # csvデータから、Userテーブルにインポート
# require 'csv'

# CSV.foreach(seed_user_csv.csv, headers: true) do |row|
#   User.create(
#     name:                   row['name'],
#     syain_id:               row['syain_id'],
#     name_id:                row['name_id'],
#     password:               row['password'],
#     password_confirmation:  row['password_confirmation'],
#     admin:                  row['admin']
#   )
# end
