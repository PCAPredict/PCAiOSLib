import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class FindResponse: Mappable {
    public var Items: [FindResponseItem]?;
    
    required public init(map: Map) {
        
    }
    
    init(){
        self.Items = [];
    }
    
    public func mapping(map: Map) {
        Items <- map["Items"];
    }
    
}
