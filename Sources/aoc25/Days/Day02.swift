/// Vector space rotations
final class Day02: Day {
  func part1(input: String) throws -> Int {
    var total = 0
    for line in input.split(separator: ",") {
      let bounds = line.split(separator: "-", maxSplits: 1)
      guard let minBound = Int(bounds[0]), let maxBound = Int(bounds[1]) else {
        throw DayError.NotImplemented
      }
      for i in minBound...maxBound {
        if isRepeated(input: i) {
          total += i
        }
      }
    }
    return total
  }

  func isRepeated(input: Int) -> Bool {
    let strInput = String(input)
    guard strInput.count % 2 == 0 else {
      return false
    }
    return strInput.hasSuffix(strInput.prefix(strInput.count / 2))
  }

  func part2(input: String) throws -> Int {
    var total = 0
    for line in input.split(separator: ",") {
      let bounds = line.split(separator: "-", maxSplits: 1)
      guard let minBound = Int(bounds[0]), let maxBound = Int(bounds[1]) else {
        throw DayError.NotImplemented
      }
      for i in minBound...maxBound {
        let stri = String(i)
        if "\(stri.dropFirst())\(stri.dropLast())".contains(stri) {
          total += i
        }
      }
    }
    return total
  }
}
