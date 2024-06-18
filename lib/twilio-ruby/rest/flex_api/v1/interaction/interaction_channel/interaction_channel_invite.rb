##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class InteractionContext < InstanceContext
                class InteractionChannelContext < InstanceContext

                     class InteractionChannelInviteList < ListResource
                
                    ##
                    # Initialize the InteractionChannelInviteList
                    # @param [Version] version Version that contains the resource
                    # @return [InteractionChannelInviteList] InteractionChannelInviteList
                    def initialize(version, interaction_sid: nil, channel_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { interaction_sid: interaction_sid, channel_sid: channel_sid }
                        @uri = "/Interactions/#{@solution[:interaction_sid]}/Channels/#{@solution[:channel_sid]}/Invites"
                        
                    end
                    ##
                    # Create the InteractionChannelInviteInstance
                    # @param [Object] routing The Interaction's routing logic.
                    # @return [InteractionChannelInviteInstance] Created InteractionChannelInviteInstance
                    def create(
                        routing: nil
                    )

                        data = Twilio::Values.of({
                            'Routing' => Twilio.serialize_object(routing),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        InteractionChannelInviteInstance.new(
                            @version,
                            payload,
                            interaction_sid: @solution[:interaction_sid],
                            channel_sid: @solution[:channel_sid],
                        )
                    end

                
                    ##
                    # Lists InteractionChannelInviteInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields InteractionChannelInviteInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of InteractionChannelInviteInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of InteractionChannelInviteInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        InteractionChannelInvitePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of InteractionChannelInviteInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of InteractionChannelInviteInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    InteractionChannelInvitePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InteractionChannelInviteList>'
                    end
                end

                class InteractionChannelInvitePage < Page
                    ##
                    # Initialize the InteractionChannelInvitePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InteractionChannelInvitePage] InteractionChannelInvitePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InteractionChannelInviteInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InteractionChannelInviteInstance] InteractionChannelInviteInstance
                    def get_instance(payload)
                        InteractionChannelInviteInstance.new(@version, payload, interaction_sid: @solution[:interaction_sid], channel_sid: @solution[:channel_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InteractionChannelInvitePage>'
                    end
                end
                class InteractionChannelInviteInstance < InstanceResource
                    ##
                    # Initialize the InteractionChannelInviteInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InteractionChannelInvite
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InteractionChannelInviteInstance] InteractionChannelInviteInstance
                    def initialize(version, payload , interaction_sid: nil, channel_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'interaction_sid' => payload['interaction_sid'],
                            'channel_sid' => payload['channel_sid'],
                            'routing' => payload['routing'],
                            'url' => payload['url'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique string created by Twilio to identify an Interaction Channel Invite resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The Interaction SID for this Channel.
                    def interaction_sid
                        @properties['interaction_sid']
                    end
                    
                    ##
                    # @return [String] The Channel SID for this Invite.
                    def channel_sid
                        @properties['channel_sid']
                    end
                    
                    ##
                    # @return [Hash] A JSON object representing the routing rules for the Interaction Channel. See [Outbound SMS Example](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#agent-initiated-outbound-interactions) for an example Routing object. The Interactions resource uses TaskRouter for all routing functionality.   All attributes in the Routing object on your Interaction request body are added “as is” to the task. For a list of known attributes consumed by the Flex UI and/or Flex Insights, see [Known Task Attributes](https://www.twilio.com/docs/flex/developer/conversations/interactions-api#task-attributes).
                    def routing
                        @properties['routing']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.FlexApi.V1.InteractionChannelInviteInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.FlexApi.V1.InteractionChannelInviteInstance>"
                    end
                end

             end
             end
            end
        end
    end
end


