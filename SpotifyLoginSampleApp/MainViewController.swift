//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최진안 on 2023/05/14.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 네비게이션바 숨기기 처리
        navigationController?.navigationBar.isHidden = true
        
        // 이메일 만들어주기
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomeLabel.text = """
                            환영합니다.
                            \(email)님
                            """
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        // 로그아웃 버튼 클릭시 rootViewController로 이동시킨다.
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
