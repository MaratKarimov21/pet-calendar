class ContactMailer < MailForm::Base
    attribute :name, validate: true
    attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
    attribute :message, validate: true
  
    def headers
      {
        subject: "My Contact Form",
        to: "Persidskii222@ya.ru",
        from: %("#{name}" <#{email}>)
      }
    end
  end