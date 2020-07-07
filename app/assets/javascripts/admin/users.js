// ログインユーザー（編集）

// ----------------------------------------------
// パスワード表示
// ----------------------------------------------
$(document).on('turbolinks:load', function() {
    $(function(){
        $('#users_passcheck').change(function(){
            if ( $(this).prop('checked') ) {
                $('#users_password').attr('type','text');
            } else {
                $('#users_password').attr('type','password');
            }
        })
    })
})
