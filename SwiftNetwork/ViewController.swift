//
//  ViewController.swift
//  SwiftNetwork
//
//  Created by 乐天 on 2017/10/9.
//  Copyright © 2017年 乐天. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.GETRequest();
        self.GETRequest2();
        
    }

    func GETRequest() {
        
        //这是一个参数比较完整的GET请求 , 但是实质上 , 有几个参数我们是比较少用到的.
        let requestHeader:HTTPHeaders = ["Range":"1-3"];
        
        let para = ["userName":"coderMy",
                    "password":"12345"];
        
        let mainQueue = DispatchQueue.main;
        
        Alamofire.request("https://www.baidu.com",method: .get, parameters: para,encoding: URLEncoding.default, headers:requestHeader).responseJSON(queue:mainQueue, options: .allowFragments)
        { (response) in
            print("GETRequest=============",response);
        }
    }
    
    func GETRequest2() {
        //method可省略 , 默认请求方式为GET
        Alamofire.request("https://www.baidu.com",method: .get).responseJSON
            { (response) in
            
                print("GETRequest2=============",response);
        }
    }
    func GET_Request() {
        let parameters : [String : Any] = ["foo": "bar"]
        
        //1,responseJSON
        Alamofire.request("https://www.baidu.com", method: .get, parameters: parameters).responseJSON { (returnResult) in
            
            print("GET_Request --> GET 请求 --> returnResult = \(returnResult)")
            
            if let json = returnResult.result.value
            {
                print("firstMethod --> responseJSON --> \(json)")
                
                /*  返回请求地址、数据、和状态结果等信息
                 print("firstMethod --> responseJSON() --> \(returnResult.request!)")
                 print("firstMethod --> responseJSON() --> \(returnResult.data!)")
                 print("firstMethod --> responseJSON() --> \(returnResult.result)")
                 */
            }
        }
    }
    
    
    func postRequest() {
        
        let para = ["userName":"coderMy",
                    "password":"12345"];
        
        Alamofire.request("https://www.baidu.com/login",method: .post, parameters: para).responseJSON { (response) in
            
            print("GETRequest2=============",response);
        }
        
    }
    

    func POST_Request(){
        
        
        //request(host_url, method:.post, parameters : parameters)
        
        let urlstring = "https://www.baidu.com/login"
        
        Alamofire.request(urlstring, method:.post).responseJSON { (returnResult) in
            
            print("POST_Request --> post 请求 --> returnResult = \(returnResult)")
            //            switch returnResult.result.isSuccess {
            //            case true:
            //                print("数据获取成功!")
            //            case false:
            //                print(returnResult.result.error ?? Error.self)
            //            }
            
        }
    }
    
}

