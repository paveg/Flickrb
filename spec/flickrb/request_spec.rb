# frozen_string_literal: true

require 'spec_helper'
describe Flickrb::Request do
  include Flickrb::Request
  let(:client) { Flickrb::Client.new }
  let(:expected_url) { URI.parse('https://www.flickr.com/services/test') }

  describe '#get' do
    subject { client.get('test') }
    it do
      expect(subject.method).to eq(:get)
      expect(subject.url).to eq(expected_url)
    end
  end
  describe '#post' do
    subject { client.post('test') }
    it do
      expect(subject.method).to eq(:post)
      expect(subject.url).to eq(expected_url)
    end
  end
  describe '#put' do
    subject { client.put('test') }
    it do
      expect(subject.method).to eq(:put)
      expect(subject.url).to eq(expected_url)
    end
  end
  describe '#delete' do
    subject { client.delete('test') }
    it do
      expect(subject.method).to eq(:delete)
      expect(subject.url).to eq(expected_url)
    end
  end
end
