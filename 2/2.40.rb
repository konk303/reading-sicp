class Array
  def flatmap
    map { |l| l.map { |ll| yield ll } }.flatten
  end
end

list = [(1..10).to_a, (11..20).to_a]
list.flatmap { |i| i + 1 }
