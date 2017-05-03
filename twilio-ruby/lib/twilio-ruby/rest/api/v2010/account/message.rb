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
          class MessageList < ListResource
            ##
            # Initialize the MessageList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique id of the Account that sent this message.
            
            # @return [MessageList] MessageList
            def initialize(version, account_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Messages.json"
            end
            
            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] to The destination phone number. Format with a '+' and country
            #   code
            # @param [String] from A Twilio phone number or alphanumeric sender ID enabled for
            #   the type of message you wish to send.
            # @param [String] status_callback The URL that Twilio will POST to each time your
            #   message status changes
            # @param [String] application_sid Twilio the POST MessageSid as well as
            #   MessageStatus to the URL in the MessageStatusCallback property of this
            #   Application
            # @param [String] body The body
            # @param [String] media_url The media_url
            
            # @return [MessageInstance] Newly created MessageInstance
            def create(to: nil, from: nil, status_callback: nil, application_sid: nil, body: nil, media_url: nil)
              data = {
                  'To' => to,
                  'From' => from,
                  'Body' => body,
                  'MediaUrl' => media_url,
                  'StatusCallback' => status_callback,
                  'ApplicationSid' => application_sid,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return MessageInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Lists MessageInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] to Filter by messages to this number
            # @param [String] from Only show messages from this phone number
            # @param [Time] date_sent_before Filter by date sent
            # @param [Time] date_sent Filter by date sent
            # @param [Time] date_sent_after: Filter by date sent
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            
            # @return [Array] Array of up to limit results
            def list(to: nil, from: nil, date_sent_before: nil, date_sent: nil, date_sent_after: nil, limit: nil, page_size: nil)
              self.stream(
                  to: to,
                  from: from,
                  date_sent_before: date_sent_before,
                  date_sent: date_sent,
                  date_sent_after: date_sent_after,
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams MessageInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] to Filter by messages to this number
            # @param [String] from Only show messages from this phone number
            # @param [Time] date_sent_before Filter by date sent
            # @param [Time] date_sent Filter by date sent
            # @param [Time] date_sent_after: Filter by date sent
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(to: nil, from: nil, date_sent_before: nil, date_sent: nil, date_sent_after: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  to: to,
                  from: from,
                  date_sent_before: date_sent_before,
                  date_sent: date_sent,
                  date_sent_after: date_sent_after,
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields MessageInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] to Filter by messages to this number
            # @param [String] from Only show messages from this phone number
            # @param [Time] date_sent_before Filter by date sent
            # @param [Time] date_sent Filter by date sent
            # @param [Time] date_sent_after: Filter by date sent
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
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] to Filter by messages to this number
            # @param [String] from Only show messages from this phone number
            # @param [Time] date_sent_before Filter by date sent
            # @param [Time] date_sent Filter by date sent
            # @param [Time] date_sent_after: Filter by date sent
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            
            # @return [Page] Page of MessageInstance
            def page(to: nil, from: nil, date_sent_before: nil, date_sent: nil, date_sent_after: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'To' => to,
                  'From' => from,
                  'DateSent<' => Twilio.serialize_iso8601(date_sent_before),
                  'DateSent' => Twilio.serialize_iso8601(date_sent),
                  'DateSent>' => Twilio.serialize_iso8601(date_sent_after),
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return MessagePage.new(@version, response, @solution)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.MessageList>'
            end
          end
        
          class MessagePage < Page
            ##
            # Initialize the MessagePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] account_sid The unique id of the Account that sent this message.
            
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
              return MessageInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.MessagePage>'
            end
          end
        
          class MessageContext < InstanceContext
            ##
            # Initialize the MessageContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The message Sid that uniquely identifies this resource
            
            # @return [MessageContext] MessageContext
            def initialize(version, account_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  sid: sid,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Messages/#{@solution[:sid]}.json"
              
              # Dependents
              @media = nil
              @feedback = nil
            end
            
            ##
            # Deletes the MessageInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Fetch a MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return MessageInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Update the MessageInstance
            # @param [String] body The body
            
            # @return [MessageInstance] Updated MessageInstance
            def update(body: nil)
              data = {
                  'Body' => body,
              }
              
              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )
              
              return MessageInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Access the media
            # @return [MediaList] MediaList
            def media(sid=:unset)
              if sid != :unset
                return MediaContext.new(
                    @version,
                    @solution[:account_sid],
                    @solution[:sid],
                    sid,
                )
              end
              
              unless @media
                @media = MediaList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    message_sid: @solution[:sid],
                )
              end
              
              @media
            end
            
            ##
            # Access the feedback
            # @return [FeedbackList] FeedbackList
            def feedback
              unless @feedback
                @feedback = FeedbackList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    message_sid: @solution[:sid],
                )
              end
              
              @feedback
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.MessageContext #{context}>"
            end
          end
        
          class MessageInstance < InstanceResource
            ##
            # Initialize the MessageInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique id of the Account that sent this message.
            # @param [String] sid The message Sid that uniquely identifies this resource
            
            # @return [MessageInstance] MessageInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'api_version' => payload['api_version'],
                  'body' => payload['body'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'date_sent' => Twilio.deserialize_rfc2822(payload['date_sent']),
                  'direction' => payload['direction'],
                  'error_code' => payload['error_code'].to_i,
                  'error_message' => payload['error_message'],
                  'from' => payload['from'],
                  'num_media' => payload['num_media'],
                  'num_segments' => payload['num_segments'],
                  'price' => payload['price'].to_f,
                  'price_unit' => payload['price_unit'],
                  'sid' => payload['sid'],
                  'status' => payload['status'],
                  'subresource_uris' => payload['subresource_uris'],
                  'to' => payload['to'],
                  'uri' => payload['uri'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            
            # @return [MessageContext] MessageContext for this MessageInstance
            def context
              unless @instance_context
                @instance_context = MessageContext.new(
                    @version,
                    @params['account_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def api_version
              @properties['api_version']
            end
            
            def body
              @properties['body']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def date_sent
              @properties['date_sent']
            end
            
            def direction
              @properties['direction']
            end
            
            def error_code
              @properties['error_code']
            end
            
            def error_message
              @properties['error_message']
            end
            
            def from
              @properties['from']
            end
            
            def num_media
              @properties['num_media']
            end
            
            def num_segments
              @properties['num_segments']
            end
            
            def price
              @properties['price']
            end
            
            def price_unit
              @properties['price_unit']
            end
            
            def sid
              @properties['sid']
            end
            
            def status
              @properties['status']
            end
            
            def subresource_uris
              @properties['subresource_uris']
            end
            
            def to
              @properties['to']
            end
            
            def uri
              @properties['uri']
            end
            
            ##
            # Deletes the MessageInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @context.delete()
            end
            
            ##
            # Fetch a MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              @context.fetch()
            end
            
            ##
            # Update the MessageInstance
            # @param [String] body The body
            
            # @return [MessageInstance] Updated MessageInstance
            def update(body: nil)
              @context.update()
            end
            
            ##
            # Access the media
            # @return [media] media
            def media
              @context.media
            end
            
            ##
            # Access the feedback
            # @return [feedback] feedback
            def feedback
              @context.feedback
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.MessageInstance #{context}>"
            end
          end
        end
      end
    end
  end
end