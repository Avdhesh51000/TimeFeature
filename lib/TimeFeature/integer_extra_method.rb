module TimeFeature
  def to_time
    format("%02d:%02d:%02d", self / (60 * 60), (self / 60) % 60, self % 60)
    #                                             hours,         minutes,         seconds
  end
end
