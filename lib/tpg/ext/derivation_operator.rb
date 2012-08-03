module HQMF
  class DerivationOperator
    # Perform an intersection between two sets of Ranges (assuming these are timestamps).
    #
    # @param [Array] set1 One array of Ranges to be intersected.
    # @param [Array] set2 The other array of Ranges to be intersected.
    # @return A new array that contains the shared Ranges between set1 and set2.
    def self.intersection(set1, set2)
      # Special cases to account for emptiness
      return [] if set1.empty? && set2.empty?
      return set1 if set2.empty?
      return set2 if set1.empty?

      # Merge each element of the two sets together
      result = []
      set1.each do |range1|
        set2.each do |range2|
          intersect = Range.intersection(range1)
          result << intersect unless intersect.nil?
        end
      end
      
      result
    end
    
    # 
    #
    # @param [Array] set1
    # @param [Array] set2
    # @return 
    def self.union(set1, set2)
      # Special cases to account for emptiness
      return [] if set1.empty? && set2.empty?
      return set1 if set2.empty?
      return set2 if set1.empty?
      
      
    end
  end
end