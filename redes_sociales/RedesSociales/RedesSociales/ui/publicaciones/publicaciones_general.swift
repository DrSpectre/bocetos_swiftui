//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 24/03/25.
//
import SwiftUI


struct GeneralPublicaciones: View {
   //@StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink {
                            Text("Hola mundo")
                        } label : {
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            }
                            /*.onTapGesture {
                                //controlador.mostrar_publicacion(publicacion.id)
                                print("Usted ha seleccionado: \(publicacion.id)")
                            }*/
                            
                        }

                    }
                }
            }
            .onAppear {
                print("hola mundo")
            }
        }
    }
        
}

#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
