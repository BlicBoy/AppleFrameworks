//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Gonçalo Oliveira on 14/08/2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
  
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks, id: \.id) { framework in
                        NavigationLink(value:framework) {
                            FrameworkTitleView(framework: framework)
                        }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .navigationDestination(for: Framework.self) { framework in
                    FrameworkDetailView(framework: framework)
                }
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}



