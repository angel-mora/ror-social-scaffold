require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  let(:name) { 'Juan' }
  let(:email) { 'user@example.com' }
  let(:password) { 'admin123' }
  let!(:user) { User.create(name: name, email: email, password: password) }
    
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of({ maximum: 20 }) }
  it { should have_many(:friendships) }
  it { should have_many(:inverse_friendships) }

end
