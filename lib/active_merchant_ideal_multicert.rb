require 'openssl'
require 'digest/sha1'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc: 
    class IdealGateway < Gateway
      # Get certificate data by fingerprint.
      def self.certificate_for_fingerprint(fingerprint)
        @certificates_by_fingerprint[fingerprint]
      end
      
      # Save data of multiple certificates by certificate fingerprint.
      def self.ideal_certificate_files=(certificate_files)
        @certificates_by_fingerprint = certificate_files.inject({}) do |result, file|
          data = File.read(file)
          result[self.fingerprint(data)] = data
          result
        end
      end
      
      private
      # Calculate fingerprint of a certificate data, which is defined as the
      # SHA1-digest of the binary certificate data.
      def self.fingerprint(certificate_data)
        certificate = OpenSSL::X509::Certificate.new(certificate_data)
        Digest::SHA1.hexdigest(certificate.to_der).upcase
      end
    end
  end
end

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class IdealStatusResponse < IdealResponse
      alias_method :old_verified?, :verified?

      # Find the proper certificate and run the old verified code.
      def verified?
        certificate = IdealGateway.certificate_for_fingerprint(fingerprint)
        return false unless certificate
        IdealGateway.ideal_certificate = certificate
        old_verified?
      end
      
      # Find the fingerprint in the XML.
      def fingerprint
        text('//fingerprint').upcase
      end
    end
  end
end
