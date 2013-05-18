require 'uri'

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    def valid?(url)
      uri = URI.parse(url)
      uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
    end
    unless valid?('http://' + value)
      record.errors[attribute] << (options[:message] || "is not a valid URL")
    end
  end
end
