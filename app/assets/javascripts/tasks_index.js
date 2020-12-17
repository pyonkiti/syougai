// ----------------------------------------------
// スクロールボタン
// ----------------------------------------------
$(function() {

    var topBtn = $('#page-top');    
    topBtn.hide();
    // スクロールが100に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            topBtn.fadeIn();
        } else {
            topBtn.fadeOut();
        }
    });
    //スクロールしてトップ
    topBtn.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});



// ttttttttttttttttttttttttttt
// ----------------------------------------------
// リモート保守作業記録の制御
// ----------------------------------------------
$(function() {

    // リモート作業事由
    $('#task_remote_jiyu_kbn').change(function() {

        var r = $('#task_remote_jiyu_kbn').val();
        alert('err = ' + r);
    });

    // リモート作業処理内容
    $('#task_remote_syori_kbn').change(function() {

        var r = $('#task_remote_syori_kbn').val();
        
        alert('err =' + r);
        console.log(r);
    });

});
// ttttttttttttttttttttttttttt




// ----------------------------------------------
// 団体区分の制御
// ----------------------------------------------
$(function() {
    
    // 団体＝自治体が選択
    $('#task_dantai_kbn_1').change(function() {

        $('#task_dantai_kbn_2').prop('checked', false);
        $('#task_dantai_kbn_3').prop('checked', false);
        $("#task_todofuken").prop('disabled', false);
        $("#task_enduser_id").prop('disabled', false);
    })

    // 団体＝民間が選択
    $('#task_dantai_kbn_2').change(function() {

        $('#task_dantai_kbn_1').prop('checked', false);
        $('#task_dantai_kbn_3').prop('checked', false);
        $("#task_todofuken").prop('disabled', true);
        $("#task_enduser_id").prop('disabled', false);
        $("#task_todofuken_hidden").val('');            //都道府県（隠し）の初期化
        $('#task_todofuken').val('');                   //都道府県の初期化
    })

    // 団体＝全てが選択
    $('#task_dantai_kbn_3').change(function() {

        $('#task_dantai_kbn_1').prop('checked', false);
        $('#task_dantai_kbn_2').prop('checked', false);
        $("#task_todofuken").prop('disabled', true);
        $("#task_enduser_id").prop('disabled', true);
        $('#task_todofuken').val('');
        $('#task_enduser_id').val('');
    })
});


$(function(){

    function get_enuuser_select(data){
        opt = "<option value=''></option>";
        var ecd = "";
        
        $(data).each(function(i, enduser){
            ecd = ("      " + String(enduser.enduser_cd)).slice(-6);
            opt = opt + "<option value=" + enduser.id + ">" + enduser.enduser_nm + "</option>";
        });
        $('#task_enduser_id').html(opt);
    }

    // ----------------------------------------------
    // 団体＝民間が選択された後、Ajax通信でエンドユーザーテーブルをセレクトボックスに表示
    // ----------------------------------------------
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
            get_enuuser_select(data);
        }).fail(function() {
            console.log("民間が選択された時に、ajaxでエラー");
        })
    })

    // ----------------------------------------------
    // 団体＝自治体で、都道府県が選択された後、Ajax通信で市町村名を連動させる
    // ----------------------------------------------
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
            get_enuuser_select(data);
        }).fail(function() {
            console.log("団体が選択された時に、ajaxでエラー");
        })
    })

    // ----------------------------------------------
    // フォームロード時の処理
    // ----------------------------------------------
    $(document).ready( function(){

        var kbn1 = $('#task_dantai_kbn_1:checked').val();
        var kbn2 = $('#task_dantai_kbn_2:checked').val();

        // 自治体が選択（ラジオボタンの状態が2パターン発生する）
        if (kbn1 == "1") {
            if (kbn2 == "2"){
                // イベントを意図的に発生させるとajaxが動くため使えない
                // $('#task_dantai_kbn_2').trigger("change");
                $("#task_todofuken").prop('disabled', true);            // 都道府県を入力不可にする
                $('#task_todofuken').val('');
            } else {
                // イベントを意図的に発生させる
                $('#task_dantai_kbn_1').trigger("change");
                // これを付けるとプルダウン表示はOKになるが、初期表示が消える
                // $('#task_todofuken').trigger("change");
            }
        // 民間が選択
        } else {
            if (kbn2 == "2"){
                // これを付けるとプルダウン表示はOKになるが、初期表示が消える
                // $('#task_dantai_kbn_2').trigger("change");
                $("#task_todofuken").prop('disabled', true);
                $('#task_todofuken').val('');                           //都道府県を初期化
                // イベントを意図的に発生
                $('#task_dantai_kbn_2').trigger("change");
            } else {
            }
        }
    });
});