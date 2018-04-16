require 'rails_helper'

feature 'Login', type: :feature, js: true do
  let!(:customer) { Customer.create(email: 'correct@email.com', password: 'V3ryStr0ng') }

  before { visit '/login' }

  context 'failure' do
    scenario 'when a user enters incorrect email' do
      fill_in 'email', with: 'incorrect@email.com'
      fill_in 'password', with: customer.password
      click_on t('login.form.fields.submit')
      expect(page).to have_content t('login.form.errors.fields_incorrect')
    end

    scenario 'when a user enters incorrect password' do
      fill_in 'email', with: customer.email
      fill_in 'password', with: 'Pa$$w0rd!'
      click_on t('login.form.fields.submit')
      expect(page).to have_content t('login.form.errors.fields_incorrect')
    end
  end

  context 'success' do
    scenario 'when a user enters correct password and email' do
      fill_in 'email', with: customer.email
      fill_in 'password', with: customer.password
      click_on t('login.form.fields.submit')
      expect(page).to have_content t('menu.home')
    end
  end
end
