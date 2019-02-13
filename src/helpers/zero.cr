class Zero
  def self.fill(number : Int32)
    "00000"[0..-(number.to_s.size + 1)] + number.to_s
  end
end
