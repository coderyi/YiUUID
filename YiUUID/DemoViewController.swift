//
//  DemoViewController.swift
//  YiUUID
//
//  Created by coderyi on 2020/11/28.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        print(YiUUID.shared.uuid())
        print(YiUUID.shared.uuidForKey("hello"))
        print(YiUUID.shared.uuidForKey("hello"))
        print("uuidForSession")
        print(YiUUID.shared.uuidForSession())
        print(YiUUID.shared.uuidForSession())
        print("uuidForInstallation")
        print(YiUUID.shared.uuidForInstallation())
        print(YiUUID.shared.uuidForInstallation())
        print("uuidForVendor")
        print(YiUUID.shared.uuidForVendor())
        print(YiUUID.shared.uuidForVendor())
        print("uuidForDevice")
        print(YiUUID.shared.uuidForDevice())
        print(YiUUID.shared.uuidForDevice())

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
