class PrimeFactor
  
  def initialize given_number
    @primes = [2]
    @prime_factors = []
    @factored_number = given_number
  end
  
  def next_prime(current_number)
    loop do
      current_number+=1
      break if is_prime?(current_number)
    end
    current_number
  end
  
  def is_prime?(number)
    for d in 2..(number - 1)
      if (number % d) == 0
        return false
      end
    end
    true
  end

  def find_prime_factor
    current_prime = @primes.pop
    while @factored_number % current_prime != 0 do
      current_prime = next_prime(current_prime)
    end
    @factored_number /= current_prime
    @prime_factors.push(current_prime)
    @primes.push(current_prime)
    current_prime
  end
  
  def find_prime_factors
    while @factored_number > 1 do
      find_prime_factor
    end
    @prime_factors
  end
  
  def max_prime_factor
    find_prime_factors
    @prime_factors.max
  end
  
end

# solution works decently with small numbers but turns useless quick enough to consider it as a NO-GO
# t = Time.now
# puts PrimeFactor::new(10198983).max_prime_factor.to_s + " (found in #{Time.now - t} seconds)"


def largest_prime_factor(num)
  factor = 2
  largest = 0
  while factor <= num
    if num % factor == 0
      while num % factor == 0
        largest = factor
        num /= factor
        factor += 1
      end
    end
    factor += 1
  end
  largest
end

t = Time.now
puts largest_prime_factor(1876191413).to_s + " (found in #{Time.now - t} seconds)"