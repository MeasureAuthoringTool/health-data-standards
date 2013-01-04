module ProviderImportUtils
  
  def extract_provider(performer, element_name="assignedEntity")
    provider_data = extract_provider_data(performer, false, "./cda:#{element_name}")
    find_or_create_provider(provider_data)
  end
  
  def find_or_create_provider(provider_hash)
    provider = Provider.where(npi: provider_hash[:npi]).first if provider_hash[:npi] && !provider_hash[:npi].empty?
    provider ||= Provider.create(provider_hash)
  end

  # Returns nil if result is an empty string, block allows text munging of result if there is one
  def extract_data(subject, query)
    result = subject.at_xpath(query)
    if result.nil? || result.content.empty?
      nil
    else
      result.content
    end
  end
  
end