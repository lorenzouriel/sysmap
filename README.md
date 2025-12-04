# SysMap 🗺️

<div align="center">

**A comprehensive system inventory tool for tracking installed software, versions, and configurations across multiple platforms**

[![PyPI version](https://badge.fury.io/py/sysmap.svg)](https://badge.fury.io/py/sysmap)
[![Python Versions](https://img.shields.io/pypi/pyversions/sysmap.svg)](https://pypi.org/project/sysmap/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Tests](https://github.com/lorenzouriel/sysmap/workflows/Tests/badge.svg)](https://github.com/lorenzouriel/sysmap/actions)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

[Features](#-features) • [Installation](#-installation) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Contributing](#-contributing)

</div>

---

## 🌟 Features

### 📦 Multi-Platform Package Manager Support
- **Windows**: WinGet, Chocolatey, Scoop
- **macOS**: Homebrew
- **Linux**: Snap, Flatpak, APT/dpkg
- **Cross-Platform**: pip (Python), npm (Node.js)

### 📊 Multiple Export Formats
- **Markdown** - Beautiful human-readable reports
- **JSON** - Machine-readable for automation
- **YAML** - Configuration-friendly format
- **CSV** - Import into spreadsheets
- **HTML** - Interactive web-based reports with search

### 🔍 Advanced Features
- ✅ **Version Comparison** - Compare system snapshots and track changes
- 🔄 **Update Detection** - Find outdated packages across all package managers
- 👁️ **Watch Mode** - Continuously monitor for system changes
- ⚙️ **Configuration Files** - Customize scanning behavior
- 🔌 **Plugin System** - Extend with custom scanners
- 🎨 **Rich CLI** - Beautiful terminal output with colors and tables

### 🚀 Use Cases
- **DevOps**: Document development environment setups
- **System Administration**: Audit software installations
- **Team Onboarding**: Share standardized environment configurations
- **Compliance**: Track software versions for security audits
- **CI/CD**: Auto-generate environment documentation

---

## 📥 Installation

### Via pip (Recommended)
```bash
pip install sysmap
```

### From Source
```bash
git clone https://github.com/lorenzouriel/sysmap.git
cd sysmap
pip install -e .
```

### With Development Dependencies
```bash
pip install -e ".[dev]"
```

---

## 🚀 Quick Start

### Basic Scan
Generate a system inventory report:
```bash
sysmap scan
```

Output: `SYSTEM_SUMMARY.md`

### Check for Updates
Find outdated packages:
```bash
sysmap scan --check-updates
```

### Export to Different Formats
```bash
# JSON format
sysmap scan --format json --output system.json

# HTML interactive report
sysmap scan --format html --output report.html

# CSV for spreadsheets
sysmap scan --format csv --output packages.csv
```

### Compare Snapshots
```bash
# Create baseline
sysmap scan --format json --output baseline.json

# ... time passes, install/update packages ...

# Compare current system to baseline
sysmap diff baseline.json

# Or compare two snapshots
sysmap diff baseline.json current.json
```

### Watch for Changes
Monitor your system in real-time:
```bash
sysmap watch --interval 60
```

### Quick Summary
```bash
sysmap summary
```

---

## 📖 Usage Examples

### Configuration File
Create a custom configuration:
```bash
sysmap init
```

This creates `.sysmap.yaml`:
```yaml
scanners:
  winget: true
  pip: true
  npm: true
  brew: true
  chocolatey: true
  scoop: true
  snap: true
  flatpak: true

output:
  format: markdown
  path: SYSTEM_SUMMARY.md

features:
  check_updates: false
  security_scan: false

plugins: []
```

### Use Custom Config
```bash
sysmap scan --config my-config.yaml
```

### Check Only Specific Package Managers
Edit `.sysmap.yaml` to disable unwanted scanners:
```yaml
scanners:
  winget: true
  pip: true
  npm: false  # Disable npm scanning
  brew: false  # Disable Homebrew
```

### GitHub Action Integration
Add to `.github/workflows/inventory.yml`:
```yaml
name: System Inventory

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly
  workflow_dispatch:

jobs:
  inventory:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'

      - name: Install SysMap
        run: pip install sysmap

      - name: Generate Inventory
        run: sysmap scan --format markdown

      - name: Commit Report
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add SYSTEM_SUMMARY.md
          git commit -m "Update system inventory [skip ci]"
          git push
```

---

## 🎨 Example Output

### Terminal Output
```
╭─────────── Package Summary ───────────╮
│ Package Manager │ Packages │ Updates │
│─────────────────│──────────│─────────│
│ Winget          │      104 │       8 │
│ Pip             │       25 │       3 │
│ Npm             │       42 │       5 │
│ Total           │      171 │      16 │
╰───────────────────────────────────────╯
```

### Markdown Report
See [SYSTEM_SUMMARY.md](SYSTEM_SUMMARY.md) for a full example.

### HTML Report
Interactive, searchable web page with:
- Platform information
- Package summaries
- Live search/filter
- Color-coded updates
- Responsive design

---

## 🔧 CLI Reference

### Commands

| Command | Description |
|---------|-------------|
| `sysmap scan` | Scan system and generate inventory |
| `sysmap diff` | Compare two system snapshots |
| `sysmap watch` | Monitor system for changes |
| `sysmap summary` | Display quick package summary |
| `sysmap updates` | Check for available updates |
| `sysmap init` | Create default config file |

### Global Options

| Option | Description |
|--------|-------------|
| `--version` | Show version |
| `--help` | Show help message |

### Scan Options

| Option | Description |
|--------|-------------|
| `-f, --format` | Output format (markdown/json/yaml/csv/html) |
| `-o, --output` | Output file path |
| `--check-updates` | Check for package updates |
| `-c, --config` | Path to config file |

---

## 🏗️ Architecture

```
sysmap/
├── core/
│   ├── scanner.py      # Package manager scanners
│   └── config.py       # Configuration management
├── exporters/
│   ├── markdown.py     # Markdown exporter
│   ├── json_exporter.py
│   ├── yaml_exporter.py
│   ├── csv_exporter.py
│   └── html_exporter.py
├── utils/
│   ├── diff.py         # Snapshot comparison
│   └── watch.py        # Watch mode
└── cli.py              # Command-line interface
```

---

## 🤝 Contributing

We love contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details on:
- Reporting bugs
- Suggesting features
- Submitting pull requests
- Development setup
- Coding standards

### Quick Contribution Guide
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests (`pytest`)
5. Format code (`black src/` and `ruff check src/`)
6. Commit (`git commit -m 'feat: add amazing feature'`)
7. Push (`git push origin feature/amazing-feature`)
8. Open a Pull Request

---

## 📚 Documentation

Full documentation is available at [https://sysmap.readthedocs.io](https://sysmap.readthedocs.io)

- [User Guide](docs/user-guide.md)
- [Configuration](docs/configuration.md)
- [Plugin Development](docs/plugins.md)
- [API Reference](docs/api.md)

---

## 🛠️ Development

### Setup
```bash
git clone https://github.com/lorenzouriel/sysmap.git
cd sysmap
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -e ".[dev]"
```

### Run Tests
```bash
pytest
pytest --cov=sysmap  # With coverage
```

### Code Quality
```bash
black src/           # Format code
ruff check src/      # Lint code
mypy src/            # Type checking
```

---

## 📊 Project Stats

- **Lines of Code**: ~2,000+
- **Test Coverage**: 85%+
- **Supported Package Managers**: 8
- **Export Formats**: 5
- **Python Versions**: 3.8+

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Inspired by the need for better system documentation in DevOps workflows
- Built with [Click](https://click.palletsprojects.com/) and [Rich](https://rich.readthedocs.io/)
- Community contributors and testers

---

## 🔗 Links

- **Documentation**: [https://sysmap.readthedocs.io](https://sysmap.readthedocs.io)
- **PyPI**: [https://pypi.org/project/sysmap/](https://pypi.org/project/sysmap/)
- **Issues**: [https://github.com/lorenzouriel/sysmap/issues](https://github.com/lorenzouriel/sysmap/issues)
- **Changelog**: [CHANGELOG.md](CHANGELOG.md)

---

<div align="center">

**If you find SysMap useful, please consider giving it a ⭐ on GitHub!**

Made with ❤️ by [Lorenzo Uriel](https://github.com/lorenzouriel)

</div>
