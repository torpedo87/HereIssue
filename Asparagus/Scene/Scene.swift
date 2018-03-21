//
//  Scene.swift
//  Asparagus
//
//  Created by junwoo on 2018. 2. 27..
//  Copyright © 2018년 samchon. All rights reserved.
//

import UIKit

enum Scene {
  case sidebar(LeftViewModel, TaskViewModel)
  case auth(AuthViewModel)
  case edit(EditViewModel)
  case create(CreateViewModel)
}

extension Scene {
  func viewController() -> UIViewController {
    
    switch self {
    case .auth(let viewModel):
      var vc = AuthViewController()
      vc.bindViewModel(to: viewModel)
      return vc
    case .edit(let viewModel):
      var vc = EditViewController()
      vc.bindViewModel(to: viewModel)
      return vc
    case .create(let viewModel):
      var vc = CreateViewController()
      vc.bindViewModel(to: viewModel)
      return vc
    case .sidebar(let leftViewModel, let taskViewModel):
      var leftVC = LeftViewController()
      leftVC.bindViewModel(to: leftViewModel)
      var taskVC = TaskViewController()
      taskVC.bindViewModel(to: taskViewModel)
      let sidebarViewModel = SidebarViewModel(leftViewModel: leftViewModel, taskViewModel: taskViewModel)
      let nav = UINavigationController(rootViewController: taskVC)
      var sidebarVC = SidebarViewController(leftVC: leftVC, mainNav: nav)
      sidebarVC.bindViewModel(to: sidebarViewModel)
      return sidebarVC
    }
  }
}