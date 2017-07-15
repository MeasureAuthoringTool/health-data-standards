module HQMF2CQL
  # Represents a data criteria specification
  class DataCriteria < HQMF2::DataCriteria
    include HQMF2CQL::DataCriteriaPostProcessing, HQMF2CQL::DataCriteriaTypeAndDefinitionExtraction
  end
end
