module ProviderImportUtils
  
  def extract_provider(performer)
    provider_data = extract_provider_data(performer, false)
    find_or_create_provider(provider_data)
  end
  
  def find_or_create_provider(provider_hash)
    provider = Provider.first(conditions: {npi: provider_hash[:npi]}) if provider_hash[:npi] && !provider_hash[:npi].empty?
    provider ||= Provider.create(provider_hash)
  end
  
  def extract_date(subject,query)
    date = extract_data(subject,query)
    date ? Date.parse(date).to_time.to_i : nil
  end

  # Returns nil if result is an empty string, block allows text munging of result if there is one
  def extract_data(subject, query)
    result = subject.at_xpath(query).content
    if result == ""
      nil
    else
      result
    end
  end
  
end