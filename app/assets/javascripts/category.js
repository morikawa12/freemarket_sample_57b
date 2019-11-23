$( document ).on('turbolinks:load', function() {

  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }


  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = ` <div class="children_category_wrapper">
                          <select class="exhibition_select_field" name="item[category_id]" id="child_category_id"><option value="">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.category_wrapper').append(childSelectHtml);
  }


  function appendGrandChidrenBox(insertHTML){
    var grandchildselectHtml = '';
    grandchildselectHtml = `<div class="grandchildren_category_wrapper">
                              <select class="exhibition_select_field" name="item[category_id]" id="grandchild_category_id"><option value="">---</option>
                                ${insertHTML}
                              </select>
                            </div>`;
    $('.category_wrapper').append(grandchildselectHtml);
  }


  // 親カテゴリーの選択イベント
  $('#item_category_id').on('change', function(){
    // 親カテゴリーのidのvalueを取得
    var parentCategory = document.getElementById('item_category_id').value;
    // もしparentCategoryが空じゃなかったらajax通信を始める
    if (parentCategory != ""){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('.children_category_wrapper').remove(); 
        $('.grandchildren_category_wrapper').remove(); 
        $('.size_select_wrapper').remove();
        $('.brand_input_field').css('display','none');
        $('#item_brand_attributes_name').val("");
        var insertHTML = '';
        children.forEach(function(children){
          insertHTML += appendOption(children);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      //親カテゴリーが初期値になった時、子以下を削除する
      $('.children_category_wrapper').remove(); 
      $('.grandchildren_category_wrapper').remove(); 
      $('.size_select_wrapper').remove();
      $('.brand_input_field').css('display','none');
      $('#item_brand_attributes_name').val("");
    }
  });
  // 子カテゴリーの選択イベント
  $('.category_wrapper').on('change','#child_category_id', function(){
    // 子カテゴリーのidのvalueを取得
    var childCategory = document.getElementById('child_category_id').value;
    // もしchildCategoryが空じゃなかったらajax通信を始める
    if (childCategory != ""){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childCategory },
        dataType: 'json'
      })
      .done(function(grandchild){
        $('.grandchildren_category_wrapper').remove(); 
        $('.size_select_wrapper').remove();
        $('.brand_input_field').css('display','none');
        $('#item_brand_attributes_name').val("");
        var insertHTML = '';
        grandchild.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      // 子カテゴリが初期値になった時、孫以下を削除
      $('.grandchildren_category_wrapper').remove(); 
      $('.size_select_wrapper').remove();
      $('.brand_input_field').css('display','none');
      $('#item_brand_attributes_name').val("");
    }
  });

});

  
  

