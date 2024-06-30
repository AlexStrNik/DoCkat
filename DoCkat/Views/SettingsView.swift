//
//  ContentView.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 28.06.2024.
//

import SwiftUI
import ServiceManagement
import Combine

struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag("general")
            AppearanceSettingsView()
                .tabItem {
                    Label("Appearance", systemImage: "pencil.and.scribble")
                }
                .tag("appearance")
            AboutSettingsView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
                .tag("about")
        }
        .padding(20)
        .frame(width: 375, height: 150)
    }
}

struct GeneralSettingsView: View {
    @AppStorage("launchAtLogin") private var launchAtLogin = false

    var body: some View {
        Form {
            Toggle("Launch at login", isOn: $launchAtLogin)
                .onChange(of: launchAtLogin) { _, newValue in
                    if newValue {
                        try? SMAppService.mainApp.register()
                    } else {
                        try? SMAppService.mainApp.unregister()
                    }
                }
            
            Button(action: {
                NSWorkspace.shared.open(
                    URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!
                )
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                    NSWorkspace.shared.open(
                        URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!
                    )
                }
            }){
                Text("Grant Accessibility Priveleges to Dock")
            }
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

struct AppearanceSettingsView: View {
    @AppStorage("eyeColor") private var eyeColor: Color = .yellow
    @AppStorage("catColor") private var catColor: Color = Color(red: 0.455, green: 0.455, blue: 0.455)

    var body: some View {
        Form {
            ColorPicker("Eye Color", selection: $eyeColor, supportsOpacity: false)
            
            ColorPicker("Fur Color", selection: $catColor, supportsOpacity: false)
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

struct AboutSettingsView: View {
    @State var blinkState: CGFloat = 0
    
    private var framePublisher: AnyPublisher<CGFloat, Never> {
        frameSubject.eraseToAnyPublisher()
    }
    private let frameSubject = PassthroughSubject<CGFloat, Never>()
    
    var displayLink: CVDisplayLink = {
        var dl: CVDisplayLink? = nil
        CVDisplayLinkCreateWithActiveCGDisplays(&dl)
        return dl!
    }()
    
    var body: some View {
        VStack {
            Spacer()

            CatView(
                eyeVector: .zero,
                blinkState: blinkState
            )
            .onReceive(framePublisher) { frame in
                blinkState += frame
            }
            .onAppear {
                CVDisplayLinkSetOutputHandler(displayLink) { displayLink, inNow, inOutputTime, flageIn, flagsOut in
                    let duration = inOutputTime.pointee.timeInterval - inNow.pointee.timeInterval
                    
                    DispatchQueue.main.async {
                        self.frameSubject.send(duration)
                    }
                    return kCVReturnSuccess
                }
                
                CVDisplayLinkStart(displayLink)
            }
            .frame(
                width: 128,
                height: 128
            )
            
            Text(
                "DoCkat v\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)"
            )
            .font(.title2)
            .frame(maxWidth: .infinity)
            
            Spacer()
                .frame(height: 8)
            
            Button(action: {
                NSWorkspace.shared.open(
                    URL(string: "https://github.com/AlexStrNik/DoCkat/")!
                )
            }) {
                Text("https://github.com/AlexStrNik/DoCkat/")
            }
            .buttonStyle(.link)
            
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
