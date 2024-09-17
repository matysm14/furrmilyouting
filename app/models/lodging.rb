class Lodging < ApplicationRecord
  def self.looks(search, word)
    if search == "perfect_match"
      @lodging = Lodging.where("address LIKE?", "#{word}")
    elsif search == "forward_match"
      @lodging = Lodging.where("address LIKE?","#{word}%")
    elsif search == "backward_match"
      @lodging = Lodging.where("address LIKE?","%#{word}")
    elsif search == "partial_match"
      @lodging = Lodging.where("address LIKE?","%#{word}%")
    else
      @lodging = Lodging.all
    end
  end
end
