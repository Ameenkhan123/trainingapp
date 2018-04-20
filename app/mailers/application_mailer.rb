class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

# encoded_content = SpecialEncode(File.read('/assets/images/admin-icon.png'))
# attachments['admin-icon.png'] = {
#   mime_type: 'application/gzip',
#   encoding: 'SpecialEncoding',
#   content: encoded_content
# }
end
