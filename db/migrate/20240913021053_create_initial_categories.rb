class CreateInitialCategories < ActiveRecord::Migration[6.1]
  def change
      categories = ["駐車場有", "犬用メニュー有", "ドッグラン有", "店内同伴可", "テラス席のみ同伴可", "頭数制限有", "犬種（大きさ）制限有"]
      categories.each do |category|
        Category.create(name: category)
        
    end
  end
end
