class LRUCache
  # most recently used will be the back of the array
  # least recently used will be the front of the array
   def initialize(size)
     @size = size
     @cache = []
   end

   def count
     @cache.count
   end

   def add(el)
     # adds element to cache according to LRU principle
     @cache.delete(el) if @cache.include?(el)
     @cache.shift if full?
     @cache << el
   end

   def show
     p @cache
   end

   private
   def full?
     @cache.count == @size
   end

 end

 johnny_cache = LRUCache.new(4)

 johnny_cache.add("I walk the line")
 johnny_cache.add(5)

 johnny_cache.count # => returns 2

 johnny_cache.add([1,2,3])
 johnny_cache.add(5)
 johnny_cache.add(-5)
 johnny_cache.add({a: 1, b: 2, c: 3})
 johnny_cache.add([1,2,3,4])
 johnny_cache.add("I walk the line")
 johnny_cache.add(:ring_of_fire)
 johnny_cache.add("I walk the line")
 johnny_cache.add({a: 1, b: 2, c: 3})


 johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
