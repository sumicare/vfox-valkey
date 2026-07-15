--- Compiles Valkey from source after extraction
--- @param ctx table Context object with rootPath field
function PLUGIN:PostInstall(ctx)
    local rootPath = ctx.rootPath

    local build_cmd = string.format(
        'cd "%s" && make BUILD_TLS=yes PREFIX="%s" install',
        rootPath, rootPath
    )

    print("Compiling Valkey from source...")
    local result = os.execute(build_cmd)

    if not result or result ~= 0 and result ~= true then
        error("Failed to compile Valkey. Make sure you have a C compiler (gcc/clang) and make installed.")
    end

    local cleanup_cmd = string.format(
        'cd "%s" && rm -rf src deps tests runtest runtest-cluster runtest-sentinel runtest-moduleapi sentinel.conf valkey.conf Makefile 2>/dev/null',
        rootPath
    )
    os.execute(cleanup_cmd)

    print("Valkey compiled successfully!")
end
