// $(function(){

//     // ----------------------------------------------
//     // 横断検索
//     // ----------------------------------------------
//     function get_enuuser_select(data){
//     }

//     // ----------------------------------------------
//     // 団体＝民間が選択された後、Ajax通信でエンドユーザーテーブルをセレクトボックスに表示
//     // ----------------------------------------------
//     $('#task_search_odn').click( function() {
        
//         //テキストで入力した値を変数にセット
//         var input = $.trim($('#task_search_odn_text').val());  
//         if (input != ""){
//             // alert(input + " : テストアラート");

//             //ajax通信の設定
//             $.ajax({
//                 // url: '/tasks/search_odn',         //searchメソッドへ遷移
//                 url: '/tasks/index',         //searchメソッドへ遷移
//                 type: 'GET',                      //メソッドを指定
//                 data: ('keyword=' + input),       //テキスト項目に入力した値を変数にセット
//                 processData: false,               //おまじない
//                 contentType: false,               //おまじない
//                 dataType: 'json'                  //データ形式を指定

//             }).done(function(data){
//                 alert("ajaxの結果 : " + data);
//             }).fail(function() {
//                 alert('失敗');
//             })
//         } else {alert("未入力です");}
//     })
// })

