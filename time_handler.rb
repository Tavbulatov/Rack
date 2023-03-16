class TimeHandler
  FORMAT = { day: '%d', month: '-%m',
             year: '-%Y', hour: ' %H',
             minute: ':%M', second: ':%S' }

  attr_reader :status

  def initialize(request, path_info)
    @path_info = path_info
    @request = request['format']&.split(',')
    @ripe_format_time = []
    @requested_format = []
    @unknown_format = []
    @status = 0
    processing_request
    result
  end

  def processing_request
    return if @request.nil?

    @request.each do |format|
      if FORMAT[format.to_sym]
        @requested_format << FORMAT[format.to_sym]
      else
        @unknown_format << format
      end
    end

    @requested_format.each { |format| @ripe_format_time[FORMAT.values.index(format)] = format }
  end

  def result
    if @path_info == '/time' && @unknown_format.empty?
      @status = 200
      time_now
    else
      @status = 400
      return "Unknown time format #{@unknown_format}" unless @unknown_format.empty?
      return 'Not found' unless @path_info == '/time'
    end
  end

  def time_now
    Time.now.strftime(@ripe_format_time.join)
  end
end