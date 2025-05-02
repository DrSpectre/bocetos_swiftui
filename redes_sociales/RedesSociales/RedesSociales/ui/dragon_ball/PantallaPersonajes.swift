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
        NavigationStack{
            if(controlador.pagina_resultados != nil){
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.pagina_resultados!.items){ persoanje in
                            NavigationLink{
                                PantallaPersonaje()
                            } label : {
                                PrevistaMonoChino(mono_chino: persoanje)
                            }.simultaneousGesture(TapGesture().onEnded({
                               //  Aqui ejecutamos codigo magico
                            }))
                        }
                    }
                }
            }
        }.onAppear {
            Task {
                await controlador.descargar_monos_chinos()
            }
        }
    }
}

/*
 
 LazyVStack{
     ForEach(controlador.pagina_resultados!.items){ personaje in
         NavigationLink {
             Text("Hola mundo \(controlador.personaje?.originPlanet?.name)")
         } label: {
             Text("El personaje es \(personaje.name)")
             AsyncImage(url: URL(string: personaje.image))
         }.simultaneousGesture(TapGesture().onEnded({
             controlador.descargar_informacion_personaje(id: personaje.id)
         }))
     }
 }
 */

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
