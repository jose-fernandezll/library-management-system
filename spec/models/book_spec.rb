require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    subject { build(:book) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:autor) }
    it { should validate_presence_of(:publication_year) }
    it { should validate_presence_of(:isbn) }

    it { should validate_uniqueness_of(:isbn).case_insensitive }
    it { is_expected.to be_valid }
  end
end
