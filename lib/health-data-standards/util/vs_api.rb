require 'rest_client'
require 'uri'
module HealthDataStandards
  module Util
    class VSNotFoundError < StandardError
    end

    class VSApi
      attr_accessor :api_url, :ticket_url, :username, :password

      def initialize(ticket_url, api_url, username, password, ticket_granting_ticket = nil)
        @api_url = api_url
        @ticket_url = ticket_url
        @username = username
        @password = password
        @proxy_ticket = ticket_granting_ticket
      end

      def get_valueset(oid, effective_date = nil, include_draft = false, &block)
        params = { id: oid, ticket: get_ticket }
        params[:effectiveDate] = effective_date if effective_date
        params[:includeDraft] = 'yes' if include_draft
        vs = RestClient.get(api_url, params: params)
        yield oid, vs if block_given?
        vs
      end

      def process_valuesets(oids, effective_date = nil, &block)
        oids.each do |oid|
          vs = get_valueset(oid,effective_date)
          yield oid,vs
        end
      end

      def proxy_ticket
        @proxy_ticket ||= get_proxy_ticket
      end

      def get_proxy_ticket
        # the content type is set and the body is a string becuase the NLM service does not support urlencoded content and
        # throws an error on that contnet type
        RestClient.post(@ticket_url, username: @username, password: @password)
      end

      def get_ticket
        RestClient.post("#{ticket_url}/#{proxy_ticket}", service: "http://umlsks.nlm.nih.gov")
      end

      def self.get_tgt_using_credentials(username, password, ticket_url)
        RestClient.post(ticket_url, username: username, password: password)
      end
    end

    class VSApiV2 < VSApi
      
      # This default profile is used when the include_draft option is true without a profile specified.
      # The VSAC V2 API needs a profile to be specified when using includeDraft. Future work on this 
      # class could include a function to fetch the list of profiles from the https://vsac.nlm.nih.gov/vsac/profiles
      # call.
      DEFAULT_PROFILE = "Most Recent CS Versions"
      
      def initialize(ticket_url, api_url, username, password, ticket_granting_ticket = nil)
        super(ticket_url, api_url, username, password, ticket_granting_ticket)
      end

      def get_valueset(oid, options = {}, &block)
        version = options.fetch(:version, nil)
        include_draft = options.fetch(:include_draft, false)
        profile = options.fetch(:profile, DEFAULT_PROFILE)
        effective_date = options.fetch(:effective_date, nil)
        program_name = options.fetch(:program, nil)
        params = { id: oid, ticket: get_ticket }
        params[:version] = version if version
        params[:includeDraft] = 'yes' if include_draft
        params[:profile] = profile if include_draft
        params[:effectiveDate] = effective_date if effective_date
        params[:programType] = program_name if program_name
        begin
          vs = RestClient.get(api_url, :params=>params)
        rescue RestClient::ResourceNotFound
          raise VSNotFoundError, "No ValueSet found for oid '#{oid}'"
        end
        yield oid, vs if block_given?
        vs
      end

      def process_valuesets(oids, options = {}, &block)
        version = options.fetch(:version, nil)
        include_draft = options.fetch(:include_draft, false)
        oids.each do |oid|
          vs = get_valueset(oid, version: version, include_draft: include_draft)
          yield oid, vs
        end
      end
    end
  end
end
