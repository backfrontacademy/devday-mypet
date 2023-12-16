// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let homeResponse = try HomeResponse(json)

import Foundation

// MARK: - HomeResponse
struct HomeResponse: Codable {
    let user: User
    let petSection: PetSection
    let upcomingEvents: UpcomingEvents
    let suggestions: Suggestions
}

// MARK: HomeResponse convenience initializers and mutators

extension HomeResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(HomeResponse.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        user: User? = nil,
        petSection: PetSection? = nil,
        upcomingEvents: UpcomingEvents? = nil,
        suggestions: Suggestions? = nil
    ) -> HomeResponse {
        return HomeResponse(
            user: user ?? self.user,
            petSection: petSection ?? self.petSection,
            upcomingEvents: upcomingEvents ?? self.upcomingEvents,
            suggestions: suggestions ?? self.suggestions
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PetSection
struct PetSection: Codable {
    let title: String
    let pets: [Pet]
}

// MARK: PetSection convenience initializers and mutators

extension PetSection {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PetSection.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        title: String? = nil,
        pets: [Pet]? = nil
    ) -> PetSection {
        return PetSection(
            title: title ?? self.title,
            pets: pets ?? self.pets
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Pet
struct Pet: Codable {
    let name, type: String
    let age: Double
    let photo: String
}

// MARK: Pet convenience initializers and mutators

extension Pet {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Pet.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        type: String? = nil,
        age: Double? = nil,
        photo: String? = nil
    ) -> Pet {
        return Pet(
            name: name ?? self.name,
            type: type ?? self.type,
            age: age ?? self.age,
            photo: photo ?? self.photo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Suggestions
struct Suggestions: Codable {
    let title: String
    let items: [Item]
}

// MARK: Suggestions convenience initializers and mutators

extension Suggestions {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Suggestions.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        title: String? = nil,
        items: [Item]? = nil
    ) -> Suggestions {
        return Suggestions(
            title: title ?? self.title,
            items: items ?? self.items
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Item
struct Item: Codable {
    let name, nextDate, iconImage, color: String
}

// MARK: Item convenience initializers and mutators

extension Item {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Item.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        nextDate: String? = nil,
        iconImage: String? = nil,
        color: String? = nil
    ) -> Item {
        return Item(
            name: name ?? self.name,
            nextDate: nextDate ?? self.nextDate,
            iconImage: iconImage ?? self.iconImage,
            color: color ?? self.color
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - UpcomingEvents
struct UpcomingEvents: Codable {
    let title: String
    let events: [Event]
}

// MARK: UpcomingEvents convenience initializers and mutators

extension UpcomingEvents {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UpcomingEvents.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        title: String? = nil,
        events: [Event]? = nil
    ) -> UpcomingEvents {
        return UpcomingEvents(
            title: title ?? self.title,
            events: events ?? self.events
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Event
struct Event: Codable {
    let type, date, address, photo: String

    enum CodingKeys: String, CodingKey {
        case type, date
        case address = "Address"
        case photo
    }
}

// MARK: Event convenience initializers and mutators

extension Event {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Event.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: String? = nil,
        date: String? = nil,
        address: String? = nil,
        photo: String? = nil
    ) -> Event {
        return Event(
            type: type ?? self.type,
            date: date ?? self.date,
            address: address ?? self.address,
            photo: photo ?? self.photo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - User
struct User: Codable {
    let id: String
    let notifications: Int
    let email: String
}

// MARK: User convenience initializers and mutators

extension User {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(User.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String? = nil,
        notifications: Int? = nil,
        email: String? = nil
    ) -> User {
        return User(
            id: id ?? self.id,
            notifications: notifications ?? self.notifications,
            email: email ?? self.email
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
