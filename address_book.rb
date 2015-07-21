require './contact'

class AddressBook

    attr_reader :contacts

    def initialize
        @contacts = []
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
        puts "Contact List:"
        contacts.each do |contact|
            puts contact.to_s('last_first')
        end
    end

    def print_results(search, results)
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

address_book.contacts << tony

address_book.find_by_name("z")
address_book.find_by_phone_number("5")
address_book.find_by_address("663 Folsom St.")