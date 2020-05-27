##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class TrustedComms < Version
        class BusinessContext < InstanceContext
          class BrandContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class BrandedChannelList < ListResource
              ##
              # Initialize the BrandedChannelList
              # @param [Version] version Version that contains the resource
              # @param [String] business_sid The unique SID identifier of the Business.
              # @param [String] brand_sid The unique SID identifier of the Brand.
              # @return [BrandedChannelList] BrandedChannelList
              def initialize(version, business_sid: nil, brand_sid: nil)
                super(version)

                # Path Solution
                @solution = {business_sid: business_sid, brand_sid: brand_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Preview.TrustedComms.BrandedChannelList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class BrandedChannelPage < Page
              ##
              # Initialize the BrandedChannelPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [BrandedChannelPage] BrandedChannelPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of BrandedChannelInstance
              # @param [Hash] payload Payload response from the API
              # @return [BrandedChannelInstance] BrandedChannelInstance
              def get_instance(payload)
                BrandedChannelInstance.new(
                    @version,
                    payload,
                    business_sid: @solution[:business_sid],
                    brand_sid: @solution[:brand_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Preview.TrustedComms.BrandedChannelPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class BrandedChannelContext < InstanceContext
              ##
              # Initialize the BrandedChannelContext
              # @param [Version] version Version that contains the resource
              # @param [String] business_sid The unique SID identifier of the Business.
              # @param [String] brand_sid The unique SID identifier of the Brand.
              # @param [String] sid The unique SID identifier of the Branded Channel.
              # @return [BrandedChannelContext] BrandedChannelContext
              def initialize(version, business_sid, brand_sid, sid)
                super(version)

                # Path Solution
                @solution = {business_sid: business_sid, brand_sid: brand_sid, sid: sid, }
                @uri = "/Businesses/#{@solution[:business_sid]}/Brands/#{@solution[:brand_sid]}/BrandedChannels/#{@solution[:sid]}"

                # Dependents
                @channels = nil
              end

              ##
              # Fetch a BrandedChannelInstance
              # @return [BrandedChannelInstance] Fetched BrandedChannelInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                BrandedChannelInstance.new(
                    @version,
                    payload,
                    business_sid: @solution[:business_sid],
                    brand_sid: @solution[:brand_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Access the channels
              # @return [ChannelList]
              # @return [ChannelContext]
              def channels
                unless @channels
                  @channels = ChannelList.new(
                      @version,
                      business_sid: @solution[:business_sid],
                      brand_sid: @solution[:brand_sid],
                      branded_channel_sid: @solution[:sid],
                  )
                end

                @channels
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Preview.TrustedComms.BrandedChannelContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Preview.TrustedComms.BrandedChannelContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class BrandedChannelInstance < InstanceResource
              ##
              # Initialize the BrandedChannelInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] business_sid The unique SID identifier of the Business.
              # @param [String] brand_sid The unique SID identifier of the Brand.
              # @param [String] sid The unique SID identifier of the Branded Channel.
              # @return [BrandedChannelInstance] BrandedChannelInstance
              def initialize(version, payload, business_sid: nil, brand_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'business_sid' => payload['business_sid'],
                    'brand_sid' => payload['brand_sid'],
                    'sid' => payload['sid'],
                    'links' => payload['links'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'business_sid' => business_sid,
                    'brand_sid' => brand_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [BrandedChannelContext] BrandedChannelContext for this BrandedChannelInstance
              def context
                unless @instance_context
                  @instance_context = BrandedChannelContext.new(
                      @version,
                      @params['business_sid'],
                      @params['brand_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Business Sid.
              def business_sid
                @properties['business_sid']
              end

              ##
              # @return [String] Brand Sid.
              def brand_sid
                @properties['brand_sid']
              end

              ##
              # @return [String] Branded Channel Sid.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Nested resource URLs.
              def links
                @properties['links']
              end

              ##
              # @return [String] The URL of this resource.
              def url
                @properties['url']
              end

              ##
              # Fetch a BrandedChannelInstance
              # @return [BrandedChannelInstance] Fetched BrandedChannelInstance
              def fetch
                context.fetch
              end

              ##
              # Access the channels
              # @return [channels] channels
              def channels
                context.channels
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Preview.TrustedComms.BrandedChannelInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Preview.TrustedComms.BrandedChannelInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end