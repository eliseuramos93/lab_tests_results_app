class Examination < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_many :lab_test_results, dependent: :destroy

  validates :token, :date, presence: true
end
