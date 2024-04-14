require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe 'validations' do
    subject { build(:loan) }

    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }

    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
end
