// ----------------------------------------------
// 団体で自治体が選択された時
// ----------------------------------------------
// $(document).on('turbolinks:load', function() {
$(function() {
 
    // $('input[id="task_dantai_kbn_1"]').change('turbolinks:load', function() {
    $('#task_dantai_kbn_1').change(function() {

        //選択したvalue値を変数に格納
        var val = $(this).val();

        if ($(this).val() == 1) {
            // $("#task_todofuken").prop('disabled', false);               // 入力可にする
        }
    });
});


// ----------------------------------------------
// 団体で民間が選択された時
// ----------------------------------------------
// $(document).on('turbolinks:load', function() {
$(function(){

    // $('input[id="task_dantai_kbn_2"]').change('turbolinks:load', function() {
    $('#task_dantai_kbn_2').change(function() {

        var val = $(this).val();

        if ($(this).val() == 2) {
            // 入力不可にする
            // 入力不可にすると、更新されない　disabledだと値を送信しない
            // 　readonlyにするが、selectフィールドはreadonly属性を持っていない
            // $("#task_todofuken").prop('disabled', true);
            // $('#task_todofuken').html("<option value=''></option>");

            // $("#task_todofuken_hidden").val('');        //都道府県（隠し）の初期化
            // $('#task_todofuken').val('');               //都道府県の初期化
        }
    })
})


// ----------------------------------------------
// 団体区分の制御
// ----------------------------------------------
$(function() {
    $('#task_dantai_kbn_1').change(function() {

        $('#task_dantai_kbn_2').prop('checked', false);
        $('#task_dantai_kbn_3').prop('checked', false);
        $("#task_todofuken").prop('disabled', false);
        $("#task_enduser_id").prop('disabled', false);
    });
});

$(function() {
    $('#task_dantai_kbn_2').change(function() {

        $('#task_dantai_kbn_1').prop('checked', false);
        $('#task_dantai_kbn_3').prop('checked', false);
        $("#task_todofuken").prop('disabled', true);
        $("#task_enduser_id").prop('disabled', false);
        $("#task_todofuken_hidden").val('');            //都道府県（隠し）の初期化
        $('#task_todofuken').val('');                   //都道府県の初期化
    });
});


$(function() {
    $('#task_dantai_kbn_3').change(function() {

        $('#task_dantai_kbn_1').prop('checked', false);
        $('#task_dantai_kbn_2').prop('checked', false);
        $("#task_todofuken").prop('disabled', true);
        $("#task_enduser_id").prop('disabled', true);
        $('#task_todofuken').val('');
        $('#task_enduser_id').val('');
    });
});

// ----------------------------------------------
// 団体＝民間が選択された後、Ajax通信でエンドユーザーテーブルをセレクトボックスに表示
// ----------------------------------------------
$(function(){
    $('#task_dantai_kbn_2').change( function() {
        //ajax通信の設定
        $.ajax({
            url: '/tasks/search_mkn',         //searchメソッドへ遷移
            type: 'GET',                      //メソッドを指定
            // data: ('keyword=' + input),    //テキスト項目に入力した値を変数にセット
            processData: false,               //おまじない
            contentType: false,               //おまじない
            dataType: 'json'                  //データ形式を指定

        }).done(function(data){
            opt = "<option value=''></option>";
            var ecd = "";

            $(data).each(function(i, enduser){
                ecd = ("      " + String(enduser.enduser_cd)).slice(-6);
                opt = opt + "<option value=" + enduser.id + ">" + enduser.enduser_nm + "</option>";
            });
            $('#task_enduser_id').html(opt);
        })
    })
})

// ----------------------------------------------
// 都道府県が選択された後、Ajax通信で市町村名を連動させる
// ----------------------------------------------
$(function(){
    $('#task_todofuken').change(function() {
    
        //テキストで入力した値を変数にセット
        var input = $.trim($(this).val());  
        $("#task_todofuken_hidden").val(input);

        //ajax通信の設定
        $.ajax({
            url: '/tasks/search',             //searchメソッドへ遷移
            type: 'GET',                      //メソッドを指定
            data: ('keyword=' + input),       //テキスト項目に入力した値を変数にセット
            processData: false,               //おまじない
            contentType: false,               //おまじない
            dataType: 'json'                  //データ形式を指定
        }).done(function(data){

            var opt = "<option value=''></option>";
            var ecd = "";

            $(data).each(function(i, enduser){
                ecd = ("      " + String(enduser.enduser_cd)).slice(-6);
                opt = opt + "<option value=" + enduser.id + ">" + enduser.enduser_nm + "</option>";
            });
            $('#task_enduser_id').html(opt);
        })
    })
})

// ----------------------------------------------
// フォームロード時の処理
// ----------------------------------------------
$(document).ready( function(){

    var kbn2 = $('#task_dantai_kbn_2:checked').val();
    var kbn1 = $('#task_dantai_kbn_1:checked').val();

    // 自治体が選択
    if (kbn1 == "1" && kbn2 != "2"){
        // イベントを意図的に発生させる
        $('#task_dantai_kbn_1').trigger("change");
    }
    
    // 民間が選択（ラジオボタンの状態が2パターン発生する）
    if (kbn1 == "1" && kbn2 == "2"){
        // イベントを意図的に発生させるとajaxが動くため使えない
        // $('#task_dantai_kbn_2').trigger("change");

        $("#task_todofuken").prop('disabled', true);            // 都道府県を入力不可にする
        $('#task_todofuken').val('');
    }

    // 民間が選択（ラジオボタンの状態が2パターン発生する）
    if (kbn1 = "1" && kbn2 == "2"){
        $("#task_todofuken").prop('disabled', true);
        $('#task_todofuken').val('');       //都道府県
    }
})



// $(function(){
//     function aaa(){
//         alert("aaa");
//     }
// })
// テスト
// 自治体検索ボタン
// $(function(){
//     $('#task_idx_j').change('click', function(){
//         alert("自治体検索ボタン");              //ok
//     })
// })
// 下記２行はどっちでも同じではない
// atterは触れてしまうので×　propを利用する事
//$("#task_idx_enduser").attr('readonly', true);
//$("#task_idx_enduser").prop('disabled', true);
// alert("自治体");                         //ok
// $("h1").text("jQuery稼働テスト(稼働中)");   //OK
