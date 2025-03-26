//
//  RedesSocialesApp.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 24/03/25.
//

import SwiftUI

@main
struct RedesSocialesApp: App {
    @State var controlador_global = ContorladorGlobal()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.environment(controlador_global)
    }
}
