$( document ).on('turbolinks:load', function() {
  $('#item_price').on('input',function(e){
    var price = document.getElementById('item_price').value; 
    var tax_price = Math.floor(price * 0.1)
    var tax_price2 = tax_price.toLocaleString('ja-JP', {"style":"currency", "currency":"JPY"});
    var profit_price = Math.floor(price - tax_price)
    var profit_price2 = profit_price.toLocaleString('ja-JP', {"style":"currency", "currency":"JPY"});
    if(price >= 300){
      $('.tax-field').text(tax_price2)
      $('.profit-field').text(profit_price2)
    }else{
      $('.tax-field').text('');
      $('.profit-field').text('');
    }
  })
})