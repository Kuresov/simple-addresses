require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end

  context "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(book.entries.size).to eq 0
    end
  end

  context ".add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Test Name', '010.012.2942', 'test.name@test.com')

      expect(book.entries.size).to eq 1
    end

    it "adds the correct information to entries" do
      book.add_entry('Test Name', '010.012.2942', 'test.name@test.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq 'Test Name'
      expect(new_entry.phone_number).to eq '010.012.2942'
      expect(new_entry.email).to eq 'test.name@test.com'
    end
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")

      expect(book.entries.size).to eql 5
    end

    it "imports the first entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-5555", "bill@testmail.com")
    end

    it "imports the second entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5555", "bob@testmail.com")
    end
    it "imports the third entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-5555", "joe@testmail.com")
    end
    it "imports the fourth entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-5555", "sally@testmail.com")
    end
    it "imports the fifth entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-5555", "sussie@testmail.com")
    end
  end

  context ".import_from_csv with entries_2.csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      expect(book.entries.size).to eql 3
    end

    it "imports the first entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Alex", "555-555-5555", "alex@testmail.com")
    end

    it "imports the second entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Alexander", "555-555-5555", "alexander@testmail.com")
    end

    it "imports the thid entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Alexzandrovski", "555-555-5555", "alexz@testmail.com")
    end
  end
end