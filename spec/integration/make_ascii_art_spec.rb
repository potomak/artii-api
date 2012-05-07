require 'spec_helper'

describe MakeAsciiArt do
  before do
    @text = 'ascii+art'
    @font = 'my_font'
    @expected = 'ASCII ART'
    @artii = Object.new
  end

  context 'without text' do
    before do
      Artii::Base.should_receive(:new).with({}).and_return(@artii)
      @artii.should_receive(:asciify).with('')
    end

    it 'renders an empty string' do
      with_api(MakeAsciiArt) do
        get_request(path: '/make') do |c|
          c.response.should == ''
        end
      end
    end
  end

  context 'with text' do
    before do
      Artii::Base.should_receive(:new).with({}).and_return(@artii)
      @artii.should_receive(:asciify).with(@text).and_return(@expected)
    end

    it 'renders ascii art' do
      with_api(MakeAsciiArt) do
        get_request(path: '/make', query: {text: @text}) do |c|
          c.response.should == @expected
        end
      end
    end
  end

  context 'with text and font' do
    before do
      Artii::Base.should_receive(:new).with({font: @font}).and_return(@artii)
      @artii.should_receive(:asciify).with(@text).and_return(@expected)
    end

    it 'renders ascii art' do
      with_api(MakeAsciiArt) do
        get_request(path: '/make', query: {text: @text, font: @font}) do |c|
          c.response.should == @expected
        end
      end
    end
  end
end