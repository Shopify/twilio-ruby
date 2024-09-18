##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Assistants
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Assistants < AssistantsBase
            class V1 < Version
                class Session < InstanceContext

                     class MessageList < ListResource
                
                    ##
                    # Initialize the MessageList
                    # @param [Version] version Version that contains the resource
                    # @return [MessageList] MessageList
                    def initialize(version, session_id: nil)
                        super(version)
                        # Path Solution
                        @solution = { session_id: session_id }
                        @uri = "/Sessions/#{@solution[:session_id]}/Messages"
                        
                    end
                
                    ##
                    # Lists MessageInstance records from the API as a list.
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
                    # When passed a block, yields MessageInstance records from the API.
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
                    # Retrieve a single page of MessageInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of MessageInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        MessagePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of MessageInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of MessageInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    MessagePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Assistants.V1.MessageList>'
                    end
                end

                class MessagePage < Page
                    ##
                    # Initialize the MessagePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [MessagePage] MessagePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of MessageInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [MessageInstance] MessageInstance
                    def get_instance(payload)
                        MessageInstance.new(@version, payload, session_id: @solution[:session_id])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Assistants.V1.MessagePage>'
                    end
                end
                class MessageInstance < InstanceResource
                    ##
                    # Initialize the MessageInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Message
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [MessageInstance] MessageInstance
                    def initialize(version, payload , session_id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'id' => payload['id'],
                            'account_sid' => payload['account_sid'],
                            'assistant_id' => payload['assistant_id'],
                            'session_id' => payload['session_id'],
                            'identity' => payload['identity'],
                            'role' => payload['role'],
                            'content' => payload['content'],
                            'meta' => payload['meta'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }
                    end

                    
                    ##
                    # @return [String] The message ID.
                    def id
                        @properties['id']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Message resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The Assistant ID.
                    def assistant_id
                        @properties['assistant_id']
                    end
                    
                    ##
                    # @return [String] The Session ID.
                    def session_id
                        @properties['session_id']
                    end
                    
                    ##
                    # @return [String] The identity of the user.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [String] The role of the user associated with the message.
                    def role
                        @properties['role']
                    end
                    
                    ##
                    # @return [Hash] The content of the message.
                    def content
                        @properties['content']
                    end
                    
                    ##
                    # @return [Hash] The metadata of the message.
                    def meta
                        @properties['meta']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Message was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Message was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Assistants.V1.MessageInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Assistants.V1.MessageInstance>"
                    end
                end

             end
            end
        end
    end
end


