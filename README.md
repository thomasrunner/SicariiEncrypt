# SicariiEncrypt v0.2
Sicarii is a prototype cryptographic swift cipher framework library which requires a minimum enviroment of swift 5 with iOS 12.2.

# Detail
Sicarii cipher can use either a key & model or just key encryption. The key generated is a 512 byte UInt8 array and the model generated is a 256 byte UInt8 array.

Encryption is achieved via constant dynamic transformations to ensure no simple substitution is applied.

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
