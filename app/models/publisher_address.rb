class PublisherAddress < ActiveRecord::Base
  belongs_to :publisher
  validates_presence_of :company_name, :street, :street_no, :postal_code,
    :city, :nip, :type, :publisher_id
  validates_format_of :postal_code, with: /\d{2}-\d{3}/
  validate :nip_format

  def nip_format
    return unless nip
    errors.add(:nip, "has wrong format") unless nip.gsub('-','') =~ /\d{10}/
  end

end
