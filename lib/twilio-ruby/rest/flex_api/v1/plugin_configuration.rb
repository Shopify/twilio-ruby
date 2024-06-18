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
                class PluginConfigurationList < ListResource
                
                    ##
                    # Initialize the PluginConfigurationList
                    # @param [Version] version Version that contains the resource
                    # @return [PluginConfigurationList] PluginConfigurationList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/PluginService/Configurations"
                        
                    end
                    ##
                    # Create the PluginConfigurationInstance
                    # @param [String] name The Flex Plugin Configuration's name.
                    # @param [Array[Hash]] plugins A list of objects that describe the plugin versions included in the configuration. Each object contains the sid of the plugin version.
                    # @param [String] description The Flex Plugin Configuration's description.
                    # @param [String] flex_metadata The Flex-Metadata HTTP request header
                    # @return [PluginConfigurationInstance] Created PluginConfigurationInstance
                    def create(
                        name: nil, 
                        plugins: :unset, 
                        description: :unset, 
                        flex_metadata: :unset
                    )

                        data = Twilio::Values.of({
                            'Name' => name,
                            'Plugins' => Twilio.serialize_list(plugins) { |e| Twilio.serialize_object(e) },
                            'Description' => description,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Flex-Metadata' => flex_metadata, })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        PluginConfigurationInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists PluginConfigurationInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] flex_metadata The Flex-Metadata HTTP request header
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(flex_metadata: :unset, limit: nil, page_size: nil)
                        self.stream(
                            flex_metadata: flex_metadata,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] flex_metadata The Flex-Metadata HTTP request header
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(flex_metadata: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            flex_metadata: flex_metadata,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields PluginConfigurationInstance records from the API.
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
                    # Retrieve a single page of PluginConfigurationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] flex_metadata The Flex-Metadata HTTP request header
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of PluginConfigurationInstance
                    def page(flex_metadata: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Flex-Metadata' => flex_metadata,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        PluginConfigurationPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of PluginConfigurationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of PluginConfigurationInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    PluginConfigurationPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.PluginConfigurationList>'
                    end
                end


                class PluginConfigurationContext < InstanceContext
                    ##
                    # Initialize the PluginConfigurationContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Flex Plugin Configuration resource to fetch.
                    # @return [PluginConfigurationContext] PluginConfigurationContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/PluginService/Configurations/#{@solution[:sid]}"

                        # Dependents
                        @plugins = nil
                    end
                    ##
                    # Fetch the PluginConfigurationInstance
                    # @param [String] flex_metadata The Flex-Metadata HTTP request header
                    # @return [PluginConfigurationInstance] Fetched PluginConfigurationInstance
                    def fetch(
                        flex_metadata: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Flex-Metadata' => flex_metadata, })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        PluginConfigurationInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the plugins
                    # @return [ConfiguredPluginList]
                    # @return [ConfiguredPluginContext] if sid was passed.
                    def plugins(plugin_sid=:unset)

                        raise ArgumentError, 'plugin_sid cannot be nil' if plugin_sid.nil?

                        if plugin_sid != :unset
                            return ConfiguredPluginContext.new(@version, @solution[:sid],plugin_sid )
                        end

                        unless @plugins
                            @plugins = ConfiguredPluginList.new(
                                @version, configuration_sid: @solution[:sid], )
                        end

                     @plugins
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.PluginConfigurationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.PluginConfigurationContext #{context}>"
                    end
                end

                class PluginConfigurationPage < Page
                    ##
                    # Initialize the PluginConfigurationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [PluginConfigurationPage] PluginConfigurationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of PluginConfigurationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [PluginConfigurationInstance] PluginConfigurationInstance
                    def get_instance(payload)
                        PluginConfigurationInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.PluginConfigurationPage>'
                    end
                end
                class PluginConfigurationInstance < InstanceResource
                    ##
                    # Initialize the PluginConfigurationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this PluginConfiguration
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [PluginConfigurationInstance] PluginConfigurationInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'name' => payload['name'],
                            'description' => payload['description'],
                            'archived' => payload['archived'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [PluginConfigurationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = PluginConfigurationContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Flex Plugin Configuration resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Plugin Configuration resource and owns this resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The name of this Flex Plugin Configuration.
                    def name
                        @properties['name']
                    end
                    
                    ##
                    # @return [String] The description of the Flex Plugin Configuration resource.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [Boolean] Whether the Flex Plugin Configuration is archived. The default value is false.
                    def archived
                        @properties['archived']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Flex Plugin Configuration was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Flex Plugin Configuration resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the PluginConfigurationInstance
                    # @param [String] flex_metadata The Flex-Metadata HTTP request header
                    # @return [PluginConfigurationInstance] Fetched PluginConfigurationInstance
                    def fetch(
                        flex_metadata: :unset
                    )

                        context.fetch(
                            flex_metadata: flex_metadata, 
                        )
                    end

                    ##
                    # Access the plugins
                    # @return [plugins] plugins
                    def plugins
                        context.plugins
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.PluginConfigurationInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.PluginConfigurationInstance #{values}>"
                    end
                end

            end
        end
    end
end
