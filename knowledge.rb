class Module
	def attribute(a, ret_val=nil, &block)
		if a.is_a?(Hash)
			a.each{|key,value| attribute(key,value)}
      		return
		end
	define_method(a) do ||
      if instance_variables.size > 0
        instance_variable_get("@#{a}")
      else
        block ? instance_eval(&block) : ret_val #ask how the f* it works
      end
    end
		attr_writer a
		define_method("#{a}?"){!send(a).nil?}
	end
end