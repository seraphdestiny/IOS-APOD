import UIKit
class NasaController {

    static let shared = NasaController()
    func get_image(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    var start_date = "2018-12-01"
    var end_date = "2018-12-02"

    var api_Str = "https://api.nasa.gov/planetary/apod?api_key=PO7fCEXK1zjTBvQ4zJNI3N5MkHPOvLh7dQHQOdVF&start_date=2018-08-01&end_date=2018-08-05"
    
    func get_api_Str() -> String {
        return  "https://api.nasa.gov/planetary/apod?api_key=PO7fCEXK1zjTBvQ4zJNI3N5MkHPOvLh7dQHQOdVF&start_date="+start_date+"&end_date="+end_date
    }
    func set_date(s_date:String,e_date:String){
        start_date = s_date
        end_date = e_date
    }
    
    var nasaArray = [Nasa]()
    func get_songs(completion: @escaping ([Nasa]?) -> Void) {
        api_Str = get_api_Str()
        if let urlStr = api_Str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            //print(urlStr)
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data, let resultArray = (try? JSONSerialization.jsonObject(with: data,options: [])) as? [[String: Any]] {
                    print(resultArray)
                    for nasaDic in resultArray {
                        if let nasa = Nasa(json: nasaDic as! [String : String]) {
                            self.nasaArray.append(nasa)
                        }
                    }
                    completion(self.nasaArray)
                }
            }
            task.resume()
        }
    }
}
