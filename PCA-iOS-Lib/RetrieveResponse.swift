import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class RetrieveResponse: Mappable {
    public var Items: [RetrieveResponseItem]?;
    
    required public init(map: Map) {
        
    }
    
    init(){
        self.Items = [];
    }
    
    public func mapping(map: Map) {
        Items <- map["Items"];
    }
    
}
