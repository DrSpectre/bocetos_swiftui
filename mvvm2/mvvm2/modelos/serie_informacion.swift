//
//  aqui_guardan_sus_modelos.swift
//  mvvm2
//
//  Created by Jadzia Gallegos on 14/03/25.
//
import Foundation

struct Temporada: Identifiable{
    var id = UUID()
    
    var nombre: String
    var cantidad_capitulos: Int
    var imagen: String = ""
}

struct Plataforma: Identifiable{
    var id = UUID()
    
    var nombre: String
    var imagen: String
}

struct InformacionSerie: Identifiable{
    var id = UUID()
    
    var nombre: String
    var tipo: String
    
    var plataformas: [Plataforma] = [] // Aqui tengo  una deuda tecnica para indicar otras plataforams de forma mas facil.
    
    
    var fecha_estreno: Int
    var sinopsis: String
    
    var temporadas: [Temporada] = []
    
    var caratula: String
    
}
