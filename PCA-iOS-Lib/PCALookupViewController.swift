import UIKit
import Alamofire
import CoreLocation

public class PCALookupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public init(licenseKey: String) {
        self.key = licenseKey;
        let podBundle = Bundle(path: Bundle(for: PCALookupViewController.self).path(forResource: "PCAiOSLib", ofType: "bundle")!)

        
        super.init(nibName: "PCALookupView", bundle: podBundle)
    }
    
    
    var addressCache: [String: FindResponse] = [:];
    
    
    func flushFindCache(){
        self.addressCache = [:];
    }
    
    @IBAction func cancelAddressSearch() {
        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func searchValueChanged(_ sender: Any) {
        let newText: String = searchField.text!;
        
        let isBackspace = ((lastText ?? "").count) > newText.count;
        if(isBackspace){
            currentItem = nil;
        }
        lastText = newText;
        if(newText == ""){
            currentResponse = nil;
            //outputTable.reloadData();
            let range = NSMakeRange(0, self.outputTable.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            self.outputTable.reloadSections(sections as IndexSet, with: .automatic)
            
        }else{
            MakeFindRequest();
        }
        
    }
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var outputTable: UITableView!
    @IBOutlet weak var searchField: UITextField!
    
    
    func bolden(text: NSString, highlight: NSString, isDescription: Bool)->NSAttributedString{
        //Create the new string and bold attribute to apply
        let attributedString = NSMutableAttributedString(string: text as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15.0)])
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15.0)]
        
        //seperate the highlight array by semicolon first
        let highlightSeperateArr = highlight.components(separatedBy: ";");
        
        if (highlightSeperateArr.count > 0 && isDescription == false || highlightSeperateArr.count > 1 && isDescription == true) {
            
            //Check if we should be using the description highlights
            var i = 0;
            if(isDescription) {
                i = 1;
            }
            //Seperate the highlight string into an array of highlights
            let highlightArr = highlightSeperateArr[i].components(separatedBy: ",");
            
            //Loop though the highlights
            for h in highlightArr {
                //Seperate the highlights into start and end numbers, converting them to int
                let highlightNumbers = h.components(separatedBy: "-").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                
                if (highlightNumbers.count == 2) {
                    //Location is where the highlight should start from
                    let location = highlightNumbers[0];
                    //Work out for how many characters the highlight should be
                    let length = highlightNumbers[1] - highlightNumbers[0];
                    
                    //Build the range object
                    let range = NSRange(location: location, length: length);
                    
                    //Apply the bold attribute to the string, based on the range
                    attributedString.addAttributes(boldFontAttribute, range: range);
                }
            }
        }
        
        // Return the attributed string
        return attributedString
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var manager: Alamofire.SessionManager? = nil;
    let locationManager = CLLocationManager()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if let bgColor = self.addressDelegate?.pca_backgroundColor?() {
            self.view?.backgroundColor = bgColor;
        }
        
        if (self.topConstraint != nil) {
            let cont = UIApplication.shared.keyWindow?.rootViewController;
            self.topConstraint.constant += (cont?.topLayoutGuide.length)!;
        }
        
        
        registerForKeyboardNotifications();
        manager = Alamofire.SessionManager();
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        searchField.becomeFirstResponder()
    }
    
    public var addressDelegate:PCALookupViewDelegate?
    
    
    var currentResponse: FindResponse? = nil;
    var currentItem: FindResponseItem? = nil;
    var lastText: String? = nil;
    
    
    public func isValid() -> Bool{
        //TODO -- Check for errors - no credit, bad key, no network connection etc
        
        if !Reachability.isInternetAvailable() {
            return false;
        }
        
        return true;
    }
    
    
    var key: String = "";
    let host: String = "api.addressy.com";
    
    func MakeFindRequest(){
        
        let lat = locationManager.location?.coordinate.latitude;
        let long = locationManager.location?.coordinate.longitude;
        
        var url = "https://" + host + "/capture/interactive/find/v1.00/json3.ws?key=" + key + "&Text=" + searchField.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!;
        if(currentItem != nil){
            url += "&container=" + (currentItem?.Id!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!;
        }
        
        if(lat != nil && long != nil){
            url += "&origin=\(lat!),\(long!)"
        }
        
        
        if let cachedResponse = self.addressCache[url] {
            self.currentResponse = cachedResponse;
            self.outputTable.reloadData();
        }else{
            
            manager?.request(url)
                .responseObject { (response: DataResponse<FindResponse>) in
                    
                    let fetchResponse = response.result.value;
                    
                    if fetchResponse?.Items?.count == 1 && fetchResponse?.Items?.first?.Error != nil {
                        //PCA Error
                        self.addressDelegate?.pca_didRecieveError?(error: (fetchResponse?.Items?.first?.getError())!)
                        return;
                    }
                    
                    if(fetchResponse != nil){
                        self.addressCache[url] = fetchResponse;
                        self.currentResponse = fetchResponse!;
                        //self.outputTable.reloadData();
                        let range = NSMakeRange(0, self.outputTable.numberOfSections)
                        let sections = NSIndexSet(indexesIn: range)
                        self.outputTable.reloadSections(sections as IndexSet, with: .automatic)
                        
                    }
            }
            
        }
        
    }
    
    func MakeRetrieveRequest(id: String){
        var url = "https://" + host + "/capture/interactive/retrieve/v1.00/json3.ws?key=" + key + "&id=" + id.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!;
        
        if let extraFormats = self.addressDelegate?.pca_extraFieldFormats?(){
            for i in 0 ..< (extraFormats.count) {
                let format = extraFormats[i];
                url += "&Field" + String(i + 1) + "Format=" + format.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!;
            }
        }
        
        print(url);
        Alamofire.request(url)
            .responseObject { (response: DataResponse<RetrieveResponse>) in
                
                let retrieveResponse = response.result.value;
                
                if retrieveResponse?.Items?.count == 1 && retrieveResponse?.Items?.first?.Error != nil {
                    //PCA Error
                    self.addressDelegate?.pca_didRecieveError?(error: (retrieveResponse?.Items?.first?.getError())!)
                    return;
                }
                
                let retrieveResponseItem = retrieveResponse?.Items?.first;
                
                self.addressDelegate?.didRecieveAddress(address: retrieveResponseItem!);
                
                self.dismiss(animated: true);
                
        }
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentResponse?.Items?.count ?? 0;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let currentItem = self.currentResponse?.Items?[indexPath.item] {
            
            if let newCell = self.addressDelegate?.pca_cellForFindResponse?(findResponse: currentItem){
                return newCell;
            }else{
                let newCell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
                newCell.textLabel!.attributedText = bolden(text: currentItem.Text! as NSString, highlight: currentItem.Highlight! as NSString, isDescription: false);
                newCell.detailTextLabel!.attributedText = bolden(text: currentItem.Description! as NSString, highlight: currentItem.Highlight! as NSString, isDescription: true);
                if let backgroundColor = self.addressDelegate?.pca_cellBackgroundColor?(findResponse: currentItem) {
                    newCell.backgroundColor = backgroundColor;
                }
                if let textColor = self.addressDelegate?.pca_cellTextColor?(findResponse: currentItem){
                    newCell.textLabel?.textColor = textColor;
                    newCell.detailTextLabel?.textColor = textColor;
                }
                
                return newCell;
            }
        }
        return UITableViewCell(style: .subtitle, reuseIdentifier: "");
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentItem = self.currentResponse?.Items?[indexPath.item];
        if(currentItem?.ItemType == "Address"){
            MakeRetrieveRequest(id: (currentItem?.Id)!)
        }else{
            MakeFindRequest()
        }
    }
    
    @objc func keyboardWasShown(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let insets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0);
            self.outputTable.contentInset = insets;
            self.outputTable.scrollIndicatorInsets = insets;
        }
    }
    
    @objc func keyboardWasHidden(notification: NSNotification){
        let insets = UIEdgeInsets.zero
        self.outputTable.contentInset = insets;
        self.outputTable.scrollIndicatorInsets = insets;
    }
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
}
