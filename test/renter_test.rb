require './lib/renter'
require 'minitest/autorun'
require 'pry'
class RenterTest < Minitest::Test

    def setup
        @renter1 = Renter.new("Jessie")
    end

    def test_it_exists
        assert_instance_of Renter , @renter1
    end
end