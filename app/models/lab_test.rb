class LabTest < ApplicationRecord
  has_many :lab_test_results, dependent: :destroy

  validates :name, :limits, presence: true
end
