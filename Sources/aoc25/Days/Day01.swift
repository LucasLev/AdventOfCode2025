/// A day of painful learning about what the modulo of a negative number can be.
final class Day01: Day {
  func part1(input: String) throws -> Int {
    var tot = 0
    var currentPose = 50
    for line in input.split(separator: "\n") {
      currentPose += findOffset(line: String(line))
      if currentPose % 100 == 0 {
        tot += 1
      }
      // making sure we are in the positive position
      currentPose = (currentPose + 100) % 100
    }
    return tot
  }

  private func findOffset(line: String) -> Int {
    guard let rotation = line.first, let distance = Int(line.dropFirst()) else {
      return 0
    }

    switch rotation {
    case "L":
      return -distance
    case "R":
      return +distance
    default:
      return 0
    }
  }

  func part2(input: String) throws -> Int {
    var tot = 0
    var currentPose = 50
    for line in input.split(separator: "\n") {
      let offset = findOffset(line: String(line))
      let (fullCircles, remainder) = offset.quotientAndRemainder(dividingBy: 100)
      let destination = currentPose + remainder
      if remainder > 0 && destination >= 100 {
        tot += 1
      } else if destination <= 0 && currentPose != 0 {
        tot += 1
      }
      currentPose = ((destination + 100) % 100)
      tot += abs(fullCircles)
    }
    return tot
  }
}
