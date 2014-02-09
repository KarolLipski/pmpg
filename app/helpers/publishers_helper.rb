module PublishersHelper
  def publisher_contact_emails(publisher)
    emails = publisher.contacts.map do |contact|
      contact.email
    end
    raw(emails.join('<br />'))
  end

  def publisher_contact_phones(publisher)
    phones = publisher.contacts.map do |contact|
      contact.phone
    end
    raw(phones.join('<br />'))
  end
end
