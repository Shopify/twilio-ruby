##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Microvisor
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Microvisor < MicrovisorBase
            class V1 < Version
                class AppList < ListResource
                
                    ##
                    # Initialize the AppList
                    # @param [Version] version Version that contains the resource
                    # @return [AppList] AppList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Apps"
                        
                    end
                
                    ##
                    # Lists AppInstance records from the API as a list.
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
                    # When passed a block, yields AppInstance records from the API.
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
                    # Retrieve a single page of AppInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AppInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        AppPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AppInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AppInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AppPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Microvisor.V1.AppList>'
                    end
                end


                class AppContext < InstanceContext
                    ##
                    # Initialize the AppContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid A 34-character string that uniquely identifies this App.
                    # @return [AppContext] AppContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Apps/#{@solution[:sid]}"

                        # Dependents
                        @app_manifests = nil
                    end
                    ##
                    # Delete the AppInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the AppInstance
                    # @return [AppInstance] Fetched AppInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        AppInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the app_manifests
                    # @return [AppManifestList]
                    # @return [AppManifestContext]
                    def app_manifests
                        AppManifestContext.new(
                                @version,
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Microvisor.V1.AppContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Microvisor.V1.AppContext #{context}>"
                    end
                end

                class AppPage < Page
                    ##
                    # Initialize the AppPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AppPage] AppPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AppInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AppInstance] AppInstance
                    def get_instance(payload)
                        AppInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Microvisor.V1.AppPage>'
                    end
                end
                class AppInstance < InstanceResource
                    ##
                    # Initialize the AppInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this App
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AppInstance] AppInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'hash' => payload['hash'],
                            'unique_name' => payload['unique_name'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
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
                    # @return [AppContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AppContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] A 34-character string that uniquely identifies this App.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] App manifest hash represented as `hash_algorithm:hash_value`.
                    def hash
                        @properties['hash']
                    end
                    
                    ##
                    # @return [String] A developer-defined string that uniquely identifies the App. This value must be unique for all Apps on this Account. The `unique_name` value may be used as an alternative to the `sid` in the URL path to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [Time] The date that this App was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this App was last updated, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
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
                    # Delete the AppInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the AppInstance
                    # @return [AppInstance] Fetched AppInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Access the app_manifests
                    # @return [app_manifests] app_manifests
                    def app_manifests
                        context.app_manifests
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Microvisor.V1.AppInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Microvisor.V1.AppInstance #{values}>"
                    end
                end

            end
        end
    end
end
