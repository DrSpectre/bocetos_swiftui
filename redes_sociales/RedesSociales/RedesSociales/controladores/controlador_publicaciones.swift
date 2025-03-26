//
//  controlador_publicaciones.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 24/03/25.
//
import SwiftUI


class ControladorPublicaciones: ObservableObject{
//class ControladorPublicaciones{
    @Published var publicaciones = [Publicacion]()
    // @Published var publicaciones: [Publicacion] = []

    
    func obtener_publicaciones() async {
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_descargadas
    }
}

