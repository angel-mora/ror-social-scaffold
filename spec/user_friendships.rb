require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :feature do
  # User 1
  let(:name_1) { 'Juan' }
  let(:email_1) { 'user@example.com' }
  let(:password_1) { 'admin123' }
  let!(:user_1) { User.create(name: name_1, email: email_1, password: password_1) }
  
  # User 2
  let(:name_2) { 'Pedro' }
  let(:email_2) { 'admin@microsoft.com' }
  let(:password_2) { 'admin123' }
  let!(:user_2) { User.create(name: name_2, email: email_2, password: password_2) }
  
  context 'when user is not logged in' do
    before do
      visit new_user_registration_path
    end
    scenario 'user not logged-in' do
      fill_in 'session_email', with: :email
      fill_in 'session_password', with: :password
      click_button 'Sign Up'
    end
    it 'shows the right content for user show' do
      visit user_show_path
      expect(page).to have_content('Add Friend')
    end
    it 'updates Friendship button pending status' do
      visit user_show_path
      expect(page).to have_content('Pending')
    end
    it 'updates Friendship button delete status' do
      visit user_show_path
      expect(page).to have_content('Delete Friend')
    end
  end
end
  
