# frozen_string_literal: true

require 'spec_helper'

describe Flickrb do
  describe '#client' do
    let(:client) { Flickrb.client }
    it 'returns correctly' do
      expect(client).to be_an_instance_of(Flickrb::Client)
      expect(client.access_token).to be_nil
    end
  end

  describe '#respond_to_missing?' do
    subject { described_class.respond_to_missing?(method) }
    context 'when call defined method' do
      let(:method) { :get }
      it { is_expected.to be_truthy }
    end

    context 'when call undefined method' do
      let(:method) { :undefined_get }
      it { is_expected.to be_falsey }
    end
  end

  describe Hash do
    describe '#deep_symbolized_keys' do
      subject { hash.deep_symbolize_keys }
      let(:hash) do
        {
          key: [{ moge: 10 }],
          hoge: [{ hoge: [42] }],
          moge: [10, 20, { hoge: 30 }]
        }
      end
      let(:convert_hash) do
        {
          key: [{ moge: 10 }],
          hoge: [{ hoge: [42] }],
          moge: [10, 20, { hoge: 30 }]
        }
      end

      it 'returns correctly hash' do
        is_expected.to eq(convert_hash)
      end
    end
  end
end
