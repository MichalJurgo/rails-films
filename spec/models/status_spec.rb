# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Status, type: :model do
  context "validation tests" do
    let(:status) { build(:status) }

    it "ensures name presence" do
      status.name = nil
      expect(status.save).to eq(false)
    end
  end
end
