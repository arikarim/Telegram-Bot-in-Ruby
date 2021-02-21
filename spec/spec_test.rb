require_relative '../lib/quotes'

describe Quotes do
  describe '#random_quote' do
    let(:quotes) { Quotes.new }
    let(:random_quote) { quotes.random_quote }

    it 'should return a hash object' do
      expect(random_quote.class).to eql(Hash)
    end
  end

  describe '#make_request' do
    let(:request) { Quotes.new }
    let(:json) { request.make_request }

    it 'should return a JSON object' do
      expect(json.class).to eql(Array)
    end

    it 'returns a non-empty JSON object' do
      expect(json.length).not_to eql(0)
    end
  end
end
