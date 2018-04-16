class LoginPage < SitePrism::Page
  set_url '/login'

  element :email, :xpath, "//input[contains(@name, 'email')]"
  element :password, :xpath, "//input[contains(@name, 'password')]"
  element :submit, :xpath, "//input[contains(@type, 'submit')]"

  element :error_msg, :xpath, "//form/*[contains(text(), 'Ihre Eingabe')]"
end
