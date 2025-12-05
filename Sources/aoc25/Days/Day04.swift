/// Should have used a set, but learning about ArraySlices was nice
final class Day04: Day {
  func part1(input: String) throws -> Int {
    let arr = Array(input.split(separator: "\n").map { Array($0) })
    return try markMovableRolls(matrix: arr).reduce(0) { (runningTotal, row) in
      row.filter { $0 == "x" }.count + runningTotal
    }
  }

  func part2(input: String) throws -> Int {
    var arr = Array(input.split(separator: "\n").map { Array($0) })
    var countX: Int = 0
    var oldCountX: Int
    repeat {
      oldCountX = countX
      arr = try markMovableRolls(matrix: arr)
      countX = arr.reduce(0) { (runningTotal, row) in
        row.filter { $0 == "x" }.count + runningTotal
      }
    } while countX != oldCountX
    return countX
  }

  func get3x3Slice<T>(matrix: [[T]], centerRow: Int, centerCol: Int) throws -> [ArraySlice<T>] {

    let totalRows = matrix.count
    guard totalRows > 0 else {
      throw DayError.ParsingError
    }
    let totalCols = matrix[0].count
    guard totalCols > 0 else {
      throw DayError.ParsingError
    }

    let startRow = max(0, centerRow - 1)
    let endRow = min(totalRows - 1, centerRow + 1)

    let startCol = max(0, centerCol - 1)
    let endCol = min(totalCols - 1, centerCol + 1)

    return matrix.prefix(through: endRow).suffix(from: startRow).map {
      $0.prefix(through: endCol).suffix(from: startCol)
    }
  }

  /// Marks movable rolls with 'x'
  /// - Parameter matrix: The current state of the workshop
  /// - Throws: DayError.ParsingError if the input is unexpected
  /// - Returns: A 2D array with the same dimension has `matrix` with movable rolls replaced by 'x'
  func markMovableRolls(matrix: [[Character]]) throws -> [[Character]] {
    var resultMatrix = matrix
    for i in 0..<matrix.count {
      for j in 0..<matrix[0].count {
        if matrix[i][j] == "@" {
          let neighbors = try get3x3Slice(matrix: matrix, centerRow: i, centerCol: j).reduce(0) {
            (runningTotal, row) in
            row.filter { $0 == "@" }.count + runningTotal
          }
          // <= because we have to account for the roll being looked at
          if neighbors <= 4 {
            resultMatrix[i][j] = "x"
          }
        }
      }
    }
    return resultMatrix
  }
}
