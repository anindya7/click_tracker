class Link < ApplicationRecord
  belongs_to :user
  before_save :ensure_protocol
  def ensure_protocol
      self.url = "http://#{url}" unless url_protocol_present?
  end

  def url_protocol_present?
    u = URI.parse(url)
    u.scheme
  end
end
