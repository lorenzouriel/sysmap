# SysMap Documentation

Welcome to **SysMap** - A comprehensive system inventory tool for tracking installed software, versions, and configurations across multiple platforms.

## What is SysMap?

SysMap is a powerful command-line tool that helps you:

- 📦 **Track installed packages** across multiple package managers (WinGet, pip, npm, Homebrew, and more)
- 📊 **Generate reports** in multiple formats (Markdown, JSON, YAML, CSV, HTML)
- 🔍 **Compare system snapshots** to detect changes over time
- 🔄 **Check for updates** across all package managers
- 👁️ **Monitor systems** continuously with watch mode
- ⚙️ **Customize scanning** with configuration files

## Quick Example

```bash
# Install SysMap
pip install sysmap

# Generate a system inventory
sysmap scan

# Check for updates
sysmap scan --check-updates

# Compare snapshots
sysmap diff baseline.json current.json

# Watch for changes
sysmap watch --interval 60
```

## Key Features

### Multi-Platform Support
- **Windows**: WinGet, Chocolatey, Scoop
- **macOS**: Homebrew
- **Linux**: Snap, Flatpak, APT/dpkg
- **Cross-Platform**: pip (Python), npm (Node.js)

### Multiple Export Formats
- **Markdown** - Beautiful human-readable reports
- **JSON** - Machine-readable for automation
- **YAML** - Configuration-friendly format
- **CSV** - Import into spreadsheets
- **HTML** - Interactive web-based reports

### Advanced Features
- Version comparison and diff
- Update detection
- Watch mode for continuous monitoring
- Configurable scanning
- CI/CD integration

## Use Cases

### DevOps Teams
Document and standardize development environments across teams.

### System Administrators
Audit software installations and track changes.

### Onboarding
Share environment setups with new team members.

### Compliance
Track software versions for security audits.

## Getting Started

Check out our [Quick Start Guide](getting-started/quickstart.md) to begin using SysMap!

## Community

- [GitHub Repository](https://github.com/yourusername/sysmap)
- [Issue Tracker](https://github.com/yourusername/sysmap/issues)
- [Contributing Guide](contributing/guidelines.md)

## License

SysMap is released under the [MIT License](https://opensource.org/licenses/MIT).
