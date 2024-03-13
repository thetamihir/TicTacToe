//
//  TicTacToeModel.swift
//  TicTacToe
//
//  Created by Mihir Shingala on 13/03/24.
//

import Foundation
import SwiftUI

enum Tile {
    case O
    case X
    case empty
}

struct Cell: Equatable {
    var tile: Tile

    func displayTile() -> String {
        switch tile {
        case Tile.O:
            return "O"
        case Tile.X:
            return "X"
        default:
            return ""
        }
    }

    func tileColor() -> Color {
        switch tile {
        case Tile.O:
            return Color.red
        case Tile.X:
            return Color.black
        default:
            return Color.black
        }
    }
}
