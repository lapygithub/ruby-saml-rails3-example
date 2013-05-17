class Admin::Account < ActiveRecord::Base
  belongs_to :setting
  accepts_nested_attributes_for :setting
  
  # Internal getter for other controllers.  If host is not given
  # look it up using the request
  def self.get_saml_settings(host)
    # Grab the ActiveRecord Setting object from the Account
    acct = Admin::Account.find(:all, :conditions => { :host => host } ).first
    return nil if acct == nil
    setting_AR = acct.setting

    # Create a new Onelogin version of the similarly defined settings class
    overrides = setting_AR.get_hash_of_overrides
    setting_SAML = Onelogin::Saml::Settings.new (overrides)  # Initialize with the new method

    # return the Onelogin version of the Settings object
    return setting_SAML
  end   
end
