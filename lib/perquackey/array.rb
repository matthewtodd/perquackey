class Array
  def delete_first(item)
    index(item) and delete_at(index(item))
  end
end
