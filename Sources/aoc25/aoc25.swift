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
  @Argument(help: "Part to run. 0 for all.")
  public var part: Parts = .all

  func validate() throws {
    guard day >= 1 && day <= 12 else {
      throw ValidationError("The day should be a valid advent of code day (between 1 and 12)")
    }
  }

  func run() {
    switch part {
    case .all:
      runPart1()
      runPart2()
    case .part1:
      runPart1()
    case .part2:
      runPart2()
    }
  }

  func runPart1() {
    do {
      let result = try allDays[day - 1].part1(input: [""])
      print("Part 1: \(result)")
    } catch DayError.NotImplemented {
      print("This day (\(day)) has no solution yet for part 1")
    } catch {
      print("Unexpecte Error: \(error)")
    }
  }

  func runPart2() {
    do {
      let result = try allDays[day - 1].part2(input: [""])
      print("Part 2: \(result)")
    } catch DayError.NotImplemented {
      print("This day (\(day)) has no solution yet for part 2")
    } catch {
      print("Unexpecte Error: \(error)")
    }
  }
}
