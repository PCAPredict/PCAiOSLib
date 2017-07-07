import Foundation

public class ResponseError: NSObject{
    public var
    Error: String?,
    Description: String?,
    Cause: String?,
    Resolution: String?;
    
    init(findResponseItem: FindResponseItem) {
        self.Error = findResponseItem.Error;
        self.Description = findResponseItem.Description;
        self.Cause = findResponseItem.Cause;
        self.Resolution = findResponseItem.Resolution;
    }
    
    init(retrieveResponseItem: RetrieveResponseItem) {
        self.Error = retrieveResponseItem.Error;
        self.Description = retrieveResponseItem.Description;
        self.Cause = retrieveResponseItem.Cause;
        self.Resolution = retrieveResponseItem.Resolution;
    }
    
}
