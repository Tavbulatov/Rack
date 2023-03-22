class TimeHandler
  FORMAT = { day: '%d', month: '-%m',
             year: '-%Y', hour: ' %H',
             minute: ':%M', second: ':%S' }

  attr_reader :unknown_format

  def initialize(request)
    @request = request['format']&.split(',')
    @ripe_format_time = []
    @unknown_format = []
    processing_request
  end

  def processing_request
    return if @request.nil?

    @request.each do |format|
      if FORMAT[format.to_sym]
        @ripe_format_time[FORMAT.values.index(FORMAT[format.to_sym])] = FORMAT[format.to_sym]
      else
        @unknown_format << format
      end
    end
  end

  def time_now
    Time.now.strftime(@ripe_format_time.join)
  end
end
