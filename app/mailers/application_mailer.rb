# rubocop:disable Style/FrozenStringLiteralComment

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

# rubocop:enable Style/FrozenStringLiteralComment
