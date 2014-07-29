require 'rails_helper'

describe Categorization do
  it "validates the presence of a category" do
    kitten = Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")
    categorization = Categorization.new(kitten_id: kitten.id, category_id: 1)
    expect(categorization.valid?).to be true

    categorization.category_id = nil
    expect(categorization).to_not be_valid
  end
end