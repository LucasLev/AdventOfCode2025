/// HAHA I HAD A STANDARD DATASTRUCTURE TODAY
final class Day05: Day {
  func part1(input: String) throws -> Int {
    guard let separatorRange = input.firstRange(of: "\n\n") else {
      throw DayError.ParsingError
    }

    let ranges = try input[..<separatorRange.lowerBound].split(separator: "\n").map {
      line -> (Int, Int) in

      guard let separatorIndex = line.firstIndex(of: "-") else {
        throw DayError.ParsingError
      }

      guard let start = Int(line[..<separatorIndex]),
        let end = Int(
          line[line.index(after: separatorIndex)...]
        )
      else {
        throw DayError.ParsingError
      }

      return (start, end)
    }

    let ids = try input[separatorRange.upperBound...].split(separator: "\n").map { line -> Int in
      guard let id = Int(line) else {
        throw DayError.ParsingError
      }
      return id
    }

    let rangeSet = RangeSet<Int>(ranges.map { $0.0..<($0.1 + 1) })
    return ids.count(where: { rangeSet.contains($0) })
  }

  func part2(input: String) throws -> Int {
    guard let separatorRange = input.firstRange(of: "\n\n") else {
      throw DayError.ParsingError
    }

    let ranges = try input[..<separatorRange.lowerBound].split(separator: "\n").map {
      line -> (Int, Int) in

      guard let separatorIndex = line.firstIndex(of: "-") else {
        throw DayError.ParsingError
      }

      guard let start = Int(line[..<separatorIndex]),
        let end = Int(
          line[line.index(after: separatorIndex)...]
        )
      else {
        throw DayError.ParsingError
      }

      return (start, end)
    }

    let rangeSet = RangeSet<Int>(ranges.map { $0.0..<($0.1 + 1) })
    return rangeSet.ranges.map { $0.count }.reduce(0, +)
  }
}
