require 'rails_helper'

RSpec.describe LabTest, type: :model do
  context '#valid?' do
    it 'returns false if any field is blank' do
      lab_test = LabTest.new

      result = lab_test.valid?

      expect(result).to be_falsey
      expect(lab_test.errors.all? { |error| error.raw_type == :blank }).to eq true
      expect(lab_test.errors).to include :name
      expect(lab_test.errors).to include :limits
    end
  end
end
