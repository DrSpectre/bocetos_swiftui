//
//  publicacion.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 26/03/25.
//

import SwiftUI

let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem ipsum", body: "Et dolor sit amet ")

struct PublicacionVista: View {
    //var publicacion_a_mostrar = controlador.publicacion_seleccionada
    @Environment(ControladorAplicacion.self) var controlador
    
    
    
    var body: some View {
        Text("\(controlador.publicacion_seleccionada?.title)")
        Text("\(controlador.publicacion_seleccionada?.body)")
        
        NavigationLink{
            Text("Hola mundo")
        } label: {
            Text("Ver perfil")
        }
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in
                    Text("Usuario: \(comentario.name)")
                    Text("\(comentario.body)")
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }

}

