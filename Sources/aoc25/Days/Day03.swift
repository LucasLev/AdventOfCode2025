import Algorithms

/// Arrays are much nicer to manipulate than Strings
final class Day03: Day {
  func part1(input: String) throws -> Int {
    try input.split(separator: "\n").map { joltage(for: try $0.toIntArray(), batteryRequireds: 2) }
      .reduce(0, +)
  }

  func joltage(for pack: [Int], batteryRequireds n: Int) -> Int {
    var joltageComponent: [Int] = .init(repeating: 0, count: n)
    for window in pack.windows(ofCount: n) {
      for (i, digit) in window.enumerated() {
        if joltageComponent[i] < digit {
          joltageComponent[i] = digit
          // Reset all following numbers
          joltageComponent[(i + 1)...] = .init(repeating: 0, count: joltageComponent.count - i - 1)
        }
      }
    }
    return joltageComponent.reduce(0) { $0 * 10 + $1 }
  }

  func part2(input: String) throws -> Int {
    try input.split(separator: "\n").map { joltage(for: try $0.toIntArray(), batteryRequireds: 12) }
      .reduce(0, +)
  }
}
