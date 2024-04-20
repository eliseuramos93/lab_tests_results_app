require 'rails_helper'

RSpec.describe Doctor, type: :model do
  context '#valid?' do
    it 'returns false if any field is blank' do
      doctor = Doctor.new

      result = doctor.valid?

      expect(result).to be_falsey
      expect(doctor.errors.all? { |error| error.raw_type == :blank }).to eq true
      expect(doctor.errors).to include :crm
      expect(doctor.errors).to include :crm_state
      expect(doctor.errors).to include :full_name
      expect(doctor.errors).to include :email
    end
  end
end
