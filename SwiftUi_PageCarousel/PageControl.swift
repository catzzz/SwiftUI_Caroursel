//
//  PageControl.swift
//  SwiftUi_PageCarousel
//
//  Created by Jimmy Leu on 2020/6/13.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import Foundation

import SwiftUI

struct PageControl : UIViewRepresentable {
    @Binding var page: Int
    
    func makeUIView(context:Context) -> UIPageControl {
        
        let view = UIPageControl()
        
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        // Update view
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}
