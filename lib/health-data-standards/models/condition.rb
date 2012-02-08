class Condition < Entry
  field :diagnosisPriority,   type: Integer
  field :problemDate,         type: Date
  field :problemType,         type: ???
  field :problemName,         type: String
  field :problemCode,         type: ???
  field :ageAtOnset,          type: Integer
  field :causeOfDeath,        type: Hash
  field :problemStatus,       type: ???
  
  embeds_many :treatingProvider,  class_name: "TreatingProvider"
  embeds_many :comment,           class_name: "Comment"

  alias   :diagnosis_priority     :diagnosisPriority
  alias   :diagnosis_priority=    :diagnosisPriority=
  alias   :problem_date           :problemDate
  alias   :problem_date=          :problemDate=
  alias   :problem_type           :problemType
  alias   :problem_type=          :problemType=
  alias   :problem_name           :problemName
  alias   :problem_name=          :problemName=
  alias   :problem_code           :problemCode
  alias   :problem_code=          :problemCode=
  alias   :age_at_onset           :ageAtOnset
  alias   :age_at_onset=          :ageAtOnset=
  alias   :cause_of_death         :causeOfDeath
  alias   :cause_of_death=        :causeOfDeath=
  alias   :problem_status         :problemStatus
  alias   :problem_status=        :problemStatus=
end