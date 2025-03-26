//
//  RedesSocialesApp.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 24/03/25.
//

import SwiftUI

@main
struct RedesSocialesApp: App {
    @State var controlador = ControladorAplicacion()
    
    var body: some Scene {
        WindowGroup {
            GeneralPublicaciones()
                .environment(controlador)
        }
    }
}
