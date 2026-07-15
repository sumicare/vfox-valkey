--- Returns download information for a specific Valkey version
--- @param ctx table Context object with version field
--- @return table Download info with version, url, and optional note
function PLUGIN:PreInstall(ctx)
    local version = ctx.version

    return {
        version = version,
        url = "https://github.com/valkey-io/valkey/archive/refs/tags/" .. version .. ".tar.gz",
        note = "Downloading Valkey " .. version .. " source...",
    }
end
