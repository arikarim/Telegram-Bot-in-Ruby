require_relative '../lib/quotes'
require_relative '../lib/bot'
describe Quotes do
  describe '#random_quote' do
    let(:quotes) { Quotes.new }
    let(:random_quote) { quotes.random_quote }

    it 'should return a hash object' do
      expect(random_quote.class).to eql(Hash)
    end

    it 'should return a hash object' do
      expect(random_quote.class).not_to eql(Array)
    end
  end

  describe '#make_request' do
    let(:request) { Quotes.new }
    let(:json) { request.make_request }

    it 'should return a JSON object' do
      expect(json.class).to eql(Array)
    end

    it 'should not return a JSON hash' do
      expect(json.class).not_to eql(Hash)
    end

    it 'returns a non-empty JSON object' do
      expect(json.length).not_to eql(0)
    end

    it 'returns a false' do
      expect(json.length == 1).to eql(false)
    end
  end
end
