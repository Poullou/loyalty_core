require 'test_helper'

module Core
  class OfferTest < ActiveSupport::TestCase
    include TestAssertion, TestData

    test 'offer without ref is invalid' do
      assert_invalid(Offer.new, :ref)
    end

    test 'offer without discount_value is invalid' do
      assert_invalid(Offer.new, :discount_value)
    end

    test 'offer without discount_level is invalid' do
      assert_invalid(Offer.new, :discount_level)
    end

    test 'offer without started_at is invalid' do
      assert_invalid(Offer.new, :started_at)
    end

    test 'offer without ended_at is invalid' do
      assert_invalid(Offer.new, :ended_at)
    end

    test 'offer without expired_at is invalid' do
      assert_invalid(Offer.new, :expired_at)
    end

    test 'offer without name is invalid' do
      assert_invalid(Offer.new, :name)
    end

    test 'offer without any retailer is invalid' do
      assert_invalid(Offer.new, :retailers)
    end

    test 'can save offer' do
      offer = Offer.new(offer_attributes)

      assert offer.valid?
      assert offer.save
    end

    test 'cannot save offer with two same retailers' do
      retailer = create_retailer
      offer = create_offer(retailers: [retailer, retailer])

      assert_equal 1, offer.retailers.size
    end
  end
end
