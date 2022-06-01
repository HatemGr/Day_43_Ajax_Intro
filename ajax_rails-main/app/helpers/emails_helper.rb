module EmailsHelper
  def email_class(email)
    email.read ? 'link-dark text-decoration-none fw-light' : 'link-dark text-decoration-none table-dark fw-bold'
  end
end
