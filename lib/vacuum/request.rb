require 'jeff'

module Vacuum
  # An Amazon Product Advertising API request.
  class Request
    include Jeff

    BadLocale  = Class.new ArgumentError
    MissingTag = Class.new ArgumentError

    # A list of Amazon Product Advertising API hosts.
    HOSTS = {
      'BR' => 'webservices.amazon.com.br',
      'CA' => 'webservices.amazon.ca',
      'CN' => 'webservices.amazon.cn',
      'DE' => 'webservices.amazon.de',
      'ES' => 'webservices.amazon.es',
      'FR' => 'webservices.amazon.fr',
      'GB' => 'webservices.amazon.co.uk',
      'UK' => 'webservices.amazon.co.uk',
      'IN' => 'webservices.amazon.in',
      'IT' => 'webservices.amazon.it',
      'JP' => 'webservices.amazon.co.jp',
      'US' => 'webservices.amazon.com',
      'MX' => 'webservices.amazon.com.mx'
    }.freeze

    params 'AssociateTag' => -> { tag },
           'Service'      => 'AWSECommerceService',
           'Version'      => '2011-08-01'

    # Creates a new request for given locale and credentials.
    #
    # locale - The String Product Advertising API locale (default: US).
    #
    # Raises a Bad Locale error if locale is not valid.
    def initialize(locale = nil)
      host = HOSTS[locale || 'US'] or raise BadLocale
      self.endpoint = "http://#{host}/onca/xml"
    end

    # Configures the Amazon Product Advertising API request.
    #
    # credentials - The Hash credentials of the API endpoint.
    #               :key    - The String Amazon Web Services (AWS) key.
    #               :secret - The String AWS secret.
    #               :tag    - The String Associate Tag.
    #
    # Yields self.
    #
    # Returns nothing.
    def configure(credentials, &blk)
      if block_given?
        yield self
      else
        credentials.each { |key, val| self.send "#{key}=", val }
      end
    end

    # Gets the String Associate Tag.
    #
    # Raises a Missing Tag error if Associate Tag is missing.
    def tag
      @tag or raise MissingTag
    end

    # Sets the String Associate Tag.
    attr_writer :tag
  end
end
