module QME
  module Randomizer
    # A Resque job that allows for generation of randomized patients by a Resque worker. Can be created as follows:
    #
    #    QME::Randomizer::PatientRandomizationJob.create(:template_dir => '/xx/yy', :count => 100, [:test_id => ObjectId])
    #
    # This will return a uuid which can be used to check in on the status of a job. More details on this can be found
    # at the {Resque Stats project page}[https://github.com/quirkey/resque-status].
    #
    class PatientRandomizationJob < Resque::JobWithStatus
      def perform
        test_id = options['test_id'] ? BSON::ObjectId(options['test_id']) : nil
        template_dir = options['template_dir']
        count = options['count']

        tick('Reading templates')
        templates = []
        Dir.glob(File.join(template_dir, '*.json.erb')).each do |file|
          templates << File.read(file)
        end

        tick('Initializing parser')
        processed_measures = {}
        QME::QualityMeasure.all.each_value do |measure_def|
          measure_id = measure_def['id']
          if !processed_measures[measure_id]
            QME::Importer::PatientImporter.instance.add_measure(measure_id, QME::Importer::GenericImporter.new(measure_def))
            processed_measures[measure_id]=true
          end
        end

        loader = QME::Database::Loader.new()
        tick('Generating patients')
        count.times do |i|
          at(i, count, "Generating patient #{i} of #{count}")
          template = templates[rand(templates.length)]
          generator = QME::Randomizer::Patient.new(template)
          json = JSON.parse(generator.get())
          patient_record_hash = QME::Importer::PatientImporter.instance.parse_hash(json)
          patient_record_hash['test_id'] = test_id
          loader.save('records', patient_record_hash)
        end

        completed
      end
    end
  end
end