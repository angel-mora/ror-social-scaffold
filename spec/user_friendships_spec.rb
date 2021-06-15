require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :feature do
  # User 1
  let(:user1) { User.create(name: 'Juan', email: 'user@example.com', password: 'admin123') }

  # User 2
  let(:user2) { User.create(name: 'Pedro', email: 'admin@microsoft.com', password: 'admin123') }
  describe 'friendship' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user1.email
      fill_in 'user[password]', with: user1.password
      click_button 'Log in'
    end
    it 'shows the right content for user show' do
      visit users_path
      expect(page).to have_content('Add Friend')
    end
    it 'updates Friendship button pending status' do
      visit users_path
      # click in 'Add Friend'
      expect(page).to have_content('Pending')
    end
    it 'updates Friendship button delete status' do
      visit users_path
      # Accept invitation
      expect(page).to have_content('Delete Friend')
    end
  end
end
