Bridge.Debug = function(type, name, version)
    if not Bridge.DebugMode then return end
    print(('[^2BRIDGE^0] ^1Loaded %s^0 ^5%s^0 %s'):format(type, name, version and version or ''))
end