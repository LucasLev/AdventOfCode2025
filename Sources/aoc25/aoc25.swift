// The Swift Programming Language
// https://docs.swift.org/swift-book
import ArgumentParser

enum Parts: Int, ExpressibleByArgument {
  case all
  case part1
  case part2
}

@main
struct aoc25: ParsableCommand {
  @Argument(help: "Day to run (1-12).")
  public var day: Int
  @Option(help: "Part to run. 0 for all.")
  public var part: Parts = .all
  @Argument(
    help: "Path to the puzzle input to run the solution on. File is expected to be utf-8 encoded.")
  var inputFile: String

  func validate() throws {
    guard day >= 1 && day <= 12 else {
      throw ValidationError("The day should be a valid advent of code day (between 1 and 12)")
    }
  }

  func run() throws {
    guard let input = try? String(contentsOfFile: inputFile, encoding: .utf8) else {
      throw ValidationError("Couldn't find file \(inputFile)")
    }
    switch part {
    case .all:
      runPart1(input)
      runPart2(input)
    case .part1:
      runPart1(input)
    case .part2:
      runPart2(input)
    }
  }

  func runPart1(_ input: String) {
    do {
      let result = try allDays[day - 1].part1(input: input)
      print("Part 1: \(result)")
    } catch DayError.NotImplemented {
      print("Day \(day) has no solution yet for part 1")
    } catch {
      print("Unexpected Error: \(error)")
    }
  }

  func runPart2(_ input: String) {
    do {
      let result = try allDays[day - 1].part2(input: input)
      print("Part 2: \(result)")
    } catch DayError.NotImplemented {
      print("Day \(day) has no solution yet for part 2")
    } catch {
      print("Unexpected Error: \(error)")
    }
  }
}
