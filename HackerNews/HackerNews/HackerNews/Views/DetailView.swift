//
//  DetailView.swift
//  HackerNews
//
//  Created by Cristina Andolfatto on 01/05/24.
//

import SwiftUI
import WebKit

struct DetailView: View {
    // this is the url of the clicked element of the list
    let url : String?
    
    var body: some View {
        // here we add our webview
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}


