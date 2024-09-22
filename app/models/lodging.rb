class Lodging < ApplicationRecord
  
  def self.search_for(content, method)
    if method == 'perfect'
      Lodging.where(address: content)
    elsif method == 'partial'
      Lodging.where('address LIKE ?', '%'+content+'%')
    else
      Lodging.all
    end
  
  end
end
