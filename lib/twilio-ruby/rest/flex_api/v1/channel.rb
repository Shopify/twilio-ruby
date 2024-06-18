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
                class ChannelList < ListResource
                
                    ##
                    # Initialize the ChannelList
                    # @param [Version] version Version that contains the resource
                    # @return [ChannelList] ChannelList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Channels"
                        
                    end
                    ##
                    # Create the ChannelInstance
                    # @param [String] flex_flow_sid The SID of the Flex Flow.
                    # @param [String] identity The `identity` value that uniquely identifies the new resource's chat User.
                    # @param [String] chat_user_friendly_name The chat participant's friendly name.
                    # @param [String] chat_friendly_name The chat channel's friendly name.
                    # @param [String] target The Target Contact Identity, for example the phone number of an SMS.
                    # @param [String] chat_unique_name The chat channel's unique name.
                    # @param [String] pre_engagement_data The pre-engagement data.
                    # @param [String] task_sid The SID of the TaskRouter Task. Only valid when integration type is `task`. `null` for integration types `studio` & `external`
                    # @param [String] task_attributes The Task attributes to be added for the TaskRouter Task.
                    # @param [Boolean] long_lived Whether to create the channel as long-lived.
                    # @return [ChannelInstance] Created ChannelInstance
                    def create(
                        flex_flow_sid: nil, 
                        identity: nil, 
                        chat_user_friendly_name: nil, 
                        chat_friendly_name: nil, 
                        target: :unset, 
                        chat_unique_name: :unset, 
                        pre_engagement_data: :unset, 
                        task_sid: :unset, 
                        task_attributes: :unset, 
                        long_lived: :unset
                    )

                        data = Twilio::Values.of({
                            'FlexFlowSid' => flex_flow_sid,
                            'Identity' => identity,
                            'ChatUserFriendlyName' => chat_user_friendly_name,
                            'ChatFriendlyName' => chat_friendly_name,
                            'Target' => target,
                            'ChatUniqueName' => chat_unique_name,
                            'PreEngagementData' => pre_engagement_data,
                            'TaskSid' => task_sid,
                            'TaskAttributes' => task_attributes,
                            'LongLived' => long_lived,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        ChannelInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists ChannelInstance records from the API as a list.
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
                    # When passed a block, yields ChannelInstance records from the API.
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
                    # Retrieve a single page of ChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ChannelInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ChannelPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ChannelInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ChannelPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.ChannelList>'
                    end
                end


                class ChannelContext < InstanceContext
                    ##
                    # Initialize the ChannelContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Flex chat channel resource to fetch.
                    # @return [ChannelContext] ChannelContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Channels/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the ChannelInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the ChannelInstance
                    # @return [ChannelInstance] Fetched ChannelInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        ChannelInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.ChannelContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.ChannelContext #{context}>"
                    end
                end

                class ChannelPage < Page
                    ##
                    # Initialize the ChannelPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ChannelPage] ChannelPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ChannelInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ChannelInstance] ChannelInstance
                    def get_instance(payload)
                        ChannelInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.ChannelPage>'
                    end
                end
                class ChannelInstance < InstanceResource
                    ##
                    # Initialize the ChannelInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Channel
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ChannelInstance] ChannelInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'flex_flow_sid' => payload['flex_flow_sid'],
                            'sid' => payload['sid'],
                            'user_sid' => payload['user_sid'],
                            'task_sid' => payload['task_sid'],
                            'url' => payload['url'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ChannelContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ChannelContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Channel resource and owns this Workflow.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Flex Flow.
                    def flex_flow_sid
                        @properties['flex_flow_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Channel resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the chat user.
                    def user_sid
                        @properties['user_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskRouter Task. Only valid when integration type is `task`. `null` for integration types `studio` & `external`
                    def task_sid
                        @properties['task_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Flex chat channel resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Flex chat channel was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Flex chat channel was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # Delete the ChannelInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the ChannelInstance
                    # @return [ChannelInstance] Fetched ChannelInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.ChannelInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.ChannelInstance #{values}>"
                    end
                end

            end
        end
    end
end
