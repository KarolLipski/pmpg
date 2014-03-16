module TitlesHelper
  def title_archive?(title)
    title.archive ? 'Archive' : 'Actual'
  end
end
