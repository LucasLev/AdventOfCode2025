extension String {
  func toIntArray() throws -> [Int] {
    return try self.map {
      guard let intValue = $0.wholeNumberValue else {
        throw DayError.ParsingError
      }
      return intValue
    }
  }
}

extension Substring {
  func toIntArray() throws -> [Int] {
    return try self.map {
      guard let intValue = $0.wholeNumberValue else {
        throw DayError.ParsingError
      }
      return intValue
    }
  }
}
