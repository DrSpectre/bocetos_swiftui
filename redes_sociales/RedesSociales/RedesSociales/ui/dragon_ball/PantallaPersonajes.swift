//
//  PantallaPersonajes.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 04/04/25.
//
import SwiftUI

// PAra que peudas cargaer una imagen por deafult cuando descargues la imagen
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
        if(controlador.pagina_resultados != nil){
            ScrollView{
                LazyVStack{
                    ForEach(controlador.pagina_resultados!.items){ personaje in
                        Text("El personaje es \(personaje.name)")
                        AsyncImage(url: URL(string: personaje.image))
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
