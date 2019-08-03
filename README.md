# SicariiEncrypt v0.4
Sicarii is a prototype cryptographic swift cipher framework library which requires a minimum enviroment of swift 5 with iOS 12.2.

    v0.1 - Initial commit
    v0.2 - Bug fixed nad updated README
    v0.3 - Added passcode support and fixed a custom model bug.
    v0.4 - Hardened passcode to key conversion to generate more unique keys.

# Detail
Sicarii cipher can use either a key & model, key, passcode or passcode with model encryption. The key generated is a 8192 bit array and the model generated is a 4096 bit array. The passcode used must be at least 8 chars long.

    Encryption is achieved via constant multi directional dynamic transformations to ensure no simple substitution is applied.
    
    Passcode to key creation is achieved by a combination of (dynamic salting)+(char expansion)x2+(constant multi directional data transformations)+(sorting)+(normalization)x2


**YOU CAN FIND THE FRAMEWORK LOCATED IN THE PROJECT**

Sample input and ecrypted showing only using 0's and 1's.

<img src="https://thomaslockblog.files.wordpress.com/2019/07/screen-shot-2019-07-31-at-1.58.46-pm.png" alt="screen-shot-2019-07-31-at-1.58.46-pm" width="718" height="213" />

# Code Example

//Create instance
let sicarii: SicariiCipher = SicariiCipher()

//Generate 512 Key
let key = sicarii.generate512Key()

//Optionally generate model
let model = sicarii.generateModel()

// To Encrypt Data returns [UInt8]
let encrypted = sicarii.encrypt(ary: array, key: key, model: model)

// To Decrypt Data returns [UInt8]
let decrypted = sicarii.decrypt(ary: encrypted, key: key, model: model)

//Using Passcode
let sicarii: SicariiCipher = SicariiCipher()
let encrypted = sicarii.encrypt(ary: array, passcode: "passcode")
let decrypted = sicarii.decrypt(ary: encrypted, passcode: "passcode")
