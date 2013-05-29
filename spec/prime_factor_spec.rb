require 'prime_factor'

describe PrimeFactor do
  before do
    @prime = PrimeFactor.new 13195
  end
  
  describe '@primes' do
    it ' initial value equals to "2"' do
      @prime.instance_variable_get(:@primes).should == [2]
    end
  end  
  
  describe '#is_prime?(7)' do
    it 'returns "true"' do
      @prime.is_prime?(7).should == true
    end
  end
  
  describe '#is_prime?(8)' do
    it 'returns "false"' do
      @prime.is_prime?(8).should == false
    end
  end
  
  describe '#next_prime' do
    it 'returns next prime number to given number' do
      @prime.next_prime(8).should == 11
    end
  end
  
  describe '#find_prime_factor' do
    it 'should return 5' do
      @prime.find_prime_factor.should == 5
    end
  end
  
  describe '#find_prime_factors' do
    it 'should return array of 5,7,13 and 29' do
      @prime.find_prime_factors.should == [5,7,13,29]
    end
    
    it 'should return array of 2,2,2,2,3,3 and 5' do
      @prime.instance_variable_set(:@factored_number, 720)
      @prime.find_prime_factors.should == [2,2,2,2,3,3,5]
    end
  end

  describe '#max_prime_factor' do
    it 'should return 29' do
      @prime.max_prime_factor.should == 29
    end
  end
  
end