# vfox-valkey

A [vfox](https://github.com/version-fox/vfox) plugin for [Valkey](https://valkey.io/).

Based on [vfox-redis](https://github.com/mise-plugins/vfox-redis/).

## Requirements

This plugin compiles Valkey from source, so you need:

- C compiler (gcc or clang)
- make

### macOS

```bash
xcode-select --install
```

### Ubuntu/Debian

```bash
sudo apt-get install build-essential
```

### Fedora/RHEL

```bash
sudo dnf groupinstall "Development Tools"
```

## Installation

```bash
mise use -g valkey@latest
```

Or add to your `mise.toml`:

```toml
[tools]
valkey = "latest"
```

## Usage

After installation, the following Valkey binaries are available:

- `valkey-server` - The Valkey server
- `valkey-cli` - The Valkey command line interface
- `valkey-benchmark` - Valkey benchmarking utility
- `valkey-check-aof` - AOF file checker
- `valkey-check-rdb` - RDB file checker
- `valkey-sentinel` - Valkey sentinel

Valkey also installs `redis-*` compatibility symlinks for all of the above.

Start a Valkey server:

```bash
valkey-server
```

Connect with the CLI:

```bash
valkey-cli
```

## License

MIT 
