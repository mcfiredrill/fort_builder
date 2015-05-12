class UploadsController < ApplicationController
  def sign
    @expires = 10.hours.from_now
    render json: {
      acl: 'public-read',
      awsaccesskeyid: ENV['S3_KEY'],
      bucket: ENV['FORTCHAN13_S3_BUCKET'],
      expires: @expires,
      key: "uploads/#{params[:name]}",
      policy: policy,
      signature: signature,
      success_action_status: '201',
      'Content-Type' => params[:type],
      'Cache-Control' => 'max-age=630720000, public'
    }, status: :ok
  end

  private
  def policy options={}
    Base64.strict_encode64(
      {
        expiration: @expires,
        conditions: [
          { bucket: ENV['FORTCHAN13_S3_BUCKET'] },
          { acl: 'public-read' },
          { expires: @expires },
          { success_action_status: '201' },
          [ 'starts-with', '$key', '' ],
          [ 'starts-with', '$Content-Type', '' ],
          [ 'starts-with', '$Cache-Control', '' ],
          [ 'content-length-range', 0, 524288000 ]
        ]
      }.to_json
    )
  end

  def signature
    Base64.strict_encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        ENV['S3_SECRET'],
        policy({ secret_access_key: ENV['S3_SECRET'] })
      )
    )
  end
end
