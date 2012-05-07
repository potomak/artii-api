require 'spec_helper'

describe FontsList do
  before do
    @artii = Object.new
    @artii.should_receive(:all_fonts).and_return({'font 1' => nil, 'font 2' => nil})
    Artii::Base.should_receive(:new).and_return(@artii)
  end

  it 'renders a list of fonts' do
    with_api(FontsList) do
      get_request(path: '/fonts_list') do |c|
        c.response.should == "font 1\nfont 2"
      end
    end
  end
end