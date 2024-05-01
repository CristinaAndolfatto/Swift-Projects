//
//  WebView.swift
//  HackerNews
//
//  Created by Cristina Andolfatto on 01/05/24.
//

import Foundation
import WebKit
import SwiftUI

// define a webview structure
struct WebView : UIViewRepresentable {
    
    // add the url property
    let urlString : String?
    
    //when we make this view, it will try to convert the view in a SwiftUIview
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // initialize the webview with the url string passed
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // if there is an urlString
        if let safeString = urlString {
            // if there is the safeString, try create the url object
            if let url = URL(string: safeString) {
                // request for the url
                let request = URLRequest(url: url)
                uiView.load(request)
                
            }
        }
    }
    
}
