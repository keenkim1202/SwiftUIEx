//
//  ListExView.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/18.
//

import SwiftUI

struct ListExView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: DetailView()) {
                        ListCell(label: "section1 item1", iconName: "paperclip.circle.fill")
                    }
                } header: {
                    Text("Section1")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                }
                .textCase(nil)
                .listRowBackground(Color.red)
                
                Section {
                    ListCell(label: "section2 item1", iconName: "paperclip.circle.fill")
                    ListCell(label: "section2 item2", iconName: "paperclip.circle.fill")
                } header: {
                    Text("Section2")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                }
                .listRowBackground(Color.green)
                
                Section {
                    ListCell(label: "section3 item1", iconName: "paperclip.circle.fill")
                    ListCell(label: "section3 item2", iconName: "paperclip.circle.fill")
                } header: {
                    Text("Section3")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                }
                
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle("title 1")
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("hello")
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail view")
        }
    }
}

struct ListCell: View {
    var label: String
    var iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(label)
            Spacer()
        }
    }
}

struct ListExView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
    
    struct DemoView: View {
        @State private var isShowList = false
        
        var body: some View {
            VStack {
                Button {
                    isShowList = true
                } label: {
                    Text("Show List")
                }
                .sheet(isPresented: $isShowList) {
                    ListExView()
                }
            }
        }
    }
}
