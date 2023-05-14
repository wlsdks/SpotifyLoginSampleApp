//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최진안 on 2023/05/14.
//

import UIKit
import FirebaseAuth //이메일 인증을 위한 추가

class EnterEmailViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // 화면을 키자마자 커서가 위치하도록 한다.
        emailTextField.becomeFirstResponder()

    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 네비게이션 바 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Firebase 이메일/비밀번호 인증 로직
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // 신규 사용자 생성 (weak self로 순환참조 방지)
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            self.showMainViewController()
        }
    }
    
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    

}

// MARK: - 확장 선언
extension EnterEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
