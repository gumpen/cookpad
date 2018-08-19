$(document).on('turbolinks:load', function() {
  // モーダルの表示
  $('.modal').modaal({width: 600, height:250});

  $(function(){
    //残り文字数を表す要素を無ければ追加する
    function add_count_disp(targetElement){
        if(!targetElement.prev().hasClass("count-disp")){
        targetElement.before('<p class="count-disp"></p>');
      }
    }
    //指定した要素の残り入力可能文字数を表示する
    function count_length(targetElement){
      var inputlength = targetElement.val().length;
      var maxlength = targetElement.attr("maxlength");

      if(!maxlength) return;

      var count = (maxlength - inputlength);
      var count_message = 'あと' + count + '文字';

      if(targetElement.prev().hasClass("count-disp")){
          targetElement.prev().html(count_message);
      }
    }
    //クラス:count-lengthの要素に入力があるたびに呼び出す
    $(".count-length").keyup(function(){
      add_count_disp($(this));
      count_length($(this));
    })
    //ページ読み込み時、クラス：count-lengthのすべての要素の入力文字数をカウント
    $(".count-length").each(function(){
      add_count_disp($(this));
      count_length($(this));
    })
  });
});
