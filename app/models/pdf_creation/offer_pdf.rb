module PdfCreation
  
  class OfferPdf
    
    def titles(offer)
      result = {}
      offer.offer_titles.each do |offer_title|
        frequency = offer_title.title.title_frequency.name
        if result[frequency]
          result[frequency].push(offer_title)
        else
          titles = [].push(offer_title)
          result[frequency] = titles
        end
      end
      result  
    end

  end

end