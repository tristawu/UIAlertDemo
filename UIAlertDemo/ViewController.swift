//
//  ViewController.swift
//  UIAlertDemo
//
//  Created by Trista on 2021/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        
        
        //設置一個按下會顯示簡單提示的按鈕
        var myButton = UIButton(type: .system)
        myButton.frame = CGRect(
          x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("簡單提示", for: .normal)
        myButton.backgroundColor = UIColor.init(
          red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(
            nil,
            action: #selector(ViewController.simpleHint),
            for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.15)
        self.view.addSubview(myButton)
        
        
        //設置一個按下會顯示確認及取消提示的按鈕
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(
          x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("送出", for: .normal)
        myButton.backgroundColor = UIColor.init(
          red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(
            nil,
            action: #selector(ViewController.confirm),
            for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.3)
        self.view.addSubview(myButton)
        
        
        //設置一個按下會提示刪除的按鈕
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(
          x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("刪除", for: .normal)
        myButton.backgroundColor = UIColor.init(
          red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(
            nil,
            action: #selector(ViewController.deleteSomething),
            for: .touchUpInside)
        myButton.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.45)
        self.view.addSubview(myButton)
        
        
        //設置一個按下會提示登入的按鈕
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(
          x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("登入", for: .normal)
        myButton.backgroundColor = UIColor.init(
          red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(
            nil,
            action: #selector(ViewController.login),
            for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.6)
        self.view.addSubview(myButton)
        
        
        //設置一個按下會從底部彈出提示的按鈕
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(
          x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("底部提示", for: .normal)
        myButton.backgroundColor = UIColor.init(
          red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(
            nil,
            action: #selector(ViewController.bottomAlert),
            for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.75)
        self.view.addSubview(myButton)
    }

    
    //按下按鈕後要執行動作的方法
    //簡單的提示
    @objc func simpleHint() {
        //建立一個提示框
        //title：提示的標題，會以粗體顯示
        //message：提示的內容
        //preferredStyle：提示框的類型，.Alert會顯示在畫面中間，.ActionSheet是顯示在畫面底部
        let alertController = UIAlertController(
            title: "提示",
            message: "一個簡單提示，請按確認繼續",
            preferredStyle: .alert)

        //建立[確認]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        let okAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler: {
            (action: UIAlertAction!) -> Void in
              print("簡單的提示：按下確認後，閉包裡的動作")
        })
        //將按鈕加入到提示框控制器中
        //按鈕的順序會同使用addAction()方法加入的順序
        alertController.addAction(okAction)

        //顯示提示框
        self.present(
          alertController,
          animated: true,
          completion: nil)

    }
    
    
    //按下按鈕後要執行動作的方法
    //有確認與取消的提示框
    @objc func confirm() {
        //建立一個提示框
        //title：提示的標題，會以粗體顯示
        //message：提示的內容
        //preferredStyle：提示框的類型，.Alert會顯示在畫面中間，.ActionSheet是顯示在畫面底部
        let alertController = UIAlertController(
            title: "送出",
            message: "確認要送出了嗎？",
            preferredStyle: .alert)

        //建立[取消]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        let cancelAction = UIAlertAction(
          title: "取消",
          style: .cancel,
          //handler: nil
          handler: {(action: UIAlertAction!) -> Void in
              print("有確認與取消的提示框：按下取消後，閉包裡的動作")}
        )
        //將按鈕加入到提示框控制器中
        //按鈕的順序會同使用addAction()方法加入的順序
        //習慣上會將Cancel按鈕放在左邊。Cancel按鈕(也就是style設置為.Cancel的UIAlertAction())在一個提示框控制器中只能有一個。
        alertController.addAction(cancelAction)

        
        //建立[確認]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        let okAction = UIAlertAction(
          title: "確認",
          style: .default,
          //handler: nil
          handler: {(action: UIAlertAction!) -> Void in
            print("有確認與取消的提示框：按下確認後，閉包裡的動作")}
        )
        //將按鈕加入到提示框控制器中
        //按鈕的順序會同使用addAction()方法加入的順序
        alertController.addAction(okAction)

        //顯示提示框
        self.present(
          alertController,
          animated: true,
          completion: nil)
    }

    
    //按下按鈕後要執行動作的方法
    //警示提示框
    @objc func deleteSomething() {
        //建立一個提示框
        //title：提示的標題，會以粗體顯示
        //message：提示的內容
        //preferredStyle：提示框的類型，.Alert會顯示在畫面中間，.ActionSheet是顯示在畫面底部
        let alertController = UIAlertController(
            title: "刪除",
            message: "刪除字樣會變紅色的",
            preferredStyle: .alert)

        //建立[取消]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        let cancelAction = UIAlertAction(
          title: "取消",
          style: .cancel,
          //handler: nil
          handler: {(action: UIAlertAction!) -> Void in
            print("警示提示框：按下取消後，閉包裡的動作")}
        )
        //將按鈕加入到提示框控制器中
        //按鈕的順序會同使用addAction()方法加入的順序
        //習慣上會將Cancel按鈕放在左邊。Cancel按鈕(也就是style設置為.Cancel的UIAlertAction())在一個提示框控制器中只能有一個。
        alertController.addAction(cancelAction)

        //建立[刪除]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        //建立刪除按鈕的UIAlertAction()的參數style設置為.Destructive，會將按鈕文字改為紅色的，表示這個按鈕選項是警示用的，一般用在可能會改變或刪除資料的動作上
        let okAction = UIAlertAction(
          title: "刪除",
          style: .destructive,
          //handler: nil
          handler: {(action: UIAlertAction!) -> Void in
            print("警示提示框：按下刪除後，閉包裡的動作")}
        )
        //將按鈕加入到提示框控制器中
        //按鈕的順序會同使用addAction()方法加入的順序
        alertController.addAction(okAction)

        //顯示提示框
        self.present(
          alertController,
          animated: true,
          completion: nil)
    }
    
    
    //按下按鈕後要執行動作的方法
    //有輸入框的提示框
    @objc func login() {
        //建立一個提示框
        //title：提示的標題，會以粗體顯示
        //message：提示的內容
        //preferredStyle：提示框的類型，.Alert會顯示在畫面中間，.ActionSheet是顯示在畫面底部
        let alertController = UIAlertController(
            title: "登入",
            message: "請輸入帳號與密碼",
            preferredStyle: .alert)

        //建立兩個輸入框
        //參數為一個型別為(textField: UITextField!) -> Void的閉包，在這個閉包內為輸入框作額外的設定
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "帳號"
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "密碼"

            //要輸入密碼,這個屬性要設定為 true
            textField.isSecureTextEntry = true
        }

        //建立[取消]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        let cancelAction = UIAlertAction(
          title: "取消",
          style: .cancel,
          //handler: nil
          handler: {(action: UIAlertAction!) -> Void in
            print("有輸入框的提示框：按下取消後，閉包裡的動作")}
        )
          alertController.addAction(cancelAction)

        //建立[登入]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //按下登入按鈕函式的閉包是尾隨閉包:寫在函式括號()之後的閉包表達式，函式支援將其作為最後一個參數呼叫
        let okAction = UIAlertAction(
            title: "登入",
            style: .default) {
            (action: UIAlertAction!) -> Void in
            
            //按下登入按鈕函式的閉包中，獲得輸入的帳號與密碼，並print()印出來
            //as 向下型別轉換至子類別型別
            let acc =
              (alertController.textFields?.first)!
                as UITextField
            let password =
              (alertController.textFields?.last)!
                as UITextField

            print("有輸入框的提示框：輸入的帳號為：\(acc.text!)")
            print("輸入的密碼為：\(password.text!)")
          }
        alertController.addAction(okAction)

        // 顯示提示框
        self.present(
          alertController,
          animated: true,
          completion: nil)
    }
    
    
    //按下按鈕後要執行動作的方法
    //從底部彈出的提示框
    @objc func bottomAlert() {
        //建立一個提示框
        //title：提示的標題，會以粗體顯示
        //message：提示的內容
        //preferredStyle：提示框的類型，.Alert會顯示在畫面中間，.ActionSheet是顯示在畫面底部
        //底部提示框不能加入輸入框
        let alertController = UIAlertController(
            title: "底部提示",
            message: "這個提示會從底部彈出",
            preferredStyle: .actionSheet)

        //建立[取消]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        //加入Cancel按鈕到底部提示框，它會永遠在最底下一個
        let cancelAction = UIAlertAction(
          title: "取消",
          style: .cancel,
          //handler: nil
          handler: {(action: UIAlertAction!) -> Void in
                  print("從底部彈出的提示框：按下取消後，閉包裡的動作")}
        )
          alertController.addAction(cancelAction)

        //建立[確認]按鈕
        //title：按鈕的文字
        //style：按鈕的樣式，可選擇.Cancel、.Default、.Destructive等
        //handler：按下按鈕後要執行的動作，是一個型別為(action: UIAlertAction!) -> Void的閉包，如果不要有動作則是填入nil
        let okAction = UIAlertAction(
          title: "確認",
          style: .default,
          //handler: nil
          handler: {(action: UIAlertAction!) -> Void in
            print("從底部彈出的提示框：按下確認後，閉包裡的動作")}
        )
          alertController.addAction(okAction)

        //顯示提示框
        self.present(
          alertController,
          animated: true,
          completion: nil)
    }
}

