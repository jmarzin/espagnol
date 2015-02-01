class String
  def accents_espagnols!
    self.gsub!('à','á')
    self.gsub!('è','é')
    self.gsub!('ì','í')
    self.gsub!('ò','ó')
    self.gsub!('ù','ú')
    return self
  end
end