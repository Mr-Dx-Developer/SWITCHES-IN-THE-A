function Show(title, content)
    SendNUIMessage({
        action = "open",
        title = title,
        content = content
    })
end

function Close()
    SendNUIMessage({
        action = "close",
    })
end

exports("Show", Show)
exports("Close", Close)