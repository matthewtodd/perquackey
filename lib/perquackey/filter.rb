class Filter
  include Enumerable
  
  def initialize(delegate, method)
    @delegate = delegate
    @method = method
  end
  
  def each
    @delegate.each { |item| yield item.send(@method) }
  end
  
  def method_missing(symbol, *args, &block)
    @delegate.send(symbol, *args, &block)
  end
end
