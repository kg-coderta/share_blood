require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? 
    config.storage = :file
  elsif Rails.env.production? #本番はS3に保存
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',     #AWSのアクセスキーとシークレットキーを環境変数で定義
      aws_access_key_id: Rails.application.secrets.aws_access_key_id, 
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key, 
      region: 'ap-northeast-1'
    }
    config.fog_directory  = "kg5" #'S3のバケット名'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/kg5'
  end
end