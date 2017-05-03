##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class SipList < ListResource
            class IpAccessControlListContext < InstanceContext
              class IpAddressList < ListResource
                ##
                # Initialize the IpAddressList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The account_sid
                # @param [String] ip_access_control_list_sid The ip_access_control_list_sid
                
                # @return [IpAddressList] IpAddressList
                def initialize(version, account_sid: nil, ip_access_control_list_sid: nil)
                  super(version)
                  
                  # Path Solution
                  @solution = {
                      account_sid: account_sid,
                      ip_access_control_list_sid: ip_access_control_list_sid
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists/#{@solution[:ip_access_control_list_sid]}/IpAddresses.json"
                end
                
                ##
                # Lists IpAddressInstance records from the API as a list.
                # Unlike stream(), this operation is eager and will load `limit` records into
                # memory before returning.
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #                   guarantees to never return more than limit.  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
                #  the default value of 50 records.  If no page_size is                      defined
                #  but a limit is defined, stream() will attempt to read                      the
                #  limit with the most efficient page size,                      i.e. min(limit, 1000)
                
                # @return [Array] Array of up to limit results
                def list(limit: nil, page_size: nil)
                  self.stream(
                      limit: limit,
                      page_size: page_size
                  ).entries
                end
                
                ##
                # Streams IpAddressInstance records from the API as an Enumerable.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [Integer] limit Upper limit for the number of records to return.                  stream()
                #  guarantees to never return more than limit.                  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
                #  the default value of 50 records.                      If no page_size is defined
                #                       but a limit is defined, stream() will attempt to                      read the
                #  limit with the most efficient page size,                       i.e. min(limit, 1000)
                
                # @return [Enumerable] Enumerable that will yield up to limit results
                def stream(limit: nil, page_size: nil)
                  limits = @version.read_limits(limit, page_size)
                  
                  page = self.page(
                      page_size: limits['page_size'],
                  )
                  
                  @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
                end
                
                ##
                # When passed a block, yields IpAddressInstance records from the API.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [Integer] limit Upper limit for the number of records to return.                  stream()
                #  guarantees to never return more than limit.                  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
                #  the default value of 50 records.                      If no page_size is defined
                #                       but a limit is defined, stream() will attempt to read the
                #                       limit with the most efficient page size, i.e. min(limit, 1000)
                def each
                  limits = @version.read_limits
                  
                  page = self.page(
                      page_size: limits['page_size'],
                  )
                  
                  @version.stream(page,
                                  limit: limits['limit'],
                                  page_limit: limits['page_limit']).each {|x| yield x}
                end
                
                ##
                # Retrieve a single page of IpAddressInstance records from the API.
                # Request is executed immediately.
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                
                # @return [Page] Page of IpAddressInstance
                def page(page_token: nil, page_number: nil, page_size: nil)
                  params = {
                      'PageToken' => page_token,
                      'Page' => page_number,
                      'PageSize' => page_size,
                  }
                  response = @version.page(
                      'GET',
                      @uri,
                      params
                  )
                  return IpAddressPage.new(@version, response, @solution)
                end
                
                ##
                # Retrieve a single page of IpAddressInstance records from the API.
                # Request is executed immediately.
                # @param [String] friendly_name The friendly_name
                # @param [String] ip_address The ip_address
                
                # @return [IpAddressInstance] Newly created IpAddressInstance
                def create(friendly_name: nil, ip_address: nil)
                  data = {
                      'FriendlyName' => friendly_name,
                      'IpAddress' => ip_address,
                  }
                  
                  payload = @version.create(
                      'POST',
                      @uri,
                      data: data
                  )
                  
                  return IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution['account_sid'],
                      ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
                  )
                end
                
                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.IpAddressList>'
                end
              end
            
              class IpAddressPage < Page
                ##
                # Initialize the IpAddressPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @param [String] account_sid The account_sid
                # @param [String] ip_access_control_list_sid The ip_access_control_list_sid
                
                # @return [IpAddressPage] IpAddressPage
                def initialize(version, response, solution)
                  super(version, response)
                  
                  # Path Solution
                  @solution = solution
                end
                
                ##
                # Build an instance of IpAddressInstance
                # @param [Hash] payload Payload response from the API
                
                # @return [IpAddressInstance] IpAddressInstance
                def get_instance(payload)
                  return IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution['account_sid'],
                      ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
                  )
                end
                
                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.IpAddressPage>'
                end
              end
            
              class IpAddressContext < InstanceContext
                ##
                # Initialize the IpAddressContext
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The account_sid
                # @param [String] ip_access_control_list_sid The ip_access_control_list_sid
                # @param [String] sid The sid
                
                # @return [IpAddressContext] IpAddressContext
                def initialize(version, account_sid, ip_access_control_list_sid, sid)
                  super(version)
                  
                  # Path Solution
                  @solution = {
                      account_sid: account_sid,
                      ip_access_control_list_sid: ip_access_control_list_sid,
                      sid: sid,
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists/#{@solution[:ip_access_control_list_sid]}/IpAddresses/#{@solution[:sid]}.json"
                end
                
                ##
                # Fetch a IpAddressInstance
                # @return [IpAddressInstance] Fetched IpAddressInstance
                def fetch
                  params = {}
                  
                  payload = @version.fetch(
                      'GET',
                      @uri,
                      params,
                  )
                  
                  return IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution['account_sid'],
                      ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
                      sid: @solution['sid'],
                  )
                end
                
                ##
                # Update the IpAddressInstance
                # @param [String] ip_address The ip_address
                # @param [String] friendly_name The friendly_name
                
                # @return [IpAddressInstance] Updated IpAddressInstance
                def update(ip_address: nil, friendly_name: nil)
                  data = {
                      'IpAddress' => ip_address,
                      'FriendlyName' => friendly_name,
                  }
                  
                  payload = @version.update(
                      'POST',
                      @uri,
                      data: data,
                  )
                  
                  return IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution['account_sid'],
                      ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
                      sid: @solution['sid'],
                  )
                end
                
                ##
                # Deletes the IpAddressInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  return @version.delete('delete', @uri)
                end
                
                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Api.V2010.IpAddressContext #{context}>"
                end
              end
            
              class IpAddressInstance < InstanceResource
                ##
                # Initialize the IpAddressInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid The account_sid
                # @param [String] ip_access_control_list_sid The ip_access_control_list_sid
                # @param [String] sid The sid
                
                # @return [IpAddressInstance] IpAddressInstance
                def initialize(version, payload, account_sid: nil, ip_access_control_list_sid: nil, sid: nil)
                  super(version)
                  
                  # Marshaled Properties
                  @properties = {
                      'sid' => payload['sid'],
                      'account_sid' => payload['account_sid'],
                      'friendly_name' => payload['friendly_name'],
                      'ip_address' => payload['ip_address'],
                      'ip_access_control_list_sid' => payload['ip_access_control_list_sid'],
                      'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                      'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                      'uri' => payload['uri'],
                  }
                  
                  # Context
                  @instance_context = nil
                  @params = {
                      'account_sid' => account_sid,
                      'ip_access_control_list_sid' => ip_access_control_list_sid,
                      'sid' => sid || @properties['sid'],
                  }
                end
                
                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @param [Version] version Version that contains the resource
                
                # @return [IpAddressContext] IpAddressContext for this IpAddressInstance
                def context
                  unless @instance_context
                    @instance_context = IpAddressContext.new(
                        @version,
                        @params['account_sid'],
                        @params['ip_access_control_list_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end
                
                def sid
                  @properties['sid']
                end
                
                def account_sid
                  @properties['account_sid']
                end
                
                def friendly_name
                  @properties['friendly_name']
                end
                
                def ip_address
                  @properties['ip_address']
                end
                
                def ip_access_control_list_sid
                  @properties['ip_access_control_list_sid']
                end
                
                def date_created
                  @properties['date_created']
                end
                
                def date_updated
                  @properties['date_updated']
                end
                
                def uri
                  @properties['uri']
                end
                
                ##
                # Fetch a IpAddressInstance
                # @return [IpAddressInstance] Fetched IpAddressInstance
                def fetch
                  @context.fetch()
                end
                
                ##
                # Update the IpAddressInstance
                # @param [String] ip_address The ip_address
                # @param [String] friendly_name The friendly_name
                
                # @return [IpAddressInstance] Updated IpAddressInstance
                def update(ip_address: nil, friendly_name: nil)
                  @context.update(
                      friendly_name: friendly_name,
                  )
                end
                
                ##
                # Deletes the IpAddressInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  @context.delete()
                end
                
                ##
                # Provide a user friendly representation
                def to_s
                  context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.IpAddressInstance #{context}>"
                end
              end
            end
          end
        end
      end
    end
  end
end