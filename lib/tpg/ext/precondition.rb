module HQMF
  class Precondition
    def generate_patients(base_patients)
      
    end
    
    def generate_to_pass(base_patients)
      if conjunction?
        conjunction_module = "Conjunction::#{self.conjunction_code.classify}"
        conjunction_module = conjunction_module.split('::').inject(Kernel) {|scope, name| scope.const_get(name)}

        extend conjunction_module
        base_patients.concat(generate_to_pass(base_patients))
      elsif reference
        binding.pry
      else
        binding.pry
        base_patients
      end
    end
    
    def generate_to_fail(base_patients)
      
    end
  end
end