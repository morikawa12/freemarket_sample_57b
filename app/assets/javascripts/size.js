$(function(){

  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.size}</option>`;
    return html;
  }

  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="size_select_wrapper">
                        <h2>サイズ</h2>
                        <span>必須</span>
                          <select class="exhibition_select_field" name="item[size_id]" id="item_size_id"><option value="">---</option>
                            ${insertHTML}
                          </select>
                      </div>`;
    $('.category_wrapper').append(sizeSelectHtml);
  }



  
  // 孫カテゴリー選択後のイベント
  $('.category_wrapper').on('change','#grandchild_category_id', function(){
    var grandchildID = document.getElementById('grandchild_category_id').value;
    console.log(grandchildID)
    if (grandchildID != ""){
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { grandchild_id: grandchildID },
        dataType: 'json'
      })
      .done(function(sizes){
        console.log(sizes)
        $('.size_select_wrapper').remove();
        if(sizes.length > 1){
        var insertHTML = '';
        sizes.forEach(function(size){
          insertHTML += appendSizeOption(size);
        });
        appendSizeBox(insertHTML);
      }else{
        return
      }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('.size_select_wrapper').remove();
    }
  });
});