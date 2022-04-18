//
//  FavList.swift
//  Location App
//
//  Created by student on 3/23/22.
//

import SwiftUI

class FavList: ObservableObject {
    @Published var favorites = [Favorite]()
    init()
    {
        favorites = FavList.loadPlayerData()
    }
    static func loadPlayerData() -> [Favorite]
    {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("Favorites").appendingPathExtension("plist")
        return FavList.unarchivePlayers(url: archiveURL)
    }
    static func unarchivePlayers(url: URL) -> [Favorite]
    {
        var codedList: Data
        do
        {
            codedList = try Data(contentsOf: url)
        }
        catch
        {
            print(error)
            return FavList.defaultList()
        }
        let propertyListDecoder = PropertyListDecoder()
        do
        {
            let list = try propertyListDecoder.decode(Array<Favorite>.self, from: codedList)
            return list
        }
        catch
        {
            print(error)
        }
        return FavList.defaultList()
    }
    func archiveFavs()
    {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("Favorites").appendingPathExtension("plist")
        let propertyListEncoder = PropertyListEncoder()
        var codedList: Data
        do
        {
            codedList = try propertyListEncoder.encode(favorites)
        }
        catch
        {
            print(error)
            return
        }
        do
        {
            try codedList.write(to: archiveURL, options: .noFileProtection)
        }
        catch
        {
            print(error)
        }
    }
    static func defaultList() -> [Favorite]
    {
        return [Favorite(name: "Arizona State University", longitude: 33.4242, latitude: 111.9281, description: "Located in beautiful sunny Tempe Arizona")]
    }
    func add(item: Favorite)
    {
        favorites.append(item)
    }
    func refresh()
    {
        favorites = FavList.loadPlayerData()
    }
     
 
  
  


}
