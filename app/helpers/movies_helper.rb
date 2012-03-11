module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def header_class(col)
    col == @sort_by ? 'hilite' : ''
  end
  
  def link_header_to(text, field)
    field = field.to_s
    link_to text, movies_path({:sort=>field}), :id => field + '_header'
  end
end
