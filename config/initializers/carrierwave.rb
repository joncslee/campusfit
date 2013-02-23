CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        
    :aws_access_key_id      => 'AKIAJNFWYHUBM55U23AQ',                        
    :aws_secret_access_key  => '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'                         
  }
  config.fog_directory  = 'campusfit'                   
end
