# tt

[![codecov](https://codecov.io/gh/DanySpin97/tt/branch/master/graph/badge.svg)](https://codecov.io/gh/DanySpin97/tt)

tt is a Work in Progress init and service manager inspired by [66](https://web.obarun.org/software/66) and based on
the [s6](https://skarnet.org/software/s6/) suite.

tt tries to offer a valid alternative to systemd for PID 1 and service
management. It uses the supervision to manage long running programs (deamons),
log everything to files (no binary log interface) and provides an easy to use
command line interface.

Inheriting [s6-rc](https://skarnet.org/software/s6-rc/) feature, the services must be compiled before being able to
run. This is one of the biggest differences with the current service managers,
which instead are based on runtime services.

tt is designed to run on both desktops and servers, and does not target embedded
devices; if memory and space are constrained (e.g. you're configuring a router),
then the use of s6 configured ad-hoc for that machine is recommended.

## Planned features

- Support for different types of services: _oneshot_, _deamons_ and _bundles_
- Predictable dependencies at build time
- Asynchrounus start of the services (no [run levels](https://en.wikipedia.org/wiki/Runlevel))
- Log everything into files, no syslog needed for deamons
- Low footprint
- Target desktop and servers
- Conditional dependencies for complex services (such as web apps)
- Provides sane defaults
- Prioritize usability

## Getting started

### Dependencies

tt depends on the following libraries:

- [s6](https://skarnet.org/software/s6/)
- [s6-rc](https://skarnet.org/software/s6-rc/)
- [execline](https://skarnet.org/software/execline/)

You can install them using your package manager.

### Building

To build tt a working D compiler is required. Meson will take care of the rest:

```bash
$ meson build
$ ninja -C build
```

## Contributing

Feel free to contribute by opening a Pull Request! Have a look at Github Issues
for the current development tasks.

## License

tt is licensed under the [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html) License - see [LICENSE](https://github.com/DanySpin97/tt/blob/master/LICENSE) file for more
details.

