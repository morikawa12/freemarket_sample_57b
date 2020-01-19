crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
end

crumb :exhibiting do
  link "出品した商品-出品中", item_management_user_path(params[:id])
  parent :mypage
end

crumb :product do
  link "商品出品画面", root_path
  parent :exhibiting
end

crumb :profile do
  link "プロフィール", root_path
  parent :mypage
end

crumb :payment do
  link "支払い方法", root_path
  parent :mypage
end

crumb :identity_infomation do
  link "本人情報の登録", root_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", root_path
  parent :mypage
end

crumb :credit do
  link "クレジットカード情報入力", root_path
  parent :mypage
end
