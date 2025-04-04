A minimal build system template for Fortran 77 projects using Open Watcom compiler. Designed as a lightweight alternative to the Watcom IDE for simple academic projects.

# Getting Started
1. Install [Open Watcom F77](https://openwatcom.org/ftp/install/)
2. Verify environment variables:
   - Ensure these paths are in your `PATH`:
      - `.../watcom/binnt`
      - `.../watcom/binw`
   - Without this, you'll get: `'wfl386' is not recognized as an internal or external command`
3. Place project in a path that follows 8.3 naming rules:
   - Max 8 characters for folder names
   - Valid characters: ``A-Z 0-9 ! # $ % & ' ( ) - @ ^ _ ` { } ~``
   - No spaces or special characters (e.g., C:\F77LABS\PROJ1)

## Project Structure:
```
project_root/
├── .vscode/   # VS Code configs (critical)
├── src/       # Your .for or .inc source files
├── out/       # Build outputs (auto-created)
└── scripts/   # Build scripts (don't call them manually, use .vscode tasks instead)
```
# Usage
## Building
- Press `Ctrl+Shift+B`
- Or go to `Terminal → Run Build Task`

## Running
- `Terminal → Run Task... → Run`
- Recommended: Install a [Task Explorer](https://marketplace.visualstudio.com/items?itemName=spmeesseman.vscode-taskexplorer) extension for easier access.

