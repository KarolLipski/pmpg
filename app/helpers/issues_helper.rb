module IssuesHelper
  def issue_archive?(issue)
    issue.archive ? 'Archive' : 'Actual'
  end
end
