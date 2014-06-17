require 'spec_helper'

describe PdfCreation::OfferPdf do 
  before(:each) do
    @freq = FactoryGirl.create(:title_frequency, name:'tygodnik')
    @freq2 = FactoryGirl.create(:title_frequency, name:'dziennik')
    @offer = FactoryGirl.create(:offer);
    @titles = FactoryGirl.create_list(:title,2, title_frequency: @freq)
    @titles2 = FactoryGirl.create_list(:title,2, title_frequency: @freq2)
    
    @offer_title = []
    @titles.concat(@titles2).each do |title|
      @offer_title.push(FactoryGirl.create(:offer_title,
        offer: @offer, title: title))
    end
    @pdf = PdfCreation::OfferPdf.new
  end
  it "data return grouped titles from offer" do
    result =  {"dziennik" => [@offer_title[2],@offer_title[3]] ,
               "tygodnik" => [@offer_title[0],@offer_title[1]]
              }
    @pdf.titles(@offer).should == result
  end
  
end