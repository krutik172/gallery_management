require 'rails_helper'

RSpec.describe Gallery, type: :model do
      image = Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/maxresdefault.jpg"))
      subject{
        described_class.new(title: "sample image",image: image,user_id: 1 )
    }
    it "should be valid with valid attributes" do
        expect(subject).to be_valid  
    end

    it "title should be there" do
        subject.title = nil
        expect(subject).to_not be_valid  
    end

    it "title should be there" do
        subject.image = nil
        expect(subject).to_not be_valid  
    end

    it "user must be there" do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end
end