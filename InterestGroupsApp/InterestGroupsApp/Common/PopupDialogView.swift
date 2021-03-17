//
//  PopupDialogView.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit
import PopupDialog

class PopupDialogView {

    func showResultPopup() -> PopupDialog {
        let title = "Error al descargar los grupos"
        let message = ""
        
        let popup = PopupDialog(title: title, message: message, image: nil)
        
        let buttonOne = DefaultButton(title: "Aceptar") {
            self.dismissPopupAlert()
        }
        
        popup.addButtons([buttonOne])
        
        return popup
    }
    
    func dismissPopupAlert() {
        
    }
}
