//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최진안 on 2023/05/14.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    
    
    // MARK: - 맨 처음 실행
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    // MARK: - view가 보일때마다 동작
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationBar 숨기기
        navigationController?.navigationBar.isHidden = true
        
    }
    
    
    // MARK: - action함수 추가
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        
    }
    
    
}
