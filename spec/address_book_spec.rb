require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  context "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq 0
    end
  end

  context ".add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Test Name', '010.012.2942', 'test.name@test.com')

      expect(book.entries.size).to eq 1
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Test Name', '010.012.2942', 'test.name@test.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq 'Test Name'
      expect(new_entry.phone_number).to eq '010.012.2942'
      expect(new_entry.email).to eq 'test.name@test.com'
    end
  end

  context ".remove_entry" do
    it "removes a single entry from the address book" do
      book = AddressBook.new
      first_entry = book.add_entry('Test Name', '010.012.2942', 'test.name@test.com')
      second_entry = book.add_entry('New Test Name', '010.012.2942', 'test.name@test.com')

      book.remove_entry(second_entry)

      expect(book.entries.size).to eq 1
    end
  end
end