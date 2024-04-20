class LabTestResult < ApplicationRecord
  belongs_to :examination
  belongs_to :lab_test

  validates :result, presence: true
end
