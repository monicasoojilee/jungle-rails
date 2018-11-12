require 'rails_helper'

RSpec.describe Product, type: :model do

  let (:category) {Category.create :name => "Anything"}

  describe 'Validations' do
    subject { 
      described_class.new(name: "Anything",
                          price_cents: 1600,
                          quantity: 8,
                          category: category) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
