//
//  DiaryDetailControllerExtensions.swift
//  Diary
//
//  Created by Ed Chang on 2022/2/17.
//

import UIKit

@objc extension DiaryDetailViewController {
    
// MARK: - Class Properties -
    
    enum CameraActionSheet: String {
        
        case camera = "相機"
        case library = "圖庫"
        case cancel = "取消"
    }
}
    
// MARK: - ImagePicker Delegate -

@objc extension DiaryDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showPickerController() {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        imagePickerController.modalPresentationStyle = .fullScreen
        
        imagePickerController.allowsEditing = true
        
        let actionSheet = UIAlertController(
            title: "選擇照片來源",
            message: nil,
            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(
            title: CameraActionSheet.camera.rawValue,
            style: .default,
            handler: { _ in
                
                imagePickerController.sourceType = .camera
                
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        
        actionSheet.addAction(UIAlertAction(
            title: CameraActionSheet.library.rawValue,
            style: .default,
            handler: { _ in
                
                imagePickerController.sourceType = .photoLibrary
                
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        
        actionSheet.addAction(UIAlertAction(
            title: CameraActionSheet.cancel.rawValue,
            style: .cancel,
            handler: nil
        ))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        guard let imageData = image.jpegData(compressionQuality: 0.1) else { return }
        
        self.diary.imageData = imageData
        self.imageView.image = image
        
        dismiss(animated: true)
    }
}

@objc extension DiaryDetailViewController: ImagePickerDelegate {
    
    @objc func presentImagePicker() {
        
        showPickerController()
    }
}
