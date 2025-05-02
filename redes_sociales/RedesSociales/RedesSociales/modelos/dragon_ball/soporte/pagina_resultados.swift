//
//  pagina_resultados.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 02/04/25.
//


struct Meta: Codable{
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}

struct Enlaces: Codable{
    let first: String
    let previous: String
    let next: String
    let last: String
}

struct PaginaResultado: Codable {
    let items: [MonoChino]
    let meta: Meta
    let links: Enlaces
}

protocol Item: Codable, Identifiable{
    var id: Int { get set }
    var name: String { get set }
}

struct PaginaResultadoPlaneta: Codable { //, Identifiable {
    //var id: Int = self.meta.currentPage
    let items: [Planeta]
    let meta: Meta
    let links: Enlaces
}


