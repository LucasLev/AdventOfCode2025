protocol Day: Sendable {
  static func part1(input: [String]) throws -> Int
  static func part2(input: [String]) throws -> Int
}

enum DayError: Error {
  case NotImplemented
}

extension Day {
  static func part1(input: [String]) throws -> Int {
    throw DayError.NotImplemented
  }

  static func part2(input: [String]) throws -> Int {
    throw DayError.NotImplemented
  }
}

struct EmptyDay: Day {
}

let allDays: InlineArray<12, Day.Type> = [
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
  EmptyDay.self,
]
