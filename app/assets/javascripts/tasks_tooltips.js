// ツールチップにHTMLを埋め込む
$(document).ready(function() {
    var tooltipHtml = `
    <div>
        <div class="tooltipClose">× 横断検索条件</div>
            <div style="margin: 10px">
                <div>
                    下記の項目で検索します<br>
                    ・都道府県名<br>
                    ・エンドユーザー名<br>
                    ・元請け名　　　　・機場名<br>
                    ・内容　　　　　　・処置<br>
                    ・現象／原因　　　・備考<br>
                    ・対応者<br>
                    ・対応者（サブ）<br>
                    ・プロジェクトコード<br>
                    ・ユーザーキー<br>
                </div>
            </div>
        </div>
    </div>`;
  
    $("#search_karam_tooltip").tooltip({
        content: tooltipHtml
    });

    $("#search_karam_tooltip_").tooltip(
        
    );
});

