
import UIKit
struct Videogame {
    let title:String
    var published:String
    var rating:Int
}

let cyberpunk = Videogame(title: "Cyberpunk 2077", published: "2020", rating: 5)
let titleKeyPath = \Videogame.title

print(cyberpunk[keyPath: titleKeyPath]) // Output: Cyberpunk 2077






func test<T>(keyPath : KeyPath<Videogame,T>){
    cyberpunk[keyPath: keyPath]
}


test(keyPath: \.published)

let games = [
    Videogame(title: "Cyberpunk 2077", published: "2020", rating: 999),
    Videogame(title: "Fallout 4", published: "2015", rating: 4),
    Videogame(title: "The Outer Worlds", published: "2019", rating: 4),
    Videogame(title: "RAGE", published: "2011", rating: 4),
    Videogame(title: "Far Cry New Dawn", published: "2019", rating: 4),
]
.holdMap(keyPath : \.published)

extension Array {
    func holdMap<Value>(keyPath : KeyPath<Element , Value>)->[Value]{
        map{$0[keyPath : keyPath]}
    }
}


struct ConfigratorB <Model>{
    let namePath : KeyPath<Model , String >
    let agePath : KeyPath<Model , Int >
    
    func getname(model : Model)->String {
        return model[keyPath:namePath]
    }
   
    
}

ConfigratorB<Videogame>.init(namePath: \.title, agePath: \.rating)
