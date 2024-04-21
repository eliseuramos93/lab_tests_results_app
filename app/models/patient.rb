class Patient < ApplicationRecord
  has_many :examinations, dependent: :destroy

  validates :cpf, :full_name, :email, :birth_date, :address, :city, :state, presence: true
end
