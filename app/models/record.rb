class Record < ApplicationRecord

  # Validations
  validates :url, presence: true
  validates :url, format: URI::regexp(%w[http https])

  # before_create :set_shorten_url

  # def set_shorten_url
  #   self.shorten_url = SecureRandom.alphanumeric(8)
  # end

  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

  def encoder(i)
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i = i/base
    end
    s.reverse
  end

  def self.decoder(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end

  def get_shorten_link
    "/s/#{encoder(id)}"
  end
end
