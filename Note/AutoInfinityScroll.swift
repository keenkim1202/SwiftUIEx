import SwiftUI
import Combine

struct ContentView: View {
    let banners: [Color] = [.red, .green, .blue]
    
    var body: some View {
        InfinityCarouselView(
            banners: banners
        )
    }
}

struct InfinityCarouselView: View {
    let timer = Timer.publish(every: 2, on: .main, in: .common)
    @State var timerCancellable: AnyCancellable?
    let banners: [Color]
    
    @State private var currentPageIndex: Int = 0
    @State private var fakedPages: [Color]
    
    init(banners: [Color]) {
        self.banners = banners
        // for infinity scroll
        _fakedPages = State(initialValue: [banners.last!] + banners + [banners.first!])
    }
    
    var body: some View {
        VStack(spacing: 8) {
            carouselView
                .frame(height: 166)
            IndexDotView(count: banners.count, selectedIndex: (currentPageIndex - 1 + banners.count) % banners.count)
                .frame(height: 10)
        }
    }
    
    var carouselView: some View {
        GeometryReader { geometry in
            TabView(selection: $currentPageIndex) {
                ForEach(fakedPages.indices, id: \.self) { index in
                    fakedPages[index]
                        .tag(index)
                        .frame(width: geometry.size.width, height: 166)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: geometry.size.width)
            .onAppear {
                currentPageIndex = 1
            }
        }
        .onChange(of: currentPageIndex) { index in
            checkForInfiniteScroll()
            startAutoScroll()
        }
    }
    
    private func startAutoScroll() {
        timerCancellable?.cancel()
        timerCancellable = timer.autoconnect().sink { _ in
            withAnimation(.easeInOut) {
                currentPageIndex = (currentPageIndex + 1) % fakedPages.count
                checkForInfiniteScroll()
            }
        }
    }
    
    private func checkForInfiniteScroll() {
        /// Last fake page -> First fake page
        if currentPageIndex == fakedPages.count - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                /// Set current index as real first page.
                currentPageIndex = 1
            }
            /// First fake page -> Last fake page
        } else if currentPageIndex == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                /// Set current index as real last page.
                currentPageIndex = fakedPages.count - 2
            }
        }
    }
    
    private struct IndexDotView: View {
        var count: Int
        var selectedIndex: Int
        
        var body: some View {
            HStack(spacing: 8) {
                ForEach(0..<count, id: \.self) { index in
                    Capsule()
                        .frame(width: 8, height: 2)
                        .foregroundStyle(index == selectedIndex ? Color.white : Color.gray)
                }
            }
        }
    }
}
