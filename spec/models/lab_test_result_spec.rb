require 'rails_helper'

RSpec.describe LabTestResult, type: :model do
  context '#valid?' do
    it 'returns false if any field is blank' do
      lab_test_result = LabTestResult.new

      result = lab_test_result.valid?

      expect(result).to be_falsey
      expect(lab_test_result.errors.all? { |error| error.raw_type == :blank }).to eq true
      expect(lab_test_result.errors).to include :examination
      expect(lab_test_result.errors).to include :lab_test
      expect(lab_test_result.errors).to include :result
    end
  end
end
