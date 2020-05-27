##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Log' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.serverless.v1.services('ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .environments('ZEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .logs.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://serverless.twilio.com/v1/Services/ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Environments/ZEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Logs',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "logs": [],
          "meta": {
              "first_page_url": "https://serverless.twilio.com/v1/Services/ZS00000000000000000000000000000000/Environments/ZE00000000000000000000000000000000/Logs?StartDate=2018-11-10T20%3A00%3A00Z&EndDate=2018-12-10T20%3A00%3A00Z&FunctionSid=ZH00000000000000000000000000000000&PageSize=50&Page=0",
              "key": "logs",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://serverless.twilio.com/v1/Services/ZS00000000000000000000000000000000/Environments/ZE00000000000000000000000000000000/Logs?StartDate=2018-11-10T20%3A00%3A00Z&EndDate=2018-12-10T20%3A00%3A00Z&FunctionSid=ZH00000000000000000000000000000000&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.serverless.v1.services('ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .environments('ZEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .logs.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.serverless.v1.services('ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .environments('ZEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .logs('NOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://serverless.twilio.com/v1/Services/ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Environments/ZEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Logs/NOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "NO00000000000000000000000000000000",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ZS00000000000000000000000000000000",
          "environment_sid": "ZE00000000000000000000000000000000",
          "build_sid": "ZB00000000000000000000000000000000",
          "deployment_sid": "ZD00000000000000000000000000000000",
          "function_sid": "ZH00000000000000000000000000000000",
          "request_sid": "RQ00000000000000000000000000000000",
          "level": "warn",
          "message": "This is a warning",
          "date_created": "2018-11-10T20:00:00Z",
          "url": "https://serverless.twilio.com/v1/Services/ZS00000000000000000000000000000000/Environments/ZE00000000000000000000000000000000/Logs/NO00000000000000000000000000000000"
      }
      ]
    ))

    actual = @client.serverless.v1.services('ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .environments('ZEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .logs('NOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end
end