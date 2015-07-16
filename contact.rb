require './phone_number'
require './address'

class Contact

    attr_writer :first_name, :middle_name, :last_name
    attr_reader :phone_numbers, :addresses

    def initialize
        @phone_numbers = []
        @addresses = []
    end

    def add_phone_number(kind, number)
        phone_number = PhoneNumber.new
        phone_number.kind = kind
        phone_number.number = number
        phone_numbers << phone_number
    end

    def add_address(kind, street_1, street_2 = nil, city, state, postal_code)
        address = Address.new
        address.kind = kind
        address.street_1 = street_1
        address.street_2 = street_2
        address.city = city
        address.state = state
        address.postal_code = postal_code
        addresses << address
    end

    def first_name
        @first_name
    end

    def middle_name
        @middle_name
    end

    def last_name
        @last_name
    end

    def first_last
        first_last = first_name
        first_last += " #{last_name}" unless @last_name.nil?

        first_last
    end

    def last_first
        last_first = last_name
        last_first += ", #{first_name}" unless @first_name.nil?
        last_first += " #{middle_name.slice(0,1)}." unless @middle_name.nil?

        last_first
    end

    def full_name
        full_name = first_name
        full_name += " #{middle_name}" unless @middle_name.nil?
        full_name += " #{last_name}" unless @last_name.nil?

        full_name
    end

    def to_s(format = "full_name")
        case format
        when 'full_name' then full_name
        when 'last_first' then last_first
        when 'first' then first_name
        when 'last' then last_name
        else
            first_last
        end
    end

    def print_phone_numbers
        puts "Phone Numbers:"
        phone_numbers.each { |phone_number| puts phone_number }
    end

    def print_addresses
        puts "Addresses:"
        addresses.each { |address| puts address.to_s('short') }
    end
end

anthony = Contact.new
anthony.first_name = "Anthony"
anthony.last_name = "Hernandez"
anthony.add_phone_number("Home", "555-555-5555")
anthony.add_phone_number("Work", "012-345-6789")
anthony.add_address("School",
                    "663 Folsom St.",
                    "San Francisco",
                    "CA",
                    "94107"
)
puts anthony.to_s("full_name")
anthony.print_addresses
anthony.print_phone_numbers

puts

tony = Contact.new
tony.first_name = "Anthony"
tony.middle_name = "T"
tony.last_name = "Hernandez"
tony.add_phone_number("Home", "555-555-5555")
tony.add_phone_number("Work", "012-345-6789")
tony.add_address("School",
                    "663 Folsom St.",
                    "San Francisco",
                    "CA",
                    "94107"
)
puts tony.to_s("last_first")
tony.print_addresses
tony.print_phone_numbers