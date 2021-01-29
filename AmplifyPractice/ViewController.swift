//
//  ViewController.swift
//  AmplifyPractice
//
//  Created by JEONGSEOB HONG on 2021/01/28.
//

import UIKit
import Amplify

class ViewController: UIViewController {
    
    @IBOutlet weak var currentLoginInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchAttributes()
    }
    
    
    func fetchAttributes() {
        Amplify.Auth.fetchUserAttributes() { [weak self] result in
            switch result {
            case .success(let attributes):
                print("User attributes - \(attributes)")
                DispatchQueue.main.async {
                    self?.currentLoginInfo.text = "User attributes - \(attributes)"
                }
            case .failure(let error):
                print("Fetching user attributes failed with error \(error)")
                DispatchQueue.main.async {
                    self?.currentLoginInfo.text = "Fetching user attributes failed with error \(error)"
                }
            }
        }
    }
    
    
    @IBAction func tapFacebookLoginButton(_ sender: Any) {
        Amplify.Auth.signInWithWebUI(for: .facebook, presentationAnchor: self.view.window!) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
                self.fetchAttributes()
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
        
    }
    
    
    @IBAction func tapGoogleLoginButton(_ sender: Any) {
        Amplify.Auth.signInWithWebUI(for: .google, presentationAnchor: self.view.window!) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
                self.fetchAttributes()
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
    }
    
    
    @IBAction func tapAppleLoginButton(_ sender: Any) {
        Amplify.Auth.signInWithWebUI(for: .apple, presentationAnchor: self.view.window!) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
    }
    
    @IBAction func tapLogoutButton(_ sender: Any) {
        Amplify.Auth.signOut() { result in
            switch result {
            case .success:
                print("Successfully signed out")
                self.fetchAttributes()
            case .failure(let error):
                print("Sign out failed with error \(error)")
            }
        }
    }
}

