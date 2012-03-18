module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def header_class(col)
    col.to_s == @sort_by ? { :class => 'hilite'} : {}
  end
  
  def link_header_to(text, field)
    field = field.to_s
    link_to text, movies_path({:sort=>field}), :id => field + '_header'
  end
  def rating_check_box_tag(rating)
    check_box_tag("ratings[#{rating}]", 1, @selected_ratings.include?(rating), :id => 'ratings_' + rating)
  end
  def show_release_date
    @movie.release_date ? @movie.release_date.strftime("%B %d, %Y") : "No Release Date"
  end
end
