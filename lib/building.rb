class Building
    attr_reader :units
    def initialize
        @units = []
    end

    def add_unit(unit)
        @units << unit
    end

    def renters
        unit_renters = @units.map do |unit|
            unit.renter
        end
    end

    def average_rent
       total_rent = 0.0
       @units.each do |unit|
        total_rent += unit.monthly_rent
       end
       average_rent = total_rent / @units.count
    end

    def rented_units
        units_rented = @units.map do |unit|
            if unit.renter != nil
                unit
            end
        end
        #There has to be a better way to do this, this feels clunky
    end

    def renter_with_highest_rent
        @units.max_by{|unit| unit.monthly_rent}.renter
    end

    def units_by_number_of_bedrooms
        @units.group_by {|rooms| rooms.bedrooms}
        
        #unit_by_room is a hash that does what is asked, just not in the right format :/
        #not sure how to only get the number to return
    end
end