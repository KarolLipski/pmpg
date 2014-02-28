# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  company_name     :string(255)
#  street           :string(255)
#  street_no        :integer
#  postal_code      :string(255)
#  city             :string(255)
#  nip              :string(255)
#  address_type     :string(255)
#  publisher_id     :integer
#  created_at       :datetime
#  updated_at       :datetime
#  addressable_id   :integer
#  addressable_type :string(255)
#

class Address < ActiveRecord::Base
  scope :invoice, -> { where(address_type: 'invoice') }
  scope :correspond, -> { where(address_type: 'correspond') }

  belongs_to :addressable, polymorphic: true
  validates_presence_of :company_name, :street, :street_no, :postal_code,
    :city, :address_type
  validates_presence_of :nip ,if: "address_type == 'invoice'"
  validates_format_of :postal_code, with: /\A\d{2}-\d{3}\z/
  validate :nip_format,if: "address_type == 'invoice'"

  def nip_format
    return unless nip
    errors.add(:nip, "has wrong format") unless nip.gsub('-','') =~ /\A\d{10}\z/
  end

end
