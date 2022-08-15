require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe 'associations' do
    it { should belong_to(:bank_account) }
  end

  describe 'credit_type' do
    it { should define_enum_for(:credit_type).with_values(deposit: 5) }
  end

  describe 'validations' do
    context 'presence' do
      it { should validate_presence_of(:amount) }
    end

    context 'numericality' do
      it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(2) }
    end
  end
end
