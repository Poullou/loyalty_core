module Core
  class Retailer < ActiveRecord::Base

    has_and_belongs_to_many :offers, class_name: Offer.name, join_table: :core_offers_core_retailers, uniq: true
  end
end
