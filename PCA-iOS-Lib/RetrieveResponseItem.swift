import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class RetrieveResponseItem: NSObject, Mappable {
    public var
    Id: String?,
    DomesticId: String?,
    Language: String?,
    LanguageAlternatives: String?,
    Department: String?,
    Company: String?,
    SubBuilding: String?,
    BuildingNumber: String?,
    BuildingName: String?,
    SecondaryStreet: String?,
    Street: String?,
    Block: String?,
    Neighbourhood: String?,
    District: String?,
    City: String?,
    Line1: String?,
    Line2: String?,
    Line3: String?,
    Line4: String?,
    Line5: String?,
    AdminAreaName: String?,
    AdminAreaCode: String?,
    Province: String?,
    ProvinceName: String?,
    ProvinceCode: String?,
    PostalCode: String?,
    CountryName: String?,
    CountryIso2: String?,
    CountryIso3: String?,
    CountryIsoNumber: Int?,
    SortingNumber1: String?,
    SortingNumber2: String?,
    Barcode: String?,
    POBoxNumber: String?,
    Label: String?,
    AddressType: String?,
    DataLevel: String?,
    Field1: String?,
    Field2: String?,
    Field3: String?,
    Field4: String?,
    Field5: String?,
    Field6: String?,
    Field7: String?,
    Field8: String?,
    Field9: String?,
    Field10: String?,
    Field11: String?,
    Field12: String?,
    Field13: String?,
    Field14: String?,
    Field15: String?,
    Field16: String?,
    Field17: String?,
    Field18: String?,
    Field19: String?,
    Field20: String?,
    Error: String?,
    Cause: String?,
    Resolution: String?,
    Description: String?;
    
    required public init(map: Map) {
        
    }
    
    override init(){
        self.Id = "";
        self.DomesticId = "";
        self.Language = "";
        self.LanguageAlternatives = "";
        self.Department = "";
        self.Company = "";
        self.SubBuilding = "";
        self.BuildingNumber = "";
        self.BuildingName = "";
        self.SecondaryStreet = "";
        self.Street = "";
        self.Block = "";
        self.Neighbourhood = "";
        self.District = "";
        self.City = "";
        self.Line1 = "";
        self.Line2 = "";
        self.Line3 = "";
        self.Line4 = "";
        self.Line5 = "";
        self.AdminAreaName = "";
        self.AdminAreaCode = "";
        self.Province = "";
        self.ProvinceName = "";
        self.ProvinceCode = "";
        self.PostalCode = "";
        self.CountryName = "";
        self.CountryIso2 = "";
        self.CountryIso3 = "";
        self.CountryIsoNumber = -1;
        self.SortingNumber1 = "";
        self.SortingNumber2 = "";
        self.Barcode = "";
        self.POBoxNumber = "";
        self.Label = "";
        self.AddressType = "";
        self.DataLevel = "";
        self.Field1 = "";
        self.Field2 = "";
        self.Field3 = "";
        self.Field4 = "";
        self.Field5 = "";
        self.Field6 = "";
        self.Field7 = "";
        self.Field8 = "";
        self.Field9 = "";
        self.Field10 = "";
        self.Field11 = "";
        self.Field12 = "";
        self.Field13 = "";
        self.Field14 = "";
        self.Field15 = "";
        self.Field16 = "";
        self.Field17 = "";
        self.Field18 = "";
        self.Field19 = "";
        self.Field20 = "";
    }
    
    public func mapping(map: Map) {
        Id <- map["Id"];
        DomesticId <- map["DomesticId"];
        Language <- map["Language"];
        LanguageAlternatives <- map["LanguageAlternatives"];
        Department <- map["Department"];
        Company <- map["Company"];
        SubBuilding <- map["SubBuilding"];
        BuildingNumber <- map["BuildingNumber"];
        BuildingName <- map["BuildingName"];
        SecondaryStreet <- map["SecondaryStreet"];
        Street <- map["Street"];
        Block <- map["Block"];
        Neighbourhood <- map["Neighbourhood"];
        District <- map["District"];
        City <- map["City"];
        Line1 <- map["Line1"];
        Line2 <- map["Line2"];
        Line3 <- map["Line3"];
        Line4 <- map["Line4"];
        Line5 <- map["Line5"];
        AdminAreaName <- map["AdminAreaName"];
        AdminAreaCode <- map["AdminAreaCode"];
        Province <- map["Province"];
        ProvinceName <- map["ProvinceName"];
        ProvinceCode <- map["ProvinceCode"];
        PostalCode <- map["PostalCode"];
        CountryName <- map["CountryName"];
        CountryIso2 <- map["CountryIso2"];
        CountryIso3 <- map["CountryIso3"];
        CountryIsoNumber <- map["CountryIsoNumber"];
        SortingNumber1 <- map["SortingNumber1"];
        SortingNumber2 <- map["SortingNumber2"];
        Barcode <- map["Barcode"];
        POBoxNumber <- map["POBoxNumber"];
        Label <- map["Label"];
        AddressType <- map["Type"];
        DataLevel <- map["DataLevel"];
        Field1 <- map["Field1"];
        Field2 <- map["Field2"];
        Field3 <- map["Field3"];
        Field4 <- map["Field4"];
        Field5 <- map["Field5"];
        Field6 <- map["Field6"];
        Field7 <- map["Field7"];
        Field8 <- map["Field8"];
        Field9 <- map["Field9"];
        Field10 <- map["Field10"];
        Field11 <- map["Field11"];
        Field12 <- map["Field12"];
        Field13 <- map["Field13"];
        Field14 <- map["Field14"];
        Field15 <- map["Field15"];
        Field16 <- map["Field16"];
        Field17 <- map["Field17"];
        Field18 <- map["Field18"];
        Field19 <- map["Field19"];
        Field20 <- map["Field20"];
        Error <- map["Error"];
        Cause <- map["Cause"];
        Resolution <- map["Resolution"];
        Description <- map["Description"];
    }
    
    func getError() -> ResponseError{
        return ResponseError(retrieveResponseItem: self);
    }
}
