postage_included = Shipping.create(shipping: "送料込み(出品者負担)")
cash_on_delivery = Shipping.create(shipping: "着払い(購入者負担)")

postage_included.children.create([{shipping: "未定"},{shipping: "らくらくメルカリ便"},{shipping: "ゆうメール"},{shipping: "レターパック"},{shipping: "普通郵便(定形、定形外)"},{shipping: "クロネコヤマト"},{shipping: "ゆうパック"},{shipping: "クリックポスト"},{shipping: "ゆうパケット"}])
cash_on_delivery.children.create([{shipping: "未定"},{shipping: "ゆうパック"},{shipping: "ゆうメール"},{shipping: "クロネコヤマト"}])
