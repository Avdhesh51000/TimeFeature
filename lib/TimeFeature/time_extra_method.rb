module TimeFeature
  def to_second
    # 86399-(self.seconds_until_end_of_day)
    self.hour*3600 + self.min*60 + self.sec
  end
end
