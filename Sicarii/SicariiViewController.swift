    //
    //  ViewController.swift
    //  Sicarii
    //
    //  Created by Thomas on 2019-05-14.
    //  Copyright © 2019 Thomas Lock. All rights reserved.
    //
    
import UIKit
import Foundation
import SicariiEncrypt

class SicariiViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func encryptButton(_ sender: Any) {
        //GENERATE KEY, ENCRYPT AND DECRYPT
        let array: [UInt8] = buildFileArray()
        let sicarii: SicariiCipher = SicariiCipher()
        let key = sicarii.generate512Key()
        let encrypted = sicarii.encrypt(ary: array, key: key)
        let decrypted = sicarii.decrypt(ary: encrypted, key: key)
        print("key \(key)")
        print("key/model encrypted: \(array != encrypted)")
        print("key/model decrypted: \(array == decrypted)")
    }
    
    @IBAction func keyModelEncryptButton(_ sender: Any) {
        let array: [UInt8] = buildRandomArray()
        let sicarii: SicariiCipher = SicariiCipher()
        let key = sicarii.generate512Key()
        let model = sicarii.generateModel()
        let encrypted = sicarii.encrypt(ary: array, key: key, model: model)
        let decrypted = sicarii.decrypt(ary: encrypted, key: key, model: model)
        print("input data:\(array)")
        print("key/model encrypted: \(array != encrypted)")
        print("encrypted data:\(encrypted)")
        print("key/model decrypted: \(array == decrypted)")
    }
    
    func buildFileArray() -> [UInt8] {
        return bytesFromFile(filePath: "declaration_of_independence", ext: "jpg") ?? []
    }
    
    func buildRandomArray() -> [UInt8] {
        //Get Array Size no Validation in Demo
        var array: [UInt8] = []
        let arraySize = 129
        for _ in 0..<arraySize {
            let number : UInt8 = UInt8(arc4random_uniform(2))
            array.append(number)
        }
        return array
    }
    
    func bytesFromFile(filePath: String, ext: String) -> [UInt8]? {
        if let url = Bundle.main.url(forResource: filePath, withExtension: ext) {
            let data = try? Data(contentsOf: url, options:.mappedRead)
            //        let myImage: UIImage = UIImage.init(named: filePath) ?? UIImage()
            //            let data = myImage.cgImage?.dataProvider?.data as Data?
            //        let data: Data = myImage.jpegData(compressionQuality: 1)!
            // new constructor:
            //            let data: Data = try! Data.init(contentsOf: url)
            return data?.withUnsafeBytes({
                [UInt8](UnsafeBufferPointer(start: $0, count: data?.count ?? 0))
            })
        }
        return nil
    }
}


