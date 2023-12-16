//
//  HomeStore.swift
//  MyPet
//
//  Created by Felipe Miranda on 16/12/23.
//

import Foundation


//url: https://run.mocky.io/v3/9ff0c09e-0f15-4b3d-a848-2dcbfa77dfa9

protocol HomeStore: GenericStore {
    
    func getHome(url: String?, completion: @escaping completion<HomeResponse?>)
}


class HomeAPIStore: GenericAPIStore, HomeStore {
    
    
    func getHome(url: String?, completion: @escaping completion<HomeResponse?>) {
        
        
        guard let urlString = url, let url = URL(string: urlString) else {
                completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL inválida"]))
                return
            }

            // Crie a sessão
            let session = URLSession.shared

            // Crie a tarefa de sessão de dados
            let task = session.dataTask(with: url) { data, response, error in
                // Verifique se ocorreu algum erro
                if let error = error {
                    completion(nil, error as NSError)
                    return
                }

                // Verifique se os dados foram recebidos
                guard let data = data else {
                    completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Nenhum dado recebido"]))
                    return
                }

                // Tente decodificar a resposta
                do {
                    let decodedResponse = try JSONDecoder().decode(HomeResponse.self, from: data)
                    completion(decodedResponse, nil)
                } catch {
                    completion(nil, error as NSError)
                }
            }

            task.resume()
        }
}
    
