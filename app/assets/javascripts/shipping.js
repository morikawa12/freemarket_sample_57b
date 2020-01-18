$( document ).on('turbolinks:load', function() {

  function appendShippingOption(shipping){
    var html = `<option value="${shipping.id}">${shipping.shipping}</option>`;
    return html;
  }

  function appendshippingBox(insertHTML){
    var shippingSelectHtml = '';
    shippingSelectHtml = `<div class="shipping-select-wrapper">
                        <h2>配送の方法</h2>
                        <span>必須</span>
                          <select class="exhibition_select_field" name="item[shipping_id]" id="item_shipping_id"><option value="">---</option>
                            ${insertHTML}
                          </select>
                      </div>`;
    $('.delivery-select-field').append(shippingSelectHtml);
  }

  $('#item_fee').on('change', function(){
    var fee_id = document.getElementById('item_fee').value;
    if (fee_id != ""){
      $.ajax({
        url: 'get_shipping',
        type: 'GET',
        data: { fee_id: fee_id },
        dataType: 'json'
      })
      .done(function(shipping_children){
        $('.shipping-select-wrapper').remove();
        var insertHTML = '';
        shipping_children.forEach(function(shipping){
          insertHTML += appendShippingOption(shipping);
        })
        appendshippingBox(insertHTML);
      })
      .fail(function(){
        alert('配送方法の取得に失敗しました');
      })
    }else{
      $('.shipping-select-wrapper').remove();
    }
  })

})