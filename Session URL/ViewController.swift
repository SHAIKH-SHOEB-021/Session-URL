//
//  ViewController.swift
//  Session URL
//
//  Created by shoeb on 06/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let session = URLSession.shared
        let sessionURL = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
        let task = session.dataTask(with: sessionURL!) { Data, URLResponse, Error in
            if Error == nil{
                let httpResponse = URLResponse as! HTTPURLResponse
                if(httpResponse.statusCode == 200){
                    let jsonData = try? JSONSerialization.jsonObject(with: Data!, options: .mutableContainers)
                    print(jsonData!)
                }
            }
        }
        task.resume()
    }


}

