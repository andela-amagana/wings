require "rails_helper"

RSpec.describe Airport, type: :model do
  subject(:airport) { create :airport }

  it { is_expected.to have_many(:departing_flights) }
  it { is_expected.to have_many(:arriving_flights) }
end
