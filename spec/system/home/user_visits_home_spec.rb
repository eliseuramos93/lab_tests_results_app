require 'rails_helper'
require_relative '../../../app/services/import_csv_data'

RSpec.describe 'User visits homepage' do
  context "when the app's database is populated" do
    it 'and sees the examinations results paginated successfully' do
      test_data_path = Rails.root.join('spec/assets/test_data.csv')
      test_data_file = File.open(test_data_path)
      ImportCSVData.run(file: test_data_file)

      visit root_path

      expect(page).to have_content 'Resultado dos Exames'
      within '#exams-table-pagination' do
        expect(page).to have_link '1', href: '/?page=1'
        expect(page).to have_link '2', href: '/?page=2'
      end

      within 'thead' do
        expect(page).to have_content 'Token'
        expect(page).to have_content 'Data do Exame'
        expect(page).to have_content 'Nome do Paciente'
        expect(page).to have_content 'CRM'
        expect(page).to have_content 'Estado CRM'
        expect(page).to have_content 'Nome do Médico'
      end
      within 'tbody' do
        expect(page).to have_content 'IQCZ17'
        expect(page).to have_content '05/08/2021'
        expect(page).to have_content 'Emilly Batista Neto'
        expect(page).to have_content 'B000BJ20J4'
        expect(page).to have_content 'PI'
        expect(page).to have_content 'Maria Luiza Pires'
        expect(page).to have_content 'Matheus Barroso'
        expect(page).to have_content 'Patricia Gentil'
        expect(page).to have_content 'Ígor Moura'
        expect(page).to have_content 'Dra. Vitória Soares'
      end
    end

    it 'and is able to change the page of the examinations results' do
      test_data_path = Rails.root.join('spec/assets/test_data.csv')
      test_data_file = File.open(test_data_path)
      ImportCSVData.run(file: test_data_file)

      visit root_path
      within '#exams-table-pagination' do
        click_on '2'
      end

      first_page_tokens = Examination.all.map(&:token)[0...30]
      second_page_tokens = Examination.all.map(&:token)[30..]
      within 'tbody' do
        first_page_tokens.each do |token|
          expect(page).not_to have_content token
        end

        second_page_tokens.each do |token|
          expect(page).to have_content token
        end
      end
    end
  end

  context 'without data in the database' do
    it 'alerts the user that no data is available' do
      visit root_path

      expect(Patient.any?).to be_falsey         # ensure there is no data in database
      expect(Doctor.any?).to be_falsey          # ensure there is no data in database
      expect(Examination.any?).to be_falsey     # ensure there is no data in database
      expect(LabTest.any?).to be_falsey         # ensure there is no data in database
      expect(LabTestResult.any?).to be_falsey   # ensure there is no data in database
      expect(page).to have_content 'Nenhum dado disponível no momento'
    end
  end
end
