//
//  YiUUID.swift
//  YiUUID
//
//  Created by coderyi on 2020/11/28.
//

import UIKit
import KeychainAccess

open class YiUUID {
    
    static let shared = YiUUID()
    
    private var uuidMap: [String: String] = [:]
    var _uuidForSession: String = ""
    var _uuidForInstallation: String = ""
    let _uuidForInstallationKey: String = "yi_uuidForInstallation"
    var _uuidForDevice: String = ""
    let _uuidForDeviceKey: String = "yi_uuidForDevice";
    var _defaultService: String?

    open class func uuid() -> String {
        return shared.uuid()
    }
    
    open class func uuidForKey(_ key: String) -> String {
        return shared.uuidForKey(key)
    }
    
    open class func uuidForSession() -> String {
        return shared.uuidForSession()
    }
    
    open class func uuidForInstallation() -> String {
        return shared.uuidForInstallation()
    }

    open class func uuidForVendor() -> String {
        return shared.uuidForVendor()
    }

    open class func uuidForDevice() -> String {
        return shared.uuidForDevice()
    }

    open func uuid() -> String {
        let uuid = UUID().uuidString.lowercased().replacingOccurrences(of: "-", with: "")
        return uuid
    }
    
    open func uuidForKey(_ key: String) -> String {
        var uuidValue = uuidMap[key];
        if uuidValue == nil {
            uuidValue = uuid()
            uuidMap[key] = uuidValue
        }
        return uuidValue ?? ""
    }
    
    open func uuidForSession() -> String {
        if _uuidForSession == "" {
            _uuidForSession = uuid()
        }
        return _uuidForSession
    }
    
    open func uuidForInstallation() -> String {
        if _uuidForInstallation == "" {
            _uuidForInstallation = _getOrCreateValueForKey(_uuidForInstallationKey, defaultValue: nil, userDefaults: true, keychain: false, service: nil, accessGroup: nil)
        }
        return _uuidForInstallation
    }
    
    open func uuidForVendor() -> String {
        guard let uuid = UIDevice.current.identifierForVendor?.uuidString.lowercased().replacingOccurrences(of: "-", with: "") else { return "" }
        return uuid
    }

    open func uuidForDevice() -> String {
        if _uuidForDevice == "" {
            _uuidForDevice = _getOrCreateValueForKey(_uuidForDeviceKey, defaultValue: nil, userDefaults: true, keychain: true, service: nil, accessGroup: nil)
        }
        return _uuidForDevice
    }
    
    open func uuidForDevice_updateWithValue(_ value: String) -> Void {
        _uuidForDevice = value
        _setValue(_uuidForDevice, key: _uuidForDeviceKey, userDefaults: true, keychain: true, service: nil, accessGroup: nil)
    }

    
    open func _getOrCreateValueForKey(_ key: String, defaultValue: String?, userDefaults: Bool, keychain: Bool, service: String?, accessGroup: String?) -> String {
        var value: String?
        value = _getValueForKey(key, userDefaults: userDefaults, keychain: keychain, service: service, accessGroup: accessGroup)
        if value == nil || value == "" {
            value = defaultValue
        }
        if value == nil || value == "" {
            value = uuid()
        }
        _setValue(value ?? "", key: key, userDefaults: userDefaults, keychain: keychain, service: service, accessGroup: accessGroup)
        return value ?? ""
    }

    open func _getValueForKey(_ key: String, userDefaults: Bool, keychain: Bool, service: String?, accessGroup: String?) -> String {
        var value: String?

        if (value != nil && keychain) {
            let keychain: Keychain
            if accessGroup == nil {
                keychain = Keychain(service: service ?? defaultService())
            } else {
                keychain = Keychain(service: service ?? defaultService(), accessGroup: accessGroup ?? "")
            }
            value = keychain[key]
        }

        if (value != nil && userDefaults) {
            value = UserDefaults.standard.string(forKey: key)
        }
        return value ?? ""
    }
    
    open func _setValue(_ value: String, key: String, userDefaults: Bool, keychain: Bool, service: String?, accessGroup: String?) -> Void {
        if (value != nil && userDefaults) {
            UserDefaults.standard.setValue(value, forKey: key)
            UserDefaults.standard.synchronize()
        }
        if (value != nil && keychain) {
            let keychain: Keychain
            if accessGroup == nil {
                keychain = Keychain(service: service ?? defaultService())
            } else {
                keychain = Keychain(service: service ?? defaultService(), accessGroup: accessGroup ?? "")
            }
            keychain[key] = value
        }
    }

    open func defaultService() -> String {
        if _defaultService == nil {
            _defaultService = Bundle.main.bundleIdentifier ?? ""
        }
        return _defaultService ?? ""
    }
}
