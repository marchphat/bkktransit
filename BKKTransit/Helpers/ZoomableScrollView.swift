//
//  ZoomableScrollView.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 31/3/2567 BE.
//

import SwiftUI

struct ZoomableScrollView<Content: View>: UIViewRepresentable {
    private var content: Content
    private var minZoomScale: CGFloat = 1.0
    private var maxZoomScale: CGFloat = 2.0
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        //MARK: - set up the UIScrollView
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.maximumZoomScale = maxZoomScale
        scrollView.minimumZoomScale = minZoomScale
        scrollView.bouncesZoom = true
        
        //MARK: - create a UIHostingController to hold our SwiftUI content
        let hostedView = context.coordinator.hostingController.view!
        hostedView.translatesAutoresizingMaskIntoConstraints = true
        hostedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostedView.frame = scrollView.bounds
        scrollView.addSubview(hostedView)
            
        DispatchQueue.main.async {
            scrollView.zoomScale = 1.0
        }
        
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(hostingController: UIHostingController(rootView: self.content))
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        context.coordinator.hostingController.rootView = self.content
        assert(context.coordinator.hostingController.view.superview == uiView)
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject, UIScrollViewDelegate {
        var hostingController: UIHostingController<Content>
        
        init(hostingController: UIHostingController<Content>) {
            self.hostingController = hostingController
        }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return hostingController.view
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            updateZoomedContentSize(for: scrollView)
            centerContentIfNeeded(in: scrollView)
        }
        
        private func updateZoomedContentSize(for scrollView: UIScrollView) {
            guard let hostedView = scrollView.subviews.first else { return }
            
            let width = max(hostedView.frame.width * scrollView.zoomScale, scrollView.bounds.width)
            let height = max(hostedView.frame.height * scrollView.zoomScale, scrollView.bounds.height)
            
            scrollView.contentSize = CGSize(width: width, height: height)
        }
        
        private func centerContentIfNeeded(in scrollView: UIScrollView) {
            let xOffset = max((scrollView.contentSize.width - scrollView.bounds.width) / 2, 0)
            let yOffset = max((scrollView.contentSize.height - scrollView.bounds.height) / 2, 0)
            scrollView.contentInset = UIEdgeInsets(top: yOffset, left: xOffset, bottom: 0, right: 0)
        }
    }
}

