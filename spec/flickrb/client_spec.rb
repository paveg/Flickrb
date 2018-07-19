# frozen_string_literal: true

require 'spec_helper'

describe Flickrb::Client do
  describe '#initialize' do
    subject { described_class.new(options) }

    before do
      ENV.each_key { |env_key| ENV.delete(env_key) if env_key.start_with?('FLICKR') }
    end

    context 'has no argument' do
      let(:options) { {} }
      it do
        is_expected.to be_instance_of(described_class)
        expect(subject.access_token).to be_nil
      end
    end
    context 'has arguments' do
      let(:options) do
        {
          access_token: 'test_access_token', refresh_token: 'test_refresh_token'
        }
      end
      let(:expected_access_token) { 'test_access_token' }
      let(:expected_refresh_token) { 'test_refresh_token' }

      it do
        is_expected.to be_instance_of(described_class)
        expect(subject.access_token).to eq(expected_access_token)
        # And does not define getter
        expect { subject.refresh_token }.to raise_error(NoMethodError)
      end
    end
  end
end
