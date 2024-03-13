//
//  TicTacToeViewModel.swift
//  TicTacToe
//
//  Created by Mihir Shingala on 13/03/24.
//

import Foundation

class TicTacToeViewModel: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.X
    @Published var noughtsScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage: String = ""

    init() {
        resetBoard()
    }

    var turnTextTitle: String {
        return turn == Tile.X ? "Turn: X" : "Turn: O"
    }

    func placeTile(_ row: Int, _ column: Int) {
        if board[row][column].tile != Tile.empty {
            return
        }

        board[row][column].tile = turn == Tile.X ? Tile.X : Tile.O

        if checkForWin() {
            if turn == Tile.X {
                crossesScore += 1
            } else {
                noughtsScore += 1
            }
            let winner = turn == Tile.X ? "Crosses" : "Noughts"
            alertMessage = "Match Winner is: " + winner
            showAlert = true
        } else {
            turn = turn == Tile.X ? Tile.O : Tile.X
        }

        if checkForDraw() {
            alertMessage = "Match is Draw"
            showAlert = true
        }
    }

    func checkForDraw() -> Bool {
        for row in board {
            for cell in row {
                if cell.tile == Tile.empty {
                    return false
                }
            }
        }

        return true
    }

    func checkForWin() -> Bool {
        if isWinInRow() || isWinInColumn() || isWinInDiagonal() {
            return true
        } else {
            return false
        }
    }

    func isWinInRow() -> Bool {
        for row in 0 ..< 3 {
            if board[row][0].tile != .empty && board[row][0] == board[row][1] && board[row][1] == board[row][2] {
                return true
            }
        }
        return false
    }

    func isWinInColumn() -> Bool {
        for col in 0 ..< 3 {
            if board[0][col].tile != .empty && board[0][col] == board[1][col] && board[1][col] == board[2][col] {
                return true
            }
        }
        return false
    }

    func isWinInDiagonal() -> Bool {
        if board[0][0].tile != .empty && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            return true
        }

        if board[0][2].tile != .empty && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
            return true
        }

        return false
    }

    func resetBoard() {
        var newBoard = [[Cell]]()

        for _ in 0 ... 2 {
            var row = [Cell]()
            for _ in 0 ... 2 {
                row.append(Cell(tile: Tile.empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
