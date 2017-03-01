class ExportMoviesJob < ActiveJob::Base
  queue_as :exports

  def perform(current_user)
    file_path = 'tmp/movies.csv'

    if current_user
      MovieExporter.new.call(current_user, file_path)
    else
      # handle a deleted user record
    end
  end
end
