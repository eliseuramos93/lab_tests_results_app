require 'rails_helper'

RSpec.describe Patient, type: :model do
  context '#valid?' do
    it 'returns false if any field is blank' do
      patient = Patient.new

      result = patient.valid?

      expect(result).to be_falsey
      expect(patient.errors.all? { |error| error.raw_type == :blank }).to eq true
      expect(patient.errors).to include :cpf
      expect(patient.errors).to include :full_name
      expect(patient.errors).to include :email
      expect(patient.errors).to include :birth_date
      expect(patient.errors).to include :address
      expect(patient.errors).to include :city
      expect(patient.errors).to include :state
    end
  end
end
