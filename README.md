# acap-cargo

_Cargo tools for building and deploying [ACAP] apps written in [Rust]_

## Developer tools

The tools can be roughly divided into low level _plumbing_ and high level _porcelain_.

To install them in a project, use the `--git` option e.g. like:

```sh
cargo install --locked --git https://github.com/apljungquist/acap-cargo.git cargo-acap-sdk
```

### Porcelain programs

The focus of these tools are to make common things easy.

- `cargo-acap-sdk` - Automation of common development workflows.
  - Status: ⚠️ Alpha
  - Documentation: [README](crates/cargo-acap-sdk/README.md)

### Plumbing programs

The focus of these tools are to make less common things possible.

- `acap-ssh-utils` - Utilities for interacting with Axis devices over SSH.
  - Status: ⚠️ Alpha
  - Documentation: [README](crates/acap-ssh-utils/README.md)
- `cargo-acap-build`: Build utilities for ACAP apps and other executables deployed to Axis devices.
  - Status: ⚠️ Alpha
  - Documentation: [README](crates/cargo-acap-build/README.md)

These can be installed independently and are provided as library crates too for developers who want
to write their own, tailored tools.

### Supporting libraries

- `acap-build`: Wrapper around the `acap-build` program from the ACAP Native SDK, with an
  equivalent pure Rust implementation selected by `ACAP_BUILD_IMPL=equivalent`.
- `acap-vapix`: Bindings for various VAPIX APIs + credentials lookup.
  - Documentation: [README](crates/acap-vapix/README.md)
- `cli-version`: Shared version string for the binaries.

## Development

These are Rust programs and should compile and start in most environments,
but only the reference environments set up in [CI](.github/workflows/CI.yml) are fully supported.

Common workflows documented in the [Makefile](./Makefile) and can be listed with `make help`.

## Documentation and useful resources

- [Related projects](docs/related-projects.md)
- [acap-rs libraries](https://github.com/AxisCommunications/acap-rs/tree/main#libraries)
- [acap-rs documentation](https://github.com/AxisCommunications/acap-rs/tree/main#documentation)
- [awesome-acap](https://github.com/apljungquist/awesome-acap) - a list of free resources related to ACAP development.

## License

[MIT](LICENSE)

[ACAP]: https://axiscommunications.github.io/acap-documentation/
[Rust]: https://doc.rust-lang.org/
