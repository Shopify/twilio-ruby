##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify
      class V2 < Version
        ##
        # Initialize the V2 version of Verify
        def initialize(domain)
          super
          @version = 'v2'
          @forms = nil
          @services = nil
          @verification_attempts = nil
        end

        ##
        # @param [form.FormTypes] form_type The Type of this Form. Currently only
        #   `form-push` is supported.
        # @return [Twilio::REST::Verify::V2::FormContext] if form_type was passed.
        # @return [Twilio::REST::Verify::V2::FormList]
        def forms(form_type=:unset)
          if form_type.nil?
              raise ArgumentError, 'form_type cannot be nil'
          end
          if form_type == :unset
              @forms ||= FormList.new self
          else
              FormContext.new(self, form_type)
          end
        end

        ##
        # @param [String] sid The Twilio-provided string that uniquely identifies the
        #   Verification Service resource to fetch.
        # @return [Twilio::REST::Verify::V2::ServiceContext] if sid was passed.
        # @return [Twilio::REST::Verify::V2::ServiceList]
        def services(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @services ||= ServiceList.new self
          else
              ServiceContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The unique SID identifier of a Verification Attempt
        # @return [Twilio::REST::Verify::V2::VerificationAttemptContext] if sid was passed.
        # @return [Twilio::REST::Verify::V2::VerificationAttemptList]
        def verification_attempts(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @verification_attempts ||= VerificationAttemptList.new self
          else
              VerificationAttemptContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Verify::V2>'
        end
      end
    end
  end
end