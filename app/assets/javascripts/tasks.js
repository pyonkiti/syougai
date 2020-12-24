// ----------------------------------------------
// _form 画面
// ----------------------------------------------
$(function(){

    // ----------------------------------------------
    // イベント : フォームロード
    // ----------------------------------------------
    $(document).ready( function(){
        remote_disp(2);                     // リモート保守作業記録
        remote_disp(1);                     // 個人情報の扱い
    });
    
    // ----------------------------------------------
    // イベント : リモート保守作業記録入力
    // ----------------------------------------------
    $('#task_remote_kbn').change(function() {
        remote_disp(2);                     // リモート保守作業記録の初期表示
    });

    // ----------------------------------------------
    // イベント : リモート作業事由
    // ----------------------------------------------
    $('#task_remote_jiyu_kbn').change(function() {
        remote_disp(3);                     // リモート作業事由
    });

    // ----------------------------------------------
    // イベント : リモート作業処理内容
    // ----------------------------------------------
    $('#task_remote_syori_kbn').change(function() {
        remote_disp(4);                     // リモート作業処理内容
    });

    // ----------------------------------------------
    // イベント : 個人情報の扱い
    // ----------------------------------------------
    $('#task_remote_kojin_kbn').change(function() {
        remote_disp(1);                     // 個人情報の扱い
    });
    
    // ----------------------------------------------
    // 共通関数 ： リモート保守作業記録入力の制御
    // ----------------------------------------------
    function remote_init(dis_flg) {
        
        $('#task_remote_sagyou_ts').prop('disabled', dis_flg);
        $('#task_remote_sagyou_te').prop('disabled', dis_flg);
        $('#task_remote_jiyu_kbn').prop('disabled', dis_flg);
        $('#task_remote_jiyu_sonota').prop('disabled', dis_flg);
        $('#task_remote_syori_kbn').prop('disabled', dis_flg);
        $('#task_remote_syori_sonota').prop('disabled', dis_flg);
        $('#task_remote_kojin_kbn').prop('disabled', dis_flg);
        $('#task_remote_syousai').prop('disabled', dis_flg);
    };

    // ----------------------------------------------
    // リモート保守作業記録のイベント制御
    // ----------------------------------------------
    function remote_disp(komoku) {

        switch (komoku) {
            case 1:
                // 個人情報の扱い
                // propはチェックボックスの状態を取得
                if ($('#task_remote_kojin_kbn').prop('checked') == true) {
                    $('p#task_remote_kojin_kbn_lbl').text('有');
                } else {
                    $('p#task_remote_kojin_kbn_lbl').text('無');
                };

            case 2:
                // リモート保守作業記録の初期表示
                if ($('#task_remote_kbn').prop('checked') == true) {
                    remote_init(false);
                    $('p#task_remote_kbn_lbl').text('入力可');
                } else {
                    remote_init(true);
                    $('p#task_remote_kbn_lbl').text('入力不可');
                };

            case 3:
                // リモート作業事由
                if ($('#task_remote_kbn').prop('checked') == true) {
                    if ($('#task_remote_jiyu_kbn').val() == "その他") {
                        $('#task_remote_jiyu_sonota').prop('disabled', false);
                    } else {
                        $('#task_remote_jiyu_sonota').prop('disabled', true);
                        $('#task_remote_jiyu_sonota').val('');
                    };
                } else {
                    $('#task_remote_jiyu_sonota').prop('disabled', true);
                };

            case 4:
                // リモート作業処理内容
                if ($('#task_remote_kbn').prop('checked') == true) {
                    if ($('#task_remote_syori_kbn').val() == "その他") {
                        $('#task_remote_syori_sonota').prop('disabled', false);
                    } else {
                        $('#task_remote_syori_sonota').prop('disabled', true);
                        $('#task_remote_syori_sonota').val('');
                    };
                } else {
                    $('#task_remote_syori_sonota').prop('disabled', true);
                };
        };
    };
});