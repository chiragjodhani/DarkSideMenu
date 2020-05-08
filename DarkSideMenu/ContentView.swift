//
//  ContentView.swift
//  DarkSideMenu
//
//  Created by Chirag's on 07/05/20.
//  Copyright © 2020 Chirag's. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    @State var dark = false
    @State var show = false
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { _ in
                VStack {
                    ZStack {
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    self.show.toggle()
                                }
                            }) {
                                Image("menu").resizable().frame(width: 25, height: 25)
                                
                            }
                            Spacer()
                        }
                        Text("Home")
                    }.padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3))
                    Spacer()
                    Text("Dark Mode Menu")
                    Spacer()
                }
            }
            HStack {
                Menu(dark: self.$dark, show: self.$show).preferredColorScheme(self.dark ? .dark : .light).offset(x: self.show ? 0 : -UIScreen.main.bounds.width / 1.5)
                Spacer(minLength: 0)
            }
            .background(Color.primary.opacity(self.show ? (self.dark ? 0.05 : 0.2) : 0).edgesIgnoringSafeArea(.all))
        }
    }
}

struct Menu: View {
    @Binding var dark:Bool
    @Binding var show: Bool
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.default) {
                        self.show.toggle()
                    }
                }) {
                    Image("back").resizable()
                        .frame(width: 20, height: 20)
                }
                Spacer()
                Button(action: {
            
                }) {
                    Image(systemName: "square.and.pencil").font(.title)
                }
            }.padding(.top).padding(.bottom, 25)
            Image("pic").resizable().frame(width: 80, height: 80).clipShape(Circle())
            VStack(spacing: 12) {
                Text("Cathetine")
                Text("Developer").font(.caption)
            }.padding(.top, 25)
            HStack(spacing: 22) {
                Image(systemName: "moon.fill")
                Text("Dark Mode")
                Spacer()
                Button(action: {
                    self.dark.toggle()
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                }) {
                    Image("off").resizable().frame(width: 40, height: 40).rotationEffect(.init(degrees: self.dark ? 180 : 0))
                }
            }.padding(.top, 25)
            
            Group {
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("story").resizable().frame(width: 20, height: 20).foregroundColor(.yellow)
                        Text("Story")
                        Spacer()
                    }
                }.padding(.top)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("chat").resizable().frame(width: 20, height: 20).foregroundColor(.pink)
                        Text("Chats")
                        Spacer()
                    }
                    
                }.padding(.top, 25)
                Divider().padding(.top, 25)
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("media").resizable().frame(width: 20, height: 20).foregroundColor(.purple)
                        Text("Media & Photos")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("settings").resizable().frame(width: 20, height: 20).foregroundColor(.green)
                        Text("Settings And Privacy")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("help").resizable().frame(width: 20, height: 20).foregroundColor(.green)
                        Text("Help Center")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("notification").resizable().frame(width: 20, height: 20).foregroundColor(.red)
                        Text("Notifications")
                        Spacer()
                    }
                }.padding(.top, 25)
            }
            Spacer()
        }.padding(.vertical, 25)
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background(self.dark ? Color.black : Color.white).edgesIgnoringSafeArea(.all)
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
    }
}
