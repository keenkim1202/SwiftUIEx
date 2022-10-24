//
//  HalfSheetView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/21.
//

import SwiftUI

// struct HalfSheetView: View {
//     var body: some View {
//         HalfSheet {
//                 Color.yellow
//                 Text("half sheet view test")
//         }
//     }
// }

struct HalfSheet<Content: View>: View {
    @State var showSheet: Bool = false
    var content: Content
    
    init(_ content: Content) {
        self.content = content
    }
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            Button {
                showSheet.toggle()
            } label: {
                Text("present sheet")
            }
            .navigationTitle("Half Modal Sheet")
            .halfSheet(showSheet: $showSheet) {
                ZStack {
                    // custom half sheet ui here.
                    content
                }
            }
        }
    }
}

extension View {
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping () -> SheetView) -> some View {
        return self.background(HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet))
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    @Binding var showSheet: Bool
    
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if showSheet {
            let sheetController = HalfHostingController(rootView: sheetView)
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

struct HalfSheetView_Previews: PreviewProvider {
    static var previews: some View {
        // HalfSheetView()
        HalfSheet {
            VStack {
                Text("hi 1")
                Text("hi 2")
                Text("hi 3")
                Text("hi 4")
                Text("hi 5")
                Text("hi 6")
                // Divider()
                // Text("hi 7")
                // Divider()
                // Text("hi 8")
                // Divider()
                // Text("hi 9")
            }
        }
    }
}

class HalfHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
            presentationController.prefersGrabberVisible = true
        }
    }
}
