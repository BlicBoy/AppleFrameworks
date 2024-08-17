//
//  FramewirkDetailView.swift
//  Apple-Frameworks
//
//  Created by Gonçalo Oliveira on 14/08/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework : Framework
    @State private var isShowingSafariView = false;
    var body: some View {
        VStack {
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
               // AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.red)
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
