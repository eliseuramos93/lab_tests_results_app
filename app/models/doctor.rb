class Doctor < ApplicationRecord
  has_many :examinations, dependent: :destroy

  validates :crm, :crm_state, :full_name, :email, presence: true
end
