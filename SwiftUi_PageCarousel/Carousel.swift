//
//  Carousel.swift
//  SwiftUi_PageCarousel
//
//  Created by Jimmy Leu on 2020/6/13.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import Foundation
import SwiftUI

struct Carsousel: UIViewRepresentable {

    func makeCoordinator() -> Carsousel.Coordinator {
        
        return Carsousel.Coordinator(parent1: self)
    }
    
    var width: CGFloat
    @Binding var page: Int
    var height :CGFloat

    
    func makeUIView(context: Context) -> UIScrollView {
        
        let total = width * CGFloat(data.count)
        
        let view = UIScrollView()
        view.isPagingEnabled = true
        // 1.0 for disabling vertical scroll
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        // Embedded swiftUI view into UIview
        
        let view1 = UIHostingController(rootView: List(page: self.$page))
        
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height:self.height)
        
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator: NSObject,UIScrollViewDelegate {
        
        var parent: Carsousel
        
        init(parent1:Carsousel) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            // Using this function to get current page
            
            let page = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
            
            self.parent.page = page
            
            
        }
    }
    
}
