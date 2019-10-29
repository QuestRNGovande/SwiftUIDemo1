//
//  MainView.swift
//  SwiftUIDemo1
//
//  Created by Ratnadeep Govande on 8/21/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import SwiftUI
import Combine

struct MainView: View {
    @ObservedObject var moviesviewModel =  MoviesViewModel()
    @State var isLoading = true
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading){
                    UpcommingMovieView(moviesviewModel: self.moviesviewModel)
                    Text("Play Now")
                        .font(.custom("TimesNewRomanPS-BoldMT", size: 20.0))
                        .padding(.leading, 10)
                    
                    List {
                        ForEach(self.moviesviewModel.moviesData!) { movie in
                            NavigationLink(destination: MovieDetailsView(movieDetails: movie)
                            ) {
                                VerticalMovieView(movie: movie)
                                    .shadow(color: Color.gray.opacity(0.5), radius: 10.0, x: 2, y: 2)
                                    .background(Color.white.opacity(0.2))
                            }
                        }
                    }
                    
                }
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .navigationBarHidden(true)
                .navigationBarTitle(Text(self.moviesviewModel.username))
                
                
                if self.moviesviewModel.dataLoad {
                    VStack {
                        ActivityIndicator(isAnimating: .constant(true), style: .large)
                        Text("Loading...")
                            .font(.custom("TimesNewRomanPS-BoldMT", size: 14.0))
                    }
                    .frame(width: 120, height: 120, alignment: .center)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                }
                
            }
        }
    }
    
    init() {
        //        loadRequest()
    }
    //    func loadRequest(){
    //        let url = URL(string: "https://talk.objc.io/collections.json")
    //        let episodeResource = Resource<AnyObject> (url: url!) { (data) -> Data? in
    //
    //
    //            let json = try? JSONSerialization.jsonObject(with: data, options: [])
    //            return json
    //        }
    //
    //        Webservice().load(resource: episodeResource) { (result) in
    //            print(result)
    //        }
    //    }
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    //    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                //                self.content()
                //                    .disabled(self.isShowing)
                //                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
    
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
