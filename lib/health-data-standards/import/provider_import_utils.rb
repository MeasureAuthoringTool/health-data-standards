module ProviderImportUtils

  def extract_provider(performer, element_name="assignedEntity")
    provider_data = extract_provider_data(performer, false, "./cda:#{element_name}")
    find_or_create_provider(provider_data)
  end

  def find_or_create_provider(provider_hash, patient=nil)
    provider = Provider.by_npi(provider_hash[:npi]).first if provider_hash[:npi] && !provider_hash[:npi].empty?
    unless provider
      if provider_hash[:npi]
        provider = Provider.create(provider_hash)
        provider.npi = provider_hash[:npi]
      else
        ident_roots = provider_hash[:cda_identifiers].map {|ident| ident.root}
        ident_extensions = provider_hash[:cda_identifiers].map {|ident| ident.extension}
        unless ident_roots.size == 0
          provider ||= Provider.in("cda_identifiers.root" => ident_roots).and.in("cda_identifiers.extension" => ident_extensions).first
        end
        provider_query = {:title => provider_hash[:title],            
                            :given_name => provider_hash[:given_name],  
                            :family_name=> provider_hash[:family_name],
                            :specialty => provider_hash[:specialty]}
        provider ||= Provider.where(provider_query).first
        provider ||= Provider.resolve_provider(provider_hash, patient)
        provider ||= Provider.create(provider_hash)
      end
    end
    provider
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
