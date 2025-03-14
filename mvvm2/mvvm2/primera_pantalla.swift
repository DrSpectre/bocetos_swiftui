//
//  primera_pantalla.swift
//  mvvm2
//
//  Created by Jadzia Gallegos on 14/03/25.
//

import SwiftUI

@main
struct PrimeraPantalla: App{
    
    @State var controlador_basico = VistaModeloBasico()
    
    var body: some Scene{
        WindowGroup(id: "nombre"){
            ContentView()
                .environment(controlador_basico)
        }
    }
    
    
}
