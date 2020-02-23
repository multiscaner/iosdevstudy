import UIKit

//class Owner {
//    var pet: Pet
//
//    init(pet: Pet) {
//        self.pet = pet
//    }
//}
//
//class Pet {
//    let name: String
//    var owner: Owner?
//    var antistress: () -> String
//    init(name: String) {
//        self.name = name
////        self.antistress = { [unowned self] in
////            guard let self = self else { return }
////            print(self.name)
////        }
//    }
//
////}
//
//var dog = Pet (name: "Jack")
//var owner = Owner(pet: dog)
//dog.owner = owner

//Protocol

protocol Default {
   
}
extension Default {
    func sampleFunc() {
//       print("Print")
       }
}

protocol RemoteControl {
    func switchDevice()
    
    init(numberOfButtons: Int)
    
    var numberOfButtons: Int { get set }
    var hasVolumeButton: Bool { get }
}

extension RemoteControl {
func switchDevice() {
    print(numberOfButtons + 100)
}
}
class TVRemote: RemoteControl, Default {
    required init(numberOfButtons: Int) {
        self.numberOfButtons = numberOfButtons
    }
    
    var hasVolumeButton: Bool = true
    
    var numberOfButtons: Int = 0
    
    func switchDevice() {
//        print("switch")
    }
}

var remote = TVRemote(numberOfButtons: 4)
remote.switchDevice()

func buy(remote: RemoteControl) {
    let r = remote
    r.switchDevice()
    r.numberOfButtons
    print(r.numberOfButtons)
}

struct CarRemote: RemoteControl {
    func switchDevice() {
//        print("Switch")
    }
    
    init(numberOfButtons: Int) {
        self.numberOfButtons = numberOfButtons
        hasVolumeButton = false
    }
    
    var numberOfButtons: Int
    
    var hasVolumeButton: Bool
}

var carKey = CarRemote(numberOfButtons: 2)

buy(remote: carKey)
buy(remote: remote)

enum MyEnum: Default {
    case first
}
MyEnum.first.sampleFunc()

func Cast(remote: AnyObject) {
    guard let control = remote as? Default else { return }
    control.sampleFunc()
}

protocol DataSource {
    func data() -> String
}

protocol Delegate {
    func react()
}

class TableView {
    var dataSource: DataSource?
    var delegate: Delegate?
    
    func callDelegate() {
        delegate?.react()
    }
    
    func getData() {
//        print(dataSource?.data() ?? "World")
    }
}

class SampleData: DataSource {
    func data() -> String {
        "Hello"
    }
}

class SampleDelegate: Delegate {
    func react() {
//        print("React")
    }
    
}

let tableView = TableView()
//tableView.dataSource = SampleData()
//tableView.delegate = SampleDelegate()
//
//tableView.callDelegate()
//tableView.getData()
