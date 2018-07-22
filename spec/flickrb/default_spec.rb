# frozen_string_literal: true

require 'spec_helper'

describe Flickrb::Default do
  describe '.options' do
    subject { described_class.options }
    it 'returns a hash with the same keys as Flickrb::Configuration' do
      expect(subject.keys).to eq(Flickrb::Configuration.attr_keys)
    end
  end
  describe '.client_key' do
    subject { described_class.api_key }
    after { ENV.delete('FLICKR_CLIENT_KEY') }

    it 'returns nil when ENV is not set' do
      is_expected.to be_nil
    end

    context 'set value' do
      before { ENV['FLICKR_CLIENT_KEY'] = 'test' }
      it 'returns the ENV value' do
        is_expected.to eq('test')
      end
    end
  end

  describe '.client_secret' do
    subject { described_class.api_secret }
    after { ENV.delete('FLICKR_CLIENT_SECRET') }

    it 'returns nil when ENV is not set' do
      is_expected.to be_nil
    end

    context 'set value' do
      before { ENV['FLICKR_CLIENT_SECRET'] = 'test' }
      it 'returns the ENV value' do
        is_expected.to eq('test')
      end
    end
  end

  describe '.api_version' do
    subject { described_class.api_version }
    it 'returns ::API_VERSION' do
      is_expected.to eq(Flickrb::Default::API_VERSION)
    end
  end
end
