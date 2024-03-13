//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Mihir Shingala on 13/03/24.
//

import SwiftUI

struct TicTacToeView: View {
    @StateObject var viewModel = TicTacToeViewModel()

    var body: some View {
        let borderSize = CGFloat(5)

        Text(viewModel.turnTextTitle)
            .font(.title)
            .bold()
            .padding()
        Spacer()

        Text("Crosses Scores: \(viewModel.noughtsScore)")
            .font(.title)
            .bold()
            .padding()

        VStack(spacing: borderSize) {
            ForEach(0 ... 2, id: \.self) { row in
                HStack(spacing: borderSize) {
                    ForEach(0 ... 2, id: \.self) {
                        column in

                        let cell = viewModel.board[row][column]

                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                viewModel.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(viewModel.alertMessage),
                dismissButton: .default(Text("Okay")) {
                    viewModel.resetBoard()
                }
            )
        }

        Text("Noughts Scores: \(viewModel.noughtsScore)")
            .font(.title)
            .bold()
            .padding()
        Spacer()
    }
}

#Preview {
    TicTacToeView()
}
