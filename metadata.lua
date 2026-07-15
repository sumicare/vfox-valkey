PLUGIN = {}

PLUGIN.name = "valkey"
PLUGIN.version = "0.1.0"
PLUGIN.homepage = "https://github.com/valkey-io/valkey"
PLUGIN.license = "MIT"
PLUGIN.description = "Valkey - flexible distributed key-value datastore (Redis fork)"
PLUGIN.minRuntimeVersion = "0.3.0"
PLUGIN.notes = {
    "Compiles from source - requires C compiler (gcc/clang) and make",
}

PLUGIN.systemDependencies = {
    { bin = "cc", packages = { apt = "build-essential", dnf = "gcc" } },
    { bin = "make", packages = { brew = "make", apt = "build-essential", dnf = "make" } },
}
