require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe 'methods' do
    context '#integer_to_cents' do
      it 'Convert integer amount to cent amount' do
        credit = create(:credit, amount: 1_000 )
        expect(credit.amount).to eq 1_00_000
      end
    end
  end
end
