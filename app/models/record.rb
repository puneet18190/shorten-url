class Record < ApplicationRecord

  # Validations
  validates :url, presence: true
  validates :url, format: URI::regexp(%w[http https])

  before_create :set_shorten_url

  def set_shorten_url
    self.shorten_url = SecureRandom.alphanumeric(8)
  end
end
