import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class FindResponseItem: NSObject, Mappable {
    public var
    Id: String?,
    ItemType: String?,
    Text: String?,
    Highlight: String?,
    Description: String?,
    Error: String?,
    Cause: String?,
    Resolution: String?;
    
    required public init(map: Map) {
        
    }
    
    override init(){
        self.Id = "";
        self.ItemType = "";
        self.Text = "";
        self.Highlight = "";
        self.Description = "";
    }
    
    public func mapping(map: Map) {
        Id <- map["Id"];
        ItemType <- map["Type"];
        Text <- map["Text"];
        Highlight <- map["Highlight"];
        Description <- map["Description"];
        Error <- map["Error"];
        Cause <- map["Cause"];
        Resolution <- map["Resolution"];
    }
    
    func getError() -> ResponseError{
        return ResponseError(findResponseItem: self);
    }
    
}
