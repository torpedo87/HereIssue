//
//  TaskServiceType.swift
//  HereIssue
//
//  Created by junwoo on 2018. 2. 27..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

enum TaskServiceError: Error {
  case creationFailed
  case fetchFailed
  case updateFailed(TaskItem)
  case deletionFailed(TaskItem)
  case toggleFailed(TaskItem)
}

protocol TaskServiceType {
  @discardableResult
  func fetchTasks(tasks: [TaskItem]) -> Observable<[TaskItem]>
  
  @discardableResult
  func createTask(title: String) -> Observable<TaskItem>
  
  @discardableResult
  func delete(task: TaskItem) -> Observable<Void>
  
  @discardableResult
  func update(task: TaskItem, title: String) -> Observable<TaskItem>
  
  @discardableResult
  func toggle(task: TaskItem) -> Observable<TaskItem>
  
  func tasks() -> Observable<Results<TaskItem>>
}
