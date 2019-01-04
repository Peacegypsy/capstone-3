class Card < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|

            card_hash = row.to_hash
            card = Card.where(id: card_hash["id"])
            puts card_hash 
            if card.count == 1
                card.first.update_attributes(card_hash)
            else
                Card.create(card_hash)
            end
        end
    end
 end
