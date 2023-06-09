// Copyright Dave Verwer, Sven A. Schmidt, and other contributors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import Foundation


extension SPI {
    struct Package: Codable {
        var name: String
        var description: String
        var swiftCompatibility: String
        var platformCompatibility: [String]
        var activity: String
        var authors: String
        var license: String
        var stars: String
        var url: String

        init(from package: APIPackage) {
            self.name = package.title
            self.description = package.summary // TODO: populate from GPT
            self.swiftCompatibility = package.swiftVersionCompatibility.sorted().first.map { "\($0.major).\($0.minor)+" } ?? "unknown"
            self.platformCompatibility = package.platformCompatibility.map(\.rawValue)
            self.activity = package.activityClause
            self.authors = package.authorClause
            self.license = package.license.shortName
            self.stars = "\(package.stars)" // TODO: thousand separator formatting
            self.url = package.url
        }
    }
}
