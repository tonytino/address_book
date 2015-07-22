# Object-Oriented Address Book Application (Ruby)

## About The Application

User can run the program in their terminal and interact with it using the command line.
The user is prompted to select from menu options, which include:
  - Adding a contact
    - Adding phone numbers to a contact
    - Adding addresses to a contact
  - Printing the name of each individual in the address book
  - Searching through the address book based on any keywords
  - Exiting the application

Upon starting the application, the contacts.yml file will be loaded.
If it exists, all data saved in it will be accessible through the application.
Otherwise, the address book will be empty and the file will be created upon exit.
The data from the session will then be saved in the new file.

### Try The Application

1. Download the repository. 
2. Navigate to the directory in your terminal (assuming you're using a Mac).
3. Run the following line to start the application: `ruby address_book.rb`
4. Fork this repository and create a pull request with an suggestions, or create an issue! :)

## Outstanding Goals (No Particular Order)

### Code Integrity

Add RSpec tests for every method of every class!

Refactor code!

### Additional Features

Allow users to:
  - update contacts
    - update names
    - update phone numbers
    - update addresses
  - search with more specificity (based on name, phone number, or address, rather than all)
  - delete contacts
    - delete phone numbers
    - delete addresses
  - specify the name of the file to save to or load from
  - add, update, or delete e-mail addresses associated with contacts
