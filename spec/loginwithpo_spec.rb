require 'rails_helper'

feature 'Login', type: :feature, js: true do
  let!(:customer) { Customer.create(email: 'correct@email.com', password: 'V3ryStr0ng') }
  let(:login_page) { LoginPage.new }

  before { login_page.load }

  context 'failure' do
    scenario 'when a user enters incorrect email' do
      login_page.email.set('incorrect@email.com')
      login_page.password.set(customer.password)
      login_page.submit_btn.click
      expect(login_page.error_msg).to be_displayed
    end

    scenario 'when a user enters incorrect password' do
      login_page.email.set(customer.email)
      login_page.password.set('Pa$$w0rd!')
      login_page.submit_btn.click
      expect(login_page.error_msg).to be_displayed
    end
  end

  context 'success' do
    scenario 'when a user enters correct password and email' do
      login_page.email.set(customer.email)
      login_page.password.set(customer.password)
      login_page.submit_btn.click
      expect(login_page.error_msg).not_to be_displayed
      expect(login_page.home_header).to be_displayed

      # OR

      expect(login_page).to have_home_header
    end
  end
end
