require 'rails_helper'
require_relative Rails.root.join('app/services/import_csv_data.rb')

RSpec.describe ImportCSVData do
  context '#run' do
    it "inserts the file's content in database successfully" do
      file_path = Rails.root.join('spec/assets/test_data.csv')
      file = File.open(file_path)

      ImportCSVData.run(file:)

      expect(Patient.count).to eq 5
      expect(Doctor.count).to eq 3
      expect(Examination.count).to eq 5
      expect(LabTest.count).to eq 5
      expect(LabTestResult.count).to eq 5
      expect(Patient.first.full_name).to eq 'Emilly Batista Neto'
      expect(Patient.second.full_name).to eq 'Matheus Barroso'
      expect(Patient.third.full_name).to eq 'Patricia Gentil'
      expect(Patient.fourth.full_name).to eq 'Ígor Moura'
      expect(Patient.fifth.full_name).to eq 'Dra. Vitória Soares'
      expect(Doctor.first.crm).to eq 'B000BJ20J4'
      expect(Doctor.second.crm).to eq 'B000B7CDX4'
      expect(Doctor.third.crm).to eq 'B0002W2RBG'
      expect(Examination.first.token).to eq 'IQCZ17'
      expect(Examination.second.token).to eq 'T9O6AI'
      expect(Examination.third.token).to eq 'TJUXC2'
      expect(Examination.fourth.token).to eq '2VPICQ'
      expect(Examination.fifth.token).to eq '85OIFQ'
      expect(LabTest.first.name).to eq 'hemácias'
      expect(LabTest.second.name).to eq 'leucócitos'
      expect(LabTest.third.name).to eq 'plaquetas'
      expect(LabTest.fourth.name).to eq 'hdl'
      expect(LabTest.fifth.name).to eq 'ldl'
      expect(LabTestResult.first.result).to eq '97'
      expect(LabTestResult.second.result).to eq '75'
      expect(LabTestResult.third.result).to eq '26'
      expect(LabTestResult.fourth.result).to eq '50'
      expect(LabTestResult.fifth.result).to eq '41'
    end

    it 'raises an error if the provided file is not a CSV file' do
      file_path = Rails.root.join('spec/assets/starwars_v_script.txt')
      file = File.open(file_path)

      expect { ImportCSVData.run(file:) }.to raise_error Exceptions::InvalidFileTypeError
    end
  end
end
