class Admin::Setting < ActiveRecord::Base

  has_one :account

  # Create a hash of the stored settings
	def get_hash_of_overrides
    settings_hash = {}

    settings_hash.merge!(issuer: self.issuer) \
      if self.issuer != nil

    settings_hash.merge!(assertion_consumer_service_url: self.assertion_consumer_service_url) \
      if self.assertion_consumer_service_url != nil

    # Note the rename of single_logout_service_url
    settings_hash.merge!(assertion_consumer_logout_service_url: self.single_logout_service_url) \
      if self.single_logout_service_url != nil

    settings_hash.merge!(idp_sso_target_url: self.idp_sso_target_url) \
      if self.idp_sso_target_url != ""

    settings_hash.merge!(idp_cert_fingerprint: self.idp_cert_fingerprint) \
      if self.idp_cert_fingerprint != ""

    settings_hash.merge!(name_identifier_format: self.name_identifier_format) \
      if self.name_identifier_format != ""

    settings_hash.merge!(authn_context: self.authn_context) \
      if self.authn_context != ""

		#  *** Calh Settings not in the new ruby-saml gem ***
    settings_hash.merge!(assertion_consumer_service_binding: self.assertion_consumer_service_binding) \
      if self.assertion_consumer_service_binding != nil
    
    settings_hash.merge!(assertion_consumer_logout_service_binding: self.single_logout_service_binding) \
      if self.single_logout_service_binding != nil
    
    settings_hash.merge!(idp_metadata: self.idp_metadata) \
      if self.idp_metadata != ""
    
    settings_hash.merge!(idp_metadata_ttl: self.idp_metadata_ttl) \
      if self.idp_metadata_ttl != nil

    # Attribute used in SSO Logout ( :sp_name_qualifier )
    # Attribute used to control compression, default = true ( :compress_request )
    settings_hash.merge!(compress_request: true)
    # Attributes used internally:  :idp_cert, :name_identifier_value, :sessionindex
    # idp_slo_target_url not in db yet.
    settings_hash.merge!(idp_slo_target_url: "https://idp.socinst.com:8443/idp/profile/SAML2/POST/SSO")

    logger.debug "Admin.Account.Settings sending override hash: #{settings_hash}"
  	return settings_hash
	end
end
