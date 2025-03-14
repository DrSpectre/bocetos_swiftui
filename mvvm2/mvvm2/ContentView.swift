//
//  ContentView.swift
//  mvvm2
//
//  Created by Jadzia Gallegos on 14/03/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    var body: some View {
        VStack {
            ForEach(controlador.series_registradas){ _ in
                Image(systemName: "plus")
            }
        }
        .padding()
        
        Button("Agrega por favor una serie de prueba"){
            controlador.agregar_serie()
        }
    }
}

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
