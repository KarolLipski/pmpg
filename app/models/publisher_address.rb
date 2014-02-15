class PublisherAddress < ActiveRecord::Base
  scope :invoice, -> {where(address_type: 'invoice')}
  scope :correspond, -> {where(address_type: 'correspond')}

  belongs_to :publisher
  validates_presence_of :company_name, :street, :street_no, :postal_code,
    :city, :address_type, :publisher
  validates_presence_of :nip ,if: "address_type == 'invoice'"
  validates_format_of :postal_code, with: /\A\d{2}-\d{3}\z/
  validate :nip_format,if: "address_type == 'invoice'"

  def nip_format
    return unless nip
    errors.add(:nip, "has wrong format") unless nip.gsub('-','') =~ /\A\d{10}\z/
  end

end
