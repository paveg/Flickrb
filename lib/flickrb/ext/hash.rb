# frozen_string_literal: true

class Hash
  def deep_symbolize_keys
    each_with_object({}) do |(key, val), m|
      if val.is_a?(Array)
        val = val.map do |v|
          v.is_a?(Hash) ? v.deep_symbolize_keys : v
        end
      elsif val.is_a?(Hash)
        val = val.deep_symbloize_keys
      end
      m[key.to_s.to_sym] = val
    end
  end
end
