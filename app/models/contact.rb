class Contact < ActiveRecord::Base
  belongs_to :contactable , polymorphic: true
  validates_presence_of :name, :email, :phone
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validate :phone_format

  def phone_format
    return unless phone
    errors.add(:phone, 'has wrong format') unless phone.gsub('-','') =~ /^[\+\d]\d*/
  end
end