# frozen_string_literal: true

require 'spec_helper'

describe Flickrb::Configuration do
  include Flickrb::Configuration
  let(:client) { Flickrb::Client.new }

  describe '.attr_keys' do
    subject { described_class.attr_keys }
    it { is_expected.to eq(%i[api_key api_secret]) }
  end
end
