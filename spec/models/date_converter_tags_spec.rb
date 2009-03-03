require File.dirname(__FILE__) + '/../spec_helper'

describe DateConverterTags do
  
  before do
    @page = Page.create!(
      :title => 'New Page',
      :slug => 'page',
      :breadcrumb => 'New Page',
      :status_id => '100'
    )
  end
  
  it "should convert date" do
    @page.should render(
      "<r:date_converter from='%Y%m%d' to='%B %d, %Y'>20081010</r:date_converter>"
    ).as('October 10, 2008')
  end
  
  it "should not convert not matched date" do
    @page.should render(
      "<r:date_converter from='%Y%m%d' to='%B %d, %Y'>12547592020081010</r:date_converter>"
    ).as('')
  end
  
end