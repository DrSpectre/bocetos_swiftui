//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 24/03/25.
//
import SwiftUI


class PlaceHolderAPI: Codable {
    let url_de_publiaciones = "https://jsonplaceholder.typicode.com"
    
    func descargar_publicaciones<T: Codable>() async -> T? {
        do {
            guard let url = URL(string: "\(url_de_publiaciones)/posts") else { throw ErroresDeRed.badUrl }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300  else { throw ErroresDeRed.badStatus }
            guard let respuesta_decodificada = try? JSONDecoder().decode(T.self, from: datos) else { throw ErroresDeRed.fallaAlConvertirLaRespuesta }
            
            return respuesta_decodificada
        }
        
        catch ErroresDeRed.badUrl {
            print("Tenes mal la url capo, cambiala")
        }
        catch ErroresDeRed.badResponse {
            print("Algo salio mal con la respuesta, revisa por favor")
        }
        catch ErroresDeRed.badStatus {
            print("Como consigues un status negativo de algo que ni siquiere se mueve.")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("Tienes mal el modelo o la implementacion de este")
        }
        
        catch ErroresDeRed.invalidRequest {
            print("Como llegaste aqui?")
        }
        catch {
            print("Algo exageradamente malo paso")
        }
        
        return nil
    }
}
