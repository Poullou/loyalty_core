module Core
  class Offer < ActiveRecord::Base

    has_and_belongs_to_many :retailers, -> { uniq }, {
      class_name: :'Core::Retailer',
      join_table: :core_offers_core_retailers
    }

    validates :ref, presence: true
    validates :discount_value, presence: true
    validates :discount_level, presence: true
    validates :name, presence: true
    validates :started_at, presence: true
    validates :ended_at, presence: true
    validates :expired_at, presence: true
    validates :retailers, presence: true
  end
end
