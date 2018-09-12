//
//  ViewController.swift
//  PhotoPicker-with-Joseph
//
//  Created by Ilgar Ilyasov on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectAPhoto(_ sender: Any) {
        
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {
                NSLog("Please go into setting and allow PhotoPicker access to photo library")
                return
                
            }
            
            print("Access Granted to the Photo Library")
            
            DispatchQueue.main.async {
                self.presentImagePickerController()
            }
        }
    }
    
    private func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        photoImageView.image = image
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        print("cancelled")
    }

}

