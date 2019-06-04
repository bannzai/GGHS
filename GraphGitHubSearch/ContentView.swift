//
//  ContentView.swift
//  GraphGitHubSearch
//
//  Created by Yutaro Muta on 2019/06/04.
//  Copyright © 2019 yutailang0119. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Button(action: {
            self.search()
        }) {
            Text(" Search")
        }
    }

    private func search() {
        let client = APIClient()
        let query = SearchRepositoryQuery(keyword: "Kaeru")
        client.execute(by: query) { result in
            switch result {
            case .success(let response):
                print(response)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
