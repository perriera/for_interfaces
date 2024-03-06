### tweaks
- [pip install -r requirements.txt is failing: "This environment is externally managed"](https://stackoverflow.com/questions/75602063/pip-install-r-requirements-txt-is-failing-this-environment-is-externally-mana)
```
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -r requirements.txt
```
Long story: Your distribution is trying to protect you against mixing apt provided packages and pip provided packages. Mixing two package managers (apt and pip here) is always a bad idea and the source of many issues.

PEP 668 is a way for distributions to explicitly tell users to avoid falling into this pitfall. Your distribution told you three solutions in the message, but only the 2nd one applies cleanly to your use case:

Using apt install python3-xxx. It does not cleanly apply for you as you're having a requirements.txt, not a single dependency. It would work if you have only a few requirements in the file and can do it manually for each, like apt install python3-xxx python3-yyy python3-zzz. In this case there's no weird mixing of package managers: you installed python3 using apt, you're installing your dependencies using apt: no surprises.
Using a venv: python3 -m venv .venv then source .venv/bin/activate, then pip install -r requirements.txt. In this case the installation is contained inside the .venv directory: no mixing of what apt does and what pip does, no surprises.
Using pipx which does not cleanly apply to your case, pipx is good to install and use a program, like pipx install black, but here you need to install libraries listed in a requirement file, not a program.
There's another way, that I often use myself because I often need multiple different Python versions:

Use a Python not provided by your distribution, so it does not mess with apt installed things and does not adopt PEP 668. I often compile many Python interpreters myself using a short bash function which use a --prefix=~/.local/, for testing purposes. With those Pythons I use either a venv either a good old pip install, in this case pip will install it in ~/.local/, again no clash between apt and pip, no bad surprises.
