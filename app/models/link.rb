class Link < ApplicationRecord
	validates_presence_of :original_url
	validates :original_url, format: URI::regexp(%w[http https])
	validates_uniqueness_of :slug
	validates_length_of :original_url, within: 1..255, on: :create, message: "too long"
	validates_length_of :slug, within: 1..255, on: :create, message: "too long"


	def self.create_shorten_url(original_url)
		slug = SecureRandom.hex(2)
		url = create(original_url: original_url, slug: slug)
	end
end
