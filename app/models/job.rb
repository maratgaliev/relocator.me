class Job < ApplicationRecord
  validates :title, :description, :salary, presence: true

  extend Enumerize

  enumerize :job_type, in: [:contract, :freelance, :full, :part]
  enumerize :currency, in: [:usd, :eur, :rub]
end
