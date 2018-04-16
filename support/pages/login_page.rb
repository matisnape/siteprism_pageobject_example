class LoginPage < SitePrism::Page
  set_url '/login'

  element :email, :xpath, "//input[@name='email']"
  element :password, :xpath, "//input[@name='password']"
  element :submit_btn, :xpath, "//input[@type='submit']"

  # errors

  element :error_msg, :xpath, "//form/*[contains(text(), 'Ihre Eingaben')]"

  # navigation

  element :revenue_link, :xpath, '//div[@id="navigation"]/a[2]/div/span'
  element :home_header, :xpath, "//*[contains(text(), '#{I18n.t('menu.home')}')]"

  def login(user)
    load
    email.set(user.email)
    email.set(user.password)
    submit_btn.click
  end
end
