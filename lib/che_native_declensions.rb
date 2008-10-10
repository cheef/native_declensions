module Che  
  module NativeDeclensions

    def self.included(base)
      base.extend InitMethods
    end

    module InitMethods        
      def native_declensions(options = {})
        options.assert_valid_keys(:singular, :plural, :gender)
        instance_variable_set(:@declensions, options.stringify_all_keys! || "")
        
        extend Che::NativeDeclensions::ClassMethods
        include Che::NativeDeclensions::InstanceMethods
        include Che::NativeDeclensions::SingletonMethods
      end      
    end
    
    module ClassMethods
      
      def declension(kase = nil, singular = true)
        return instance_variable_get(:@declensions)["singular"]["i"] if kase.blank?
        instance_variable_get(:@declensions)[singular ? "singular" : "plural"][kase.to_s]
      end
      
      def by_gender(masculan, feminine, neuter)
        case instance_variable_get(:@declensions)["gender"]
          when "masculan"
            masculan
          when "feminine"
            feminine
          when "neuter"
            neuter
          else
            neuter
        end        
      end
    end

    module SingletonMethods   
    end

    module InstanceMethods
      def declension(kase = nil, singular = true)
        self.class.declension(kase, singular)
      end
      
      def by_gender(masculan, feminine, neuter)
        self.class.by_gender(masculan, feminine, neuter)
      end
    end      
  end
  
  module NativeDeclensionsHelper    
  end 

end