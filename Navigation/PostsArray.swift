//
//  PostsArray.swift
//  Navigation
//
//  Created by MacBook on 18.08.2022.
//

import Foundation

struct PostsArray {
    
    static let shared = PostsArray()
    
    private init() {}
    
    let data: [Post] = [
        Post(author: "Ivan", description: "В замке Ласточкино гнездо состоялся шоу-показ Академии мировой моды", image: "pokaz_mod_lastochka", likes: 33, views: 133),
        Post(author: "Denis", description: "В Ялте за три часа выпало 85 миллиметров осадков - МЧС", image: "liven_yalta", likes: 44, views: 144),
        Post(author: "Egor", description: "В Ялте состоялось мероприятие, посвященное Дню Археолога", image: "den_arxeologa_6", likes: 10, views: 98),
        Post(author: "Tanya", description: "Студентка КФУ выиграла грант на открытие школы развития навыков проектной деятельности", image: "studentka_kfu_grant", likes: 22, views: 88),
        Post(author: "Diana", description: "Глава Ялты: Благоустройство Площади восьми платанов в Форосе выполнено на 70%", image: "ploshad_8_platanov", likes: 9, views: 1000)
    ]
}
