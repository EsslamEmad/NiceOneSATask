//
//  CartViewModel.swift
//  NiceOneSATask
//
//  Created by Esslam Emad on 6/10/21.
//

import Alamofire


protocol CartViewModelDelegate: AnyObject{
    func cartDidUpdate()
    func requestDidFailWith(error: String)
    func isViewLoading(value: Bool)
}

class CartViewModel {
    
    // MARK: - Variables
    weak var view: CartViewModelDelegate?
    
    var products: [Product]!
    
    // MARK: - Intialization
    init(view: CartViewModelDelegate) {
        self.view = view
        products = [Product]()
        getCart()
        
    }
    
    // MARK: - API calls
    func getCart() {
        view?.isViewLoading(value: true)
        AF.request("https://test.niceonesa.com?route=rest/cart/cart", method: .get, headers: Defaults.HTTPHeaders).responseData { [weak self] response in
            self?.view?.isViewLoading(value: false)
            switch response.result {
            case let .failure(error):
                
                self?.view?.requestDidFailWith(error: error.localizedDescription)
            case let .success(data):
                
                switch response.response!.statusCode {
                case 200...300:
                    self?.handleSuccess(data: data)
                default:
                    self?.handleError(data: data)
                }
            }}
    }
    
    
    func addProduct(withID productID: String) {
        
        var parameters = Parameters()
        parameters["product_id"] = productID
        
        view?.isViewLoading(value: true)
        AF.request("https://test.niceonesa.com?route=rest/cart/cart", method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: Defaults.HTTPHeaders).responseData { [weak self] response in
            self?.view?.isViewLoading(value: false)
            switch response.result {
            
            case let .failure(error):
                self?.view?.requestDidFailWith(error: error.localizedDescription)
                
            case let .success(data):
                switch response.response!.statusCode {
                case 200...300:
                    self?.handleSuccess(data: data)
                default:
                    self?.handleError(data: data)
                }
            }}
    }
    
    
    
    //MARK:- Handle API Response
    func handleSuccess(data: Data){
        do {
            let modules = try JSONDecoder().decode(APIResponse<APICartResponse>.self, from: data)
            
            products = modules.data.products
            view?.cartDidUpdate()
        } catch {
            view?.requestDidFailWith(error: "Can't read the data")
        }
    }
    
    
    func handleError(data: Data){
        do {
            let modules = try JSONDecoder().decode(APIResponse<[APICartResponse]>.self, from: data)
            view?.requestDidFailWith(error: modules.error.joined(separator: ", "))
        } catch {
            view?.requestDidFailWith(error: "Something went wrong")
        }
    }
    
}
