# Config for Non-production Environments
unless Rails.env.production?
  Paperclip::Attachment.default_options[:validate_media_type] = false

  Paperclip::Attachment.default_options.merge!({

  })

  Paperclip::Attachment.default_options.update({
    hash_secret: "secretkittens" # Hopefully this lets us verify the hash externally by using the same "secret"
  })

  Paperclip.options[:content_type_mappings] = {
    json: ["/\Atext\/.*\Z/", "application/json"]
  }
end
