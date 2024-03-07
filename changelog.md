# Changelog

> - All notable changes to this project will be documented in this file.
> - The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
> - and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
> - IMPORTANT:
>
> - Manually keep the changelog version number in sync with CMakeLists.txt project version
> - Keep the changelog.md up to date, neat and tidy, (as it is a maintenance tool for code).
> - Use [Semantic Versioning](https://semver.org/spec/v2.0.0.html) such that
> - Given a version number MAJOR.MINOR.PATCH, increment the:
> - MAJOR version when you make incompatible API changes,
> - MINOR version when you add functionality in a backwards compatible manner, and
> - PATCH version when you make backwards compatible bug fixes.
> - But there is no need to change the version number for correcting spelling errors, (etc).
> - MAKE SURE to tag and update the tag compare list below, (for quick code comparison purposes).

```
tagit.sh

cd ~/dev/for_interfaces
tagit.sh v3.9.9 "added curl to standard installs for C++11/17"
firefox https://github.com/perriera/for_interfaces/tags &
cd ~/dev/for_interfaces
cat changelog.md | grep "*:" >/tmp/file1.txt
xclip -selection c /tmp/file1.txt

```
**removed obsolete bin/ folder**: https://github.com/perriera/for_interfaces/compare/v2.31.0X...v3.0.0
**added remote/WORK.md**: https://github.com/perriera/for_interfaces/compare/v2.52.5...v2.52.7
**updated CMAKE.md**: https://github.com/perriera/for_interfaces/compare/v2.51.2...v2.52.0
**added setup-an-apache2-server.md**: https://github.com/perriera/for_interfaces/compare/v2.49.0...v2.51.2
**added a bunch of tweaks**: https://github.com/perriera/for_interfaces/compare/v2.45.2...v2.49.0
**made it_assert_interface.sh compliant**: https://github.com/perriera/for_interfaces/compare/v2.45.2...v2.46.2
**renamed it_create.sh to it_clone.sh**: https://github.com/perriera/for_interfaces/compare/v2.45.1...v2.45.2
**renamed tagit.sh script (back)**: https://github.com/perriera/for_interfaces/compare/v2.44.0...v2.45.1
**added pyhton folder**: https://github.com/perriera/for_interfaces/compare/v2.43.0...v2.44.0
**renamed tagit.sh to tagit.sh**: https://github.com/perriera/for_interfaces/compare/v2.42.0...v2.43.0
**add docs on ssh keys**: https://github.com/perriera/for_interfaces/compare/v2.40.0...v2.42.0
**Added docs to it_test.sh**: https://github.com/perriera/for_interfaces/compare/v2.39.12...v2.40.0
**Added docs to it_test.sh**: https://github.com/perriera/for_interfaces/compare/v2.39.11...v2.39.12
**Updated interface_post.sh**: https://github.com/perriera/for_interfaces/compare/v2.37.0...v2.38.0
**Updated tagit.sh**: https://github.com/perriera/for_interfaces/compare/v2.36.0...v2.37.0
**Added interface_help.sh**: https://github.com/perriera/for_interfaces/compare/v2.35.0...v2.36.0
**Refactored bash script names**: https://github.com/perriera/for_interfaces/compare/v2.34.0...v2.35.0
**Refactored bash script names**: https://github.com/perriera/for_interfaces/compare/v2.34.0...v2.35.0
**Added interface_test.sh**: https://github.com/perriera/for_interfaces/compare/v2.30.0...v2.34.0
**Added interface_test.sh**: https://github.com/perriera/for_interfaces/compare/v2.30.0...v2.31.0
**Added http-server (npx) support**: https://github.com/perriera/for_interfaces/compare/v2.25.1...v2.29.2
**Added docs on git rebase**: https://github.com/perriera/for_interfaces/compare/v2.24.4...v2.25.1
**Updated help docs on tagit.sh**: https://github.com/perriera/for_interfaces/compare/v2.24.2...v2.24.4
**Added color to bash scripts**: https://github.com/perriera/for_interfaces/compare/v0.22.2...v2.24.2
**Merged bash scripts to bin folder**: https://github.com/perriera/for_interfaces/compare/v0.18.0...v0.22.2
**Relocated linux, macos and windows folders**: https://github.com/perriera/for_interfaces/compare/v0.17.0...v0.18.0
**How to open a URL in the browser automatically with Node**: https://github.com/perriera/for_interfaces/compare/v0.10.0...v0.10.1
**How To Create a Web Server in Node.js with the HTTP Module**: https://github.com/perriera/for_interfaces/compare/v0.9.1...v0.10.0
**Added zip/HOWTOZIP_INPLACE.md**: https://github.com/perriera/for_interfaces/compare/v0.8.1...v0.9.1
**Added Prettier Formatter images**: https://github.com/perriera/for_interfaces/compare/v0.5.0...v0.6.1
**Added Prettier Formatter images**: https://github.com/perriera/for_interfaces/compare/v0.5.0...v0.6.1
**added React Developer Tools**: https://github.com/perriera/for_interfaces/compare/v0.4.2...v0.5.0
**added React Developer Tools**: https://github.com/perriera/for_interfaces/compare/v0.4.2...v0.5.0
**added tweaks.md for Angular, React and Vue**: https://github.com/perriera/for_interfaces/compare/v0.3.0...v0.4.2
**updated changelog.md**: https://github.com/perriera/for_interfaces/compare/v0.2.0...v0.3.0
**updated changelog.md**: https://github.com/perriera/for_interfaces/compare/v0.1.0...v0.2.0

#### 0.1.0 (2023-09-26)
- created
