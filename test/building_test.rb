require './lib/renter'
require './lib/apartment'
require './lib/building'
require 'minitest/autorun'
require 'pry'

class ApartmentTest < Minitest::Test
    def setup
        @building = Building.new
        @renter1 = Renter.new("Aurora")
        @renter2 = Renter.new("Tim")
        @renter3 = Renter.new("Spencer")
        @renter4 = Renter.new("Jessie")
        @renter5 = Renter.new("Max")
        @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
        @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
        @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
        @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    end
    def test_it_exists
        assert_instance_of Building , @building
    end


    def test_it_has_attributes
        assert_equal [] , @building.units
    end

    def test_it_can_add_units
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        assert_equal [@unit1, @unit2] , @building.units
    end

    def test_it_can_see_renters
        @unit1.add_renter(@renter1)
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.renters
        @unit2.add_renter(@renter2)
        
        assert_equal [@renter1 , @renter2] , @building.renters
    end

    def test_it_can_average_the_rent
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @unit1.add_renter(@renter1)
        @unit2.add_renter(@renter2)
       
        assert_equal 1099.5 , @building.average_rent
    end
    def test_it_can_return_rented_units
        @building.add_unit(@unit2)
        @unit2.add_renter(@renter2)
        assert_equal [@unit2], @building.rented_units
    end

    def test_it_can_give_renter_with_highest_rent
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)
        @unit2.add_renter(@renter3)
        @unit1.add_renter(@renter4)
        
        assert_equal @renter4 , @building.renter_with_highest_rent
    end

    def test_it_can_return_units_by_rooms
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)
        @building.add_unit(@unit4)

    
        binding.pry
    end
end