#親
apparel_size = Size.create(size: "洋服のサイズ")
lady_shoes_size =Size.create(size: "女性の靴のサイズ")
men_shoes_size =Size.create(size: "男性の靴のサイズ")


apparel_size.children.create([{size: "XXS以下"},{size: "XS(SS)"},{size: "S"},{size: "M"},{size: "L"},{size: "XL(LL"},{size: "2XL(3L)"},{size: "3XL(4L)"},{size: "4XL(5L)以上"},{size: "FREE SIZE"}])
lady_shoes_size.children.create([{size: "20cm以下"},{size: "20.5cm"},{size: "21cm"},{size: "21.5cm"},{size: "22cm"},{size: "22.5cm"},{size: "23cm"},{size: "23.5cm"},{size: "24cm"},{size: "24.5cm"},{size: "25cm"},{size: "25.5cm"},{size: "26cm"},{size: "26.5cm"},{size: "27cm"},{size: "27.5cm以上"}])
men_shoes_size.children.create([{size: "23.5cm以下"},{size: "24cm"},{size: "24.5cm"},{size: "25cm"},{size: "25.5cm"},{size: "26cm"},{size: "26.5cm"},{size: "27cm"},{size: "27.5cm"},{size: "28cm"},{size: "28.5cm"},{size: "29cm"},{size: "29.5cm"},{size: "30cm"},{size: "30.5cm"},{size: "31cm以上"}])