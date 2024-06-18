##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Preview
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Preview < PreviewBase
            class DeployedDevices < Version
                class FleetContext < InstanceContext

                     class DeploymentList < ListResource
                
                    ##
                    # Initialize the DeploymentList
                    # @param [Version] version Version that contains the resource
                    # @return [DeploymentList] DeploymentList
                    def initialize(version, fleet_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { fleet_sid: fleet_sid }
                        @uri = "/Fleets/#{@solution[:fleet_sid]}/Deployments"
                        
                    end
                    ##
                    # Create the DeploymentInstance
                    # @param [String] friendly_name Provides a human readable descriptive text for this Deployment, up to 256 characters long.
                    # @param [String] sync_service_sid Provides the unique string identifier of the Twilio Sync service instance that will be linked to and accessible by this Deployment.
                    # @return [DeploymentInstance] Created DeploymentInstance
                    def create(
                        friendly_name: :unset, 
                        sync_service_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'SyncServiceSid' => sync_service_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        DeploymentInstance.new(
                            @version,
                            payload,
                            fleet_sid: @solution[:fleet_sid],
                        )
                    end

                
                    ##
                    # Lists DeploymentInstance records from the API as a list.
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
                    # When passed a block, yields DeploymentInstance records from the API.
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
                    # Retrieve a single page of DeploymentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of DeploymentInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        DeploymentPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of DeploymentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of DeploymentInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    DeploymentPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Preview.DeployedDevices.DeploymentList>'
                    end
                end


                class DeploymentContext < InstanceContext
                    ##
                    # Initialize the DeploymentContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] fleet_sid 
                    # @param [String] sid Provides a 34 character string that uniquely identifies the requested Deployment resource.
                    # @return [DeploymentContext] DeploymentContext
                    def initialize(version, fleet_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { fleet_sid: fleet_sid, sid: sid,  }
                        @uri = "/Fleets/#{@solution[:fleet_sid]}/Deployments/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the DeploymentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the DeploymentInstance
                    # @return [DeploymentInstance] Fetched DeploymentInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        DeploymentInstance.new(
                            @version,
                            payload,
                            fleet_sid: @solution[:fleet_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the DeploymentInstance
                    # @param [String] friendly_name Provides a human readable descriptive text for this Deployment, up to 64 characters long
                    # @param [String] sync_service_sid Provides the unique string identifier of the Twilio Sync service instance that will be linked to and accessible by this Deployment.
                    # @return [DeploymentInstance] Updated DeploymentInstance
                    def update(
                        friendly_name: :unset, 
                        sync_service_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'SyncServiceSid' => sync_service_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        DeploymentInstance.new(
                            @version,
                            payload,
                            fleet_sid: @solution[:fleet_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.DeployedDevices.DeploymentContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.DeployedDevices.DeploymentContext #{context}>"
                    end
                end

                class DeploymentPage < Page
                    ##
                    # Initialize the DeploymentPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DeploymentPage] DeploymentPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DeploymentInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DeploymentInstance] DeploymentInstance
                    def get_instance(payload)
                        DeploymentInstance.new(@version, payload, fleet_sid: @solution[:fleet_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Preview.DeployedDevices.DeploymentPage>'
                    end
                end
                class DeploymentInstance < InstanceResource
                    ##
                    # Initialize the DeploymentInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Deployment
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DeploymentInstance] DeploymentInstance
                    def initialize(version, payload , fleet_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'url' => payload['url'],
                            'friendly_name' => payload['friendly_name'],
                            'fleet_sid' => payload['fleet_sid'],
                            'account_sid' => payload['account_sid'],
                            'sync_service_sid' => payload['sync_service_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'fleet_sid' => fleet_sid  || @properties['fleet_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [DeploymentContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = DeploymentContext.new(@version , @params['fleet_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] Contains a 34 character string that uniquely identifies this Deployment resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] Contains an absolute URL for this Deployment resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] Contains a human readable descriptive text for this Deployment, up to 64 characters long
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] Specifies the unique string identifier of the Fleet that the given Deployment belongs to.
                    def fleet_sid
                        @properties['fleet_sid']
                    end
                    
                    ##
                    # @return [String] Specifies the unique string identifier of the Account responsible for this Deployment.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] Specifies the unique string identifier of the Twilio Sync service instance linked to and accessible by this Deployment.
                    def sync_service_sid
                        @properties['sync_service_sid']
                    end
                    
                    ##
                    # @return [Time] Specifies the date this Deployment was created, given in UTC ISO 8601 format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] Specifies the date this Deployment was last updated, given in UTC ISO 8601 format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # Delete the DeploymentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the DeploymentInstance
                    # @return [DeploymentInstance] Fetched DeploymentInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the DeploymentInstance
                    # @param [String] friendly_name Provides a human readable descriptive text for this Deployment, up to 64 characters long
                    # @param [String] sync_service_sid Provides the unique string identifier of the Twilio Sync service instance that will be linked to and accessible by this Deployment.
                    # @return [DeploymentInstance] Updated DeploymentInstance
                    def update(
                        friendly_name: :unset, 
                        sync_service_sid: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            sync_service_sid: sync_service_sid, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.DeployedDevices.DeploymentInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.DeployedDevices.DeploymentInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


