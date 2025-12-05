protocol Day: Sendable {
  func part1(input: String) throws -> Int
  func part2(input: String) throws -> Int
}

enum DayError: Error {
  case NotImplemented
  case ParsingError
}

extension Day {
  func part1(input: String) throws -> Int {
    throw DayError.NotImplemented
  }

  func part2(input: String) throws -> Int {
    throw DayError.NotImplemented
  }
}

struct EmptyDay: Day {
}

let allDays: InlineArray<12, Day> = [
  Day01(),
  Day02(),
  Day03(),
  Day04(),
  Day05(),
  EmptyDay(),
  EmptyDay(),
  EmptyDay(),
  EmptyDay(),
  EmptyDay(),
  EmptyDay(),
  EmptyDay(),
]
