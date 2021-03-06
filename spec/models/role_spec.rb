require "rails_helper"

RSpec.describe Role, type: :model do
  subject(:role) { create(:role) }

  it { is_expected.to have_many(:users) }

  it { is_expected.to validate_presence_of :role_name }
end
