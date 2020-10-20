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
end