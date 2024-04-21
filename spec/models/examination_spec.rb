require 'rails_helper'

RSpec.describe Examination, type: :model do
  context '#valid?' do
    it 'returns false if any field is blank' do
      examination = Examination.new

      result = examination.valid?

      expect(result).to be_falsey
      expect(examination.errors.all? { |error| error.raw_type == :blank }).to eq true
      expect(examination.errors).to include :token
      expect(examination.errors).to include :date
      expect(examination.errors).to include :patient
      expect(examination.errors).to include :doctor
    end
  end
end
