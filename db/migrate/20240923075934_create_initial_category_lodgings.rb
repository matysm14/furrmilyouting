class CreateInitialCategoryLodgings < ActiveRecord::Migration[6.1]
  def change
      categories = ["駐車場有", "犬用ご飯有", "犬用ベッド有", "ドッグラン有", "プライベートドッグラン有", "頭数制限有", "犬種（大きさ）制限有"]
      categories.each do |category|
        Category.create(name: category)
    end
  end
end
