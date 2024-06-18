##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Events
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Events < EventsBase
            class V1 < Version
                class EventTypeList < ListResource
                
                    ##
                    # Initialize the EventTypeList
                    # @param [Version] version Version that contains the resource
                    # @return [EventTypeList] EventTypeList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Types"
                        
                    end
                
                    ##
                    # Lists EventTypeInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] schema_id A string parameter filtering the results to return only the Event Types using a given schema.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(schema_id: :unset, limit: nil, page_size: nil)
                        self.stream(
                            schema_id: schema_id,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] schema_id A string parameter filtering the results to return only the Event Types using a given schema.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(schema_id: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            schema_id: schema_id,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields EventTypeInstance records from the API.
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
                    # Retrieve a single page of EventTypeInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] schema_id A string parameter filtering the results to return only the Event Types using a given schema.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of EventTypeInstance
                    def page(schema_id: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'SchemaId' => schema_id,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        EventTypePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of EventTypeInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of EventTypeInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    EventTypePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Events.V1.EventTypeList>'
                    end
                end


                class EventTypeContext < InstanceContext
                    ##
                    # Initialize the EventTypeContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] type A string that uniquely identifies this Event Type.
                    # @return [EventTypeContext] EventTypeContext
                    def initialize(version, type)
                        super(version)

                        # Path Solution
                        @solution = { type: type,  }
                        @uri = "/Types/#{@solution[:type]}"

                        
                    end
                    ##
                    # Fetch the EventTypeInstance
                    # @return [EventTypeInstance] Fetched EventTypeInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        EventTypeInstance.new(
                            @version,
                            payload,
                            type: @solution[:type],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.EventTypeContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.EventTypeContext #{context}>"
                    end
                end

                class EventTypePage < Page
                    ##
                    # Initialize the EventTypePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [EventTypePage] EventTypePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of EventTypeInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [EventTypeInstance] EventTypeInstance
                    def get_instance(payload)
                        EventTypeInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Events.V1.EventTypePage>'
                    end
                end
                class EventTypeInstance < InstanceResource
                    ##
                    # Initialize the EventTypeInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this EventType
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [EventTypeInstance] EventTypeInstance
                    def initialize(version, payload , type: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'type' => payload['type'],
                            'schema_id' => payload['schema_id'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'description' => payload['description'],
                            'status' => payload['status'],
                            'documentation_url' => payload['documentation_url'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'type' => type  || @properties['type']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [EventTypeContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = EventTypeContext.new(@version , @params['type'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] A string that uniquely identifies this Event Type.
                    def type
                        @properties['type']
                    end
                    
                    ##
                    # @return [String] A string that uniquely identifies the Schema this Event Type adheres to.
                    def schema_id
                        @properties['schema_id']
                    end
                    
                    ##
                    # @return [Time] The date that this Event Type was created, given in ISO 8601 format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this Event Type was updated, given in ISO 8601 format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] A human readable description for this Event Type.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [String] A string that describes how this Event Type can be used. For example: `available`, `deprecated`, `restricted`, `discontinued`. When the status is `available`, the Event Type can be used normally.
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The URL to the documentation or to the most relevant Twilio Changelog entry of this Event Type.
                    def documentation_url
                        @properties['documentation_url']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the EventTypeInstance
                    # @return [EventTypeInstance] Fetched EventTypeInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.EventTypeInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.EventTypeInstance #{values}>"
                    end
                end

            end
        end
    end
end
