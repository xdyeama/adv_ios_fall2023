//
//  CityData.swift
//  CitiesHW
//
//  Created by Beket Barlykov  on 28.10.2023.
//

import Foundation
import UIKit


let imageCache = NSCache<AnyObject, AnyObject>()


struct City{
    let name: String
    let url: URL?
}

extension City{
    static func makeMock() -> [City]{
        return [
            .init(name: "paris", url: URL(string: "https://images.adsttc.com/media/images/5d44/14fa/284d/d1fd/3a00/003d/large_jpg/eiffel-tower-in-paris-151-medium.jpg?1564742900")),
            .init(name: "almaty", url: URL(string: "https://melanie-klein-trust.org.uk/wp-content/uploads/2020/05/Almaty.jpg")),
            .init(name: "astana", url: URL(string: "https://all.accor.com/magazine/imagerie/1-619b.jpg")),
            .init(name: "berlin", url: URL(string: "https://images.unsplash.com/photo-1599946347371-68eb71b16afc?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVybGlufGVufDB8fDB8fHww")),
            .init(name: "seoul", url: URL(string: "https://media.architecturaldigest.com/photos/5c0ed0538d2a442e241057b1/16:9/w_2560%2Cc_limit/GettyImages-771579891.jpg")),
            .init(name: "tokyo", url: URL(string: "https://media.istockphoto.com/id/1131743616/photo/aerial-view-of-tokyo-cityscape-with-fuji-mountain-in-japan.jpg?s=612x612&w=0&k=20&c=0QcSwnyzP__YpBewnQ6_-OZkn0XDtq-mXyvLSSakjZE=")),
            .init(name: "New York", url: URL(string: "https://media.istockphoto.com/id/1406960186/photo/the-skyline-of-new-york-city-united-states.jpg?s=612x612&w=0&k=20&c=yZJXNdzq3d5bKgvVzPBahBujpbVUXFyjyl9FN9L7esM=")),
            .init(name: "madrid", url: URL(string: "https://images.unsplash.com/photo-1539037116277-4db20889f2d4?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFkcmlkfGVufDB8fDB8fHww")),
            .init(name: "istambul", url: URL(string: "https://cdn.tripster.ru/thumbs2/254f6f06-db97-11ec-99d8-a671c87e6865.800x600.jpeg")),
            .init(name: "helsinki", url: URL(string: "https://media.istockphoto.com/id/183996236/photo/helsinki-finland.jpg?s=612x612&w=0&k=20&c=7fZ7yf8u-tuzy3zOvlm_Sv8AA_ZI8ZQDBsIQgKtvoN4=")),
            .init(name: "brussels", url: URL(string: "https://www.visit.brussels/en/visitors/_jcr_content/root/container/content_1226746056_c/multicolumn/teaser_2005755142.coreimg.jpeg/1686904852589/grand-place-4212---visit-brussels---jean-michel-byl.jpeg")),
        ]
    }
}


extension UIImageView{
    func load(url: URL){
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {

                    self.image = imageFromCache
                    return
                }
        
        DispatchQueue.global().async{ [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data : data){
                    DispatchQueue.main.async{
                        self?.image = image
                        
                        imageCache.setObject(image, forKey: url as AnyObject)
                    }
                }
            }
            
        }
    }
}
