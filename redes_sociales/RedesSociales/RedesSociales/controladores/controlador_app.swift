//
//  controlador_app.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 25/03/25.
//
import SwiftUI
import Foundation


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


