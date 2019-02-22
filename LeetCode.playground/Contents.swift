import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (i, num) in nums.enumerated() {
        let result = target - num
        if nums.contains(result) {
            return [i, nums.index(of: result)!]
        }
    }
    return [0]
}

let nums0 = [3, 2, 4]
let nums1 = [3, 3]

twoSum(nums0, 6)
twoSum(nums1, 6)

//---------------分界线-----------------

var numbers = [20, 19, 7, 12]
print(numbers.sorted { $0 > $1 })
let mappedNumbers = numbers.map ({num in num * 3})
print(mappedNumbers)


//---------------分界线-----------------
enum Rank: String {
    case ace = "1"
    case two, three, four, five
    func simpleDescription() -> String{
        switch self {
        case .ace:
            return "ace"
        case .two:
            return "two"
        default:
            return "空"
        }
    }
}
let ace = Rank.three
ace.simpleDescription()
let aceRawValue = ace.rawValue

//---------------分界线-----------------
//枚举
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let failure = ServerResponse.failure("Out of cheese.")
let success = ServerResponse.result("6:00 am", "8:09 pm")

switch success {
case let .failure(message):
    print("Failure...  \(message)")
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
}

//---------------分界线-----------------
//结构体
struct Card {
    var rank : Rank
    func simpleDescription() -> String {
        return "the \(rank.simpleDescription())"
    }
}

let card = Card(rank: .two)
card.simpleDescription()

//---------------分界线-----------------
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


//---------------分界线-----------------
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])

let xiaoming = ("小明", (10, 100, 11.0, 22))
print(xiaoming.1.3)


let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print("1111")

var a = 10
a += 2

//---------------分界线-----------------
struct RectStruct {
    var height : Double
    var width : Double
    var long : Double
}

extension RectStruct : Equatable{
    static func == (left: RectStruct, right: RectStruct) -> Bool {
        return (left.height == right.height && left.long == right.long && left.width == right.width)
    }
}

var rectStructA = RectStruct(height: 111, width: 100, long: 400)
var rectStructB = rectStructA
if rectStructA != rectStructB {
    print("不相等")
} else {
    print("相等")
}
rectStructA.height = 100
print(rectStructB.height)
withUnsafePointer(to: &rectStructA) { print("\($0)") }
withUnsafePointer(to: &rectStructB) { print("\($0)") }

//---------------分界线-----------------
class Dog {
    var age = 0
    var long = 100
}

var dogA = Dog()
var dogB = dogA
dogB.age = 5

var dogC = Dog()
extension Dog : Equatable {
    static func == (left: Dog, right: Dog) -> Bool {
        return (left.age == right.age && left.long == right.long)
    }
}

print(dogA.age)
print(dogB.age)

dogC.age = 5
if dogC == dogA {
    print("dogA == dogC")
} else {
    print("dogA == dogC")
}

//---------------分界线-----------------

struct ResolutionStruct {
    var height = 0.0
    var width = 0.0
}

class ResolutionClass {
    var height = 0.0
    var width = 0.0
}

//值类型作为参数传入时，函数体内部不能修改其值
func test(sct: ResolutionStruct) {
    //错误: sct.height = 1000
    var resolution = sct
    resolution.height = 1000
}
//引用类型作为参数传入时，函数体内部不能修改其指向的内存地址，但是可以修改其内部的变量值
func test(cls: ResolutionClass) {
    cls.height = 1000
    //错误: cls = ResolutionClass()
    var clss = cls
    clss = ResolutionClass()
    clss.height = 1000
}

func swap(structt: ResolutionStruct) -> ResolutionStruct {
    var structt = structt
    withUnsafePointer(to: &structt) { print("正在交换: \($0)") }
    
    let temp = structt.height
    structt.height = structt.width
    structt.width = temp
    withUnsafePointer(to: &structt) { print("将要返回: \($0)") }
    return structt
}

var iPhone4ResoStruct = ResolutionStruct(height: 960, width: 640)

print(iPhone4ResoStruct)
withUnsafePointer(to: &iPhone4ResoStruct) { print("交换前: \($0)") }
print(swap(structt: iPhone4ResoStruct))
print(iPhone4ResoStruct)
withUnsafePointer(to: &iPhone4ResoStruct) { print("交换后: \($0)") }
