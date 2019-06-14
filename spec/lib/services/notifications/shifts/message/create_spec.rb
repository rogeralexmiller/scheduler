# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::Notifications::Shifts::Message::Create do

  let(:object) { described_class.call(shift, event_data) }
  let(:event_data) { {} }
  let(:shift) { create(:shift, start_at: starts, duration: 120) }
  let(:need) { shift.need }
  let(:starts) { Time.zone.parse('2019-05-23 11:15:00 -07:00') }
  let(:create_message) do
    "A new shift from 11:15am to 01:15pm Thu, May 23 has been added to a need "\
      "at your local office! http://localhost:3000/needs/#{need.id}"
  end

  describe '#call' do
    it 'returns expected string' do
      expect(object).to eql(create_message)
    end
  end

end
