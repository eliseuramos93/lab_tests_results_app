require 'csv'

module ImportCSVData
  def self.run(file:)
    raise Exceptions::InvalidFileTypeError unless File.fnmatch?('*.csv', file.path)

    csv = CSV.open(file, col_sep: ';', headers: true)
    csv.each { |row| import_row_from_csv(row:) }
  end

  private_class_method def self.import_row_from_csv(row:)
    patient = import_patient_from_csv(row:)
    doctor = import_doctor_from_csv(row:)
    examination = import_examination_from_csv(row:, patient:, doctor:)
    lab_test =  import_lab_test_from_csv(row:)
    import_lab_test_result_from_csv(row:, examination:, lab_test:)
  end

  private_class_method def self.import_patient_from_csv(row:)
    cpf, full_name, email, birth_date, address, city, state = row[0..6]
    Patient.find_or_create_by!(cpf:, full_name:, email:, birth_date:, address:, city:, state:)
  end

  private_class_method def self.import_doctor_from_csv(row:)
    crm, crm_state, full_name, email = row[7..10]
    Doctor.find_or_create_by!(crm:, crm_state:, full_name:, email:)
  end

  private_class_method def self.import_examination_from_csv(row:, patient:, doctor:)
    token, date = row[11..12]
    Examination.find_or_create_by!(token:, date:, patient:, doctor:)
  end

  private_class_method def self.import_lab_test_from_csv(row:)
    name, limits = row[13..14]
    LabTest.find_or_create_by!(name:, limits:)
  end

  private_class_method def self.import_lab_test_result_from_csv(row:, examination:, lab_test:)
    result = row[15]
    LabTestResult.create!(examination:, lab_test:, result:)
  end
end
