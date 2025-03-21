//
//  menu_principal_series.swift
//  mvvm2
//
//  Created by Jadzia Gallegos on 21/03/25.
//

import SwiftUI

struct MenuPrincipalSeries: View {
    @Environment(VistaModeloBasico.self) var controlador
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(controlador.series_registradas){ _ in
                    Image(systemName: "plus")
                }
            }
            .padding()
        }

        
        Spacer()
        
        Button("Agrega por favor una serie de prueba"){
            controlador.cambiar_a_agregar_serie()
        }
    }
}

#Preview {
    MenuPrincipalSeries()
        .environment(VistaModeloBasico())
}

