module B3Form
  module HelperMethods
    def add_to_options(hash, key, value)
      if hash.include? key
        hash[key] << ' ' + value
      else
        hash[key] = value
      end
    end
  end
end
