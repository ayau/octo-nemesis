Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '191945647597421', 'a5d3f9fae0f62613c57490ed84e19571'
end