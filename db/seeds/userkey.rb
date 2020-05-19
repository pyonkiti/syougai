#rails db:seed:userkey 

# userkeys
3.times do |i|
    Userkey.create!(
        userkey_cd:  "user_#{i + 1}",
        userkey_nm:  "a"
    )
end
