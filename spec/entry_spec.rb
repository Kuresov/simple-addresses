require_relative '../models/entry.rb'

RSpec.describe Entry do
  context "attributes" do
    it "should respond to name" do
      entry = Entry.new('Test Name', '010.012.2942', 'test.name@test.com')
      expect(entry).to respond_to(:name)
    end

    it "should respond to phone number" do
      entry = Entry.new('Test Name', '010.012.2942', 'test.name@test.com')
      expect(entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new('Test Name', '010.012.2942', 'test.name@test.com')
      expect(entry).to respond_to(:email)
    end
  end

  context ".to_s" do
    it "prints the entry as a string" do
      entry = Entry.new('Test Name', '010.012.2942', 'test.name@test.com')
      expected_string = "Name: Test Name\nPhone Number: 010.012.2942\nEmail: test.name@test.com"

      expect(entry.to_s).to eq(expected_string)
    end
  end
end