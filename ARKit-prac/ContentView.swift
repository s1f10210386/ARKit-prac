//
//  ContentView.swift
//  ARKit-prac
//
//  Created by 金澤帆高 on 2024/02/15.
//

//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = ARViewModel()
//
//    var body: some View {
//        VStack {
//            ARViewContainer(viewModel: viewModel)
//                .edgesIgnoringSafeArea(.all)
//
//            Button("Start AR Session") {
//                viewModel.startARSession()
//            }
//        }
//    }
//}

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ARViewModel()

    var body: some View {
        VStack {
            ARViewContainer(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)
            Button("Start AR Session") {
                viewModel.startARSession()
            }
        }
    }
}
