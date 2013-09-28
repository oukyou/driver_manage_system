/*jslint sloppy: true , browser: true */
/*global AZBIL, jQuery, $ */
/**
 * @fileOverview Carのメッセージ名前空間のJavaScript
 */
$(function () {
  /**
   * ページ上部へスクロールする。
   * 「ページの上へ」リンクは、windowのスクロールバーが表示されているときのみ表示する。
   *
   * //設計メモ
   *   リンクを非表示にする処理は、footer.htmlを外部読み込みしているため、画面サンプルでは実行されない。
   */
  var $toPageTop = $("#to_page_top");
  $toPageTop.hide();
  $(window).scroll(function () {
    if ($(this).scrollTop() > 0) {
      $toPageTop.show();
    }
  });

  $(document).on('click',"#to_page_top", function() {
    $('html,body').animate({ scrollTop: 0 }, 'slow');
    return false;
  });

  /**
   * Datepicker for Bootstrap
  */
  $('.datepicker').datepicker({
    format: 'yyyy/mm/dd', language: 'ja'
  });
});

function openwindow(url,iHeight,iWidth)
{
  var iTop = (window.screen.availHeight-30-iHeight)/2;
  var iLeft = (window.screen.availWidth-10-iWidth)/2;
  window.open(url,"驾驶员调度信息管理系统",'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}