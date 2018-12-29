//
//  DownloadImage.swift
//  Scout
//
//  Created by BinaryBoy on 12/8/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL,placeHolder:UIImage = #imageLiteral(resourceName: "Placeholder"), contentMode mode: UIView.ContentMode = .scaleAspectFit) {  
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    
                    DispatchQueue.main.async() {
                        self.image = placeHolder
                    }
                    return
            }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
