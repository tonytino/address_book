require './contact'

class AddressBook

    attr_reader :contacts

    def initialize
        @contacts = []
    end

    # Clears the content on the screen.
    def clear_screen!
        print "\e[2J"
    end

    # Moves the "cursor" back to the upper left.
    def move_to_home!
        print "\e[H"
    end

    def reset_screen!
        clear_screen!
        move_to_home!
    end

    def run
        loop do
            reset_screen!
            puts 'Address Book Main Menu'
            puts 'a: Add Contact'
            puts 'p: Print Address Book'
            puts 'e: Exit'
            print 'Enter your choice: '

            input = gets.chomp.downcase

            case input
            when 'a'
                add_contact
            when 'p'
                print_contact_list
            when 'e'
                reset_screen!
                break
            end
        end
    end

    def add_contact
        reset_screen!
        contact = Contact.new

        puts "All contacts must have either a first or last name."
        print 'First name: '
        contact.first_name = gets.chomp
        print 'Middle name: '
        contact.middle_name = gets.chomp
        print 'Last name: '
        contact.last_name = gets.chomp

        if contact.first_name == "" && contact.last_name == ""
            puts "Oops! That contact didn't have a first or last name. Please try again."
            add_contact
        else
            loop do
                reset_screen!
                puts "Add phone number or address? "
                puts "p: Add phone number"
                puts "a: Add Address"
                puts "b: Back to Main Menu"

                input = gets.chomp.downcase

                case input
                when 'p'
                    reset_screen!
                    phone = PhoneNumber.new
                    print "Please provide a type (Home, Work, School, etc.): "
                    phone.kind = gets.chomp
                    print "Number: "
                    phone.number = gets.chomp
                    contact.phone_numbers << phone
                when 'a'
                    reset_screen!
                    address = Address.new
                    print "Please provide a type (Home, Work, School, etc.): "
                    address.kind = gets.chomp
                    print "Address line 1: "
                    address.street_1 = gets.chomp
                    print "Address line 2: "
                    address.street_2 = gets.chomp
                    print "City: "
                    address.city = gets.chomp
                    print "State: "
                    address.state = gets.chomp
                    print "Postal Code: "
                    address.postal_code = gets.chomp
                    contact.addresses << address
                when 'b'
                    break
                end
            end

            contacts << contact
            puts "Contact successfully added."
        end

    end

    def find_by_name(name)
        results = []
        search = name.downcase
        contacts.each do |contact|
            results << contact if contact.full_name.downcase.include?(search)
        end
        print_results("Name search results (#{name}):", results)
    end

    def find_by_phone_number(number)
        results  = []
        search = number.gsub('-','')

        contacts.each do |contact|
            contact.phone_numbers.each do |phone_number|
                if phone_number.number.gsub('-','').include?(search)
                    results << contact unless results.include?(contact)
                end
            end
        end

        print_results("Phone search results (#{number}):", results)
    end

    def find_by_address(query)
        results  = []
        search = query.downcase

        contacts.each do |contact|
            contact.addresses.each do |address|
                if address.to_s('long').downcase.include?(search)
                    results << contact unless results.include?(contact)
                end
            end
        end

        print_results("Address search results (#{query}):", results)
    end

    def print_contact_list
        reset_screen!
        puts "Contact List:"
        contacts.each do |contact|
            puts contact.to_s('last_first')
        end

        print "Press enter at any time to return to the Main Menu: "
        gets
    end

    def print_results(search, results)
        reset_screen!
        puts search

        results.each do |contact|
            puts contact.to_s('full_name')
            contact.print_phone_numbers
            contact.print_addresses
            puts
        end
    end

end

address_book = AddressBook.new
address_book.run