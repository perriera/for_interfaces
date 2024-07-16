### [Your First Extension](https://code.visualstudio.com/api/get-started/your-first-extension) 
- [Markdown Support](https://stackoverflow.com/questions/55180020/set-background-color-on-visual-studio-code-markdown-preview)
> One way to get white background color in markdown preview while having a dark VS Code theme is to use:
- Markdown **Preview GitHub Styling VS Code extension** by Matt Bierner.

> As the Markdown Preview GitHub Styling by default selects the theme type (light vs dark) based on your VS Code theme, you need to set
```
"markdown.styles": [
        "https://cdn.jsdelivr.net/gh/dhdhagar/vscode-md-preview-light/style.min.css"
    ]
```
