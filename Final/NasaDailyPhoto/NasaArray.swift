import Foundation

struct Nasa: Codable {
    var title: String
    var explanation: String
    var url: URL
    var copyright: String?
    var picture: String


    init?(json: [String: String]) {
        guard let title = json["title"],
            let explanation = json["explanation"],
            let urlString = json["url"],
            let picture = json["date"],
            let url = URL(string: urlString) else { return nil }

        self.title = title
        self.explanation = explanation
        self.url = url
        self.picture = picture
        self.copyright = json["copyright"]
    }


    struct NasaResults: Codable {
        var resultCount: Int
        var results: [Nasa]
    }
}
