--- Returns all available versions of Valkey from GitHub releases
--- @param ctx table Context object
--- @return table Array of version objects with version and optional note fields
function PLUGIN:Available(ctx)
    local http = require("http")

    local resp, err = http.get({
        url = "https://api.github.com/repos/valkey-io/valkey/tags",
        headers = {
            ["Accept"] = "application/vnd.github+json",
        },
    })

    if err ~= nil then
        error("Failed to fetch Valkey tags: " .. err)
    end

    local results = {}
    local seen = {}

    for version in resp.body:gmatch('"name"%s*:%s*"(%d+%.%d+%.%d+)"') do
        if not seen[version] then
            seen[version] = true
            table.insert(results, {
                version = version,
                note = "",
            })
        end
    end

    local function parse_version(v)
        local major, minor, patch = v:match("^(%d+)%.(%d+)%.(%d+)$")
        return tonumber(major) or 0, tonumber(minor) or 0, tonumber(patch) or 0
    end

    table.sort(results, function(a, b)
        local a_major, a_minor, a_patch = parse_version(a.version)
        local b_major, b_minor, b_patch = parse_version(b.version)
        if a_major ~= b_major then return a_major > b_major end
        if a_minor ~= b_minor then return a_minor > b_minor end
        return a_patch > b_patch
    end)

    return results
end
