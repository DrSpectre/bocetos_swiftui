//
//  controlador_app.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 25/03/25.
//
import SwiftUI
// import Foundation

@Observable
@MainActor
public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    
    var publicacion_seleccionada: Int = -1
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
        }
    }
    
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_descargadas
    }
    
    func descargar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_descargadas
    }
}


/*
@Observable
@MainActor
public class ContorladorGlobal{
    var publicaciones: Array<Publicacion> = []
    
    init(){
        Task.detached(priority: .high){
            /*
              do{
                  try await self.iniciar()
              }
              catch{
                  // log.error(error)
              }
              //await self.cargar_vestidos_y_maniqui()
             */
            await self.iniciar()
          }
      }
    
    func iniciar() async {
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_descargadas
        
        
        defer{
            print("Se ha fianlziado la carga de informacion")
        }
    }
}
*/

