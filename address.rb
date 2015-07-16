class Address

    attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code

    def initialize(kind = nil, street_1 = nil, street_2 = nil, city = nil, state = nil, postal_code = nil)
        @kind = kind
        @street_1 = street_1
        @street_2 = street_2
        @city = city
        @state = state
        @postal_code = postal_code
    end

    def to_s(format = 'short')
        address = ''
        case format
        when 'long'
            address += street_1 + "\n"
            address += street_2 + "\n" unless street_2.nil?
            address += "#{city}, #{state}, #{postal_code}"
        when 'short'
            address += "#{kind}: "
            address += street_1
            if street_2
                address += " " + street_2
            end
            address += ", #{city}, #{state}, #{postal_code}"
        end
        address
    end
end
