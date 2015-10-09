module ApplicationHelper

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '')                     # Method def, optional arg

    if page_title.empty?                              # Boolean test
      t :title                                       # Implicit return
    else
      page_title + " | " + t(:title)                  # String concatenation
    end
  end
end

