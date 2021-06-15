require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :feature do
  # User 1
  let(:name1) { 'Juan' }
  let(:email1) { 'user@example.com' }
  let(:password1) { 'admin123' }
  let!(:user1) { User.create(name: name1, email: email1, password: password1) }

  # User 2
  let(:name2) { 'Pedro' }
  let(:email2) { 'admin@microsoft.com' }
  let(:password2) { 'admin123' }
  let!(:user2) { User.create(name: name2, email: email2, password: password2) }

  context 'when user is not logged in' do
    before do
      visit new_userregistration_path
    end
    scenario 'user not logged-in' do
      fill_in 'session_email', with: :email
      fill_in 'session_password', with: :password
      click_button 'Sign Up'
    end
    it 'shows the right content for user show' do
      visit usershow_path
      expect(page).to have_content('Add Friend')
    end
    it 'updates Friendship button pending status' do
      visit usershow_path
      expect(page).to have_content('Pending')
    end
    it 'updates Friendship button delete status' do
      visit usershow_path
      expect(page).to have_content('Delete Friend')
    end
  end
end
