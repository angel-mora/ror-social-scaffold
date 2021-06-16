require 'rails_helper'
require 'spec_helper'
require 'shoulda-matchers'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Juan', email: 'user@example.com', password: 'admin123') }
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of({ maximum: 20 }) }
    it { should have_many(:friendships) }
    it { should have_many(:inverse_friendships) }
  end
end
