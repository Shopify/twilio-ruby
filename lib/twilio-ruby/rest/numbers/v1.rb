##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Numbers
      class V1 < Version
        ##
        # Initialize the V1 version of Numbers
        def initialize(domain)
          super
          @version = 'v1'
          @eligibilities = nil
        end

        ##
        # @return [Twilio::REST::Numbers::V1::EligibilityContext]
        def eligibilities
          @eligibilities ||= EligibilityList.new self
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Numbers::V1>'
        end
      end
    end
  end
end