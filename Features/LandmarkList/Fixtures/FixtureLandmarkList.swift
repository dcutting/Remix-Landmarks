@objc(FixtureLandmarkList)

public class FixtureLandmarkList: NSObject {
    
    var input = ""
    var output: NSString?
    
    public func execute() {
        if input == "hello" {
            output = "world"
        } else {
            output = input as NSString
        }
    }
}
