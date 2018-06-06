//
//  AuthViewModel.swift
//  Asparagus
//
//  Created by junwoo on 2018. 2. 27..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

struct AuthViewModel {
  private let bag = DisposeBag()
  private let sceneCoordinator: SceneCoordinatorType
  private let authService: AuthServiceRepresentable
  let onAuth: Action<(String, String), AuthService.AccountStatus>
  let isLoggedIn = BehaviorRelay<Bool>(value: false)
  
  init(authService: AuthServiceRepresentable,
       coordinator: SceneCoordinatorType,
       authAction: Action<(String, String), AuthService.AccountStatus>) {
    self.authService = authService
    self.sceneCoordinator = coordinator
    self.onAuth = authAction
    
    bindOutput()
  }
  
  private func bindOutput() {
    authService.loginStatus.asObservable()
      .bind(to: isLoggedIn)
      .disposed(by: bag)
  }
  
  func onForgotPassword() -> CocoaAction {
    return CocoaAction {
      return Observable.create({ (observer) -> Disposable in
        if let url = URL(string: "https://github.com/password_reset") {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        observer.onCompleted()
        return Disposables.create()
      })
    }
  }
}
