# Hasktorch 0.2 Pre-Release

Hasktorch is a library for tensors and neural networks in Haskell.
It is an independent open source community project which leverages the core C++ libraries shared by PyTorch.

This project is in active development, so expect changes to the library API as it evolves.
We would like to invite new users to join our Hasktorch slack space for questions and discussions.

Contributious/PR are encouraged (see Contributing).

Currently we are prepping development and migration for a major 2nd release, Hasktorch 0.2.
The 1st release, Hasktorch 0.1, that you can find on hackage is outdated and should not be used at this point.


## Project Structure

Basic functionality:

- `deps/` - submodules and downloads for build dependencies (libtorch, mklml, pytorch) -- you can ignore this if you are on Nix
- `examples/` - high level example models (xor mlp, typed cnn, etc.)
- `experimental/` - experimental projects or tips
- `hasktorch/` - higher level user-facing library, calls into `ffi/`, used by `examples/`

Internals (for contributing developers):

- `codegen/` - code generation, parses `Declarations.yaml` spec from pytorch and produces `ffi/` contents
- `inline-c/` - submodule to inline-cpp fork used for C++ FFI
- `libtorch-ffi/`- low level FFI bindings to libtorch
- `spec/` - specification files used for `codegen/`


## Getting Started

The following steps will get you started.
They assume the hasktorch repository has just been cloned.

### On macOS or Ubuntu-like OSes'

For Nix-based operation, see the following section.

Starting at the top-level directory of the project,
go to the `deps/` (dependencies) directory and run the `get-deps.sh` shell script to retrieve project dependencies with the following commands:

```sh
$ pushd deps           # Change to deps directory and save the current directory.
$ ./get-deps.sh        # Run the shell script to retrieve the dependency.
$ popd                 # Go back to the root directory of the project.
```

This will default to CPU-only Torch.
If you would like to use CUDA 9 or 10,
replace `./get-deps.sh` with `./get-deps.sh -a cu92` or `./get-deps.sh -a cu102`, respectively.

These downloads include various PyTorch shared libraries.
Note that `get-deps.sh` only has to be run once after the repo is initially cloned.
It should *not* be run when using Nix, see the following section.

Next, set shell environment to reference the shared library locations:

```sh
$ source setenv
```

Note `source setenv` should be run from the top-level directory of the repo.

### Via a Nix Shell

These instructions apply both to NixOS and macOS or Ubuntu-like OSes' in which the `nix` package manager can be installed.

The first thing to consider is that the Hasktorch `nix` derivations are large.
For this reason, it is recommended to install and set up Cachix,
e.g. via `nix-env -iA cachix -f https://cachix.org/api/v1/install` or, on NixOS, directly in your `configuration.nix`.

There are two relevant caches you want to use:

```sh
$ cachix use iohk
$ cachix use hasktorch
```

The first one is maintained by [IOHK](https://iohk.io/).
We use it because we depend on [haskell.nix](https://github.com/input-output-hk/haskell.nix),
an alternative Haskell Nix infrastructure that we prefer over the default one provided by `nixpkgs`.
The second cache is our own Hasktorch cache.
Using these caches can speed up your builds tremendously.

You can launch a Nix shell via

```sh
$ nix-shell
```

and use `cabal build`, `cabal repl`, `cabal test`, etc. from within.
We also support Stack with Nix, see below.

Note that this shell is configured to use the CPU backend only.
In order to benefit from any CUDA-capable hardware acceleration your computer may provide (sorry macOS users),
launch the Nix shell instead with:

```sh
$ nix-shell --arg cudaSupport true --argstr cudaMajorVersion 10
```

If you have run `cabal` in a CPU-only Hasktorch shell before,
you need to clean the `dist-newstyle` folder first, `cabal clean`.
Otherwise, you will not be able to move tensors to CUDA.

In rare cases, you may want to use `--argstr cudaMajorVersion 9`.
This will pull in version 9 of the CUDA toolkit instead.


### Stack with Nix

It is also possible to compile Hasktorch with Stack while getting system dependencies with Nix.

First, make sure both Stack and Nix are installed, and then optionally enable
the Hasktorch Cachix cache, as described above. After that, just run
`stack --nix build` to build Hasktorch.

As long as you pass the `--nix` flag to Stack, Stack will use Nix to get into
an environment with all required system dependencies (mostly just `libtorch`)
before running builds, tests, etc.

Note that if you are running `stack` with Nix, you want to make sure you have
_not_ run the `deps/get-deps.sh` script. In particular, the `deps/libtorch/` and
`deps/mklml/` directories must not exist.

### Building examples

There are numerous end-to-end training examples in the `examples/` directory of this repository.
These can be built and run in numerous ways,
depending on whether or not you are using Nix or whether you are using Cabal or Stack.

For instance, the the MNIST MLP example can be built and run on CPU with

```sh
$ export DEVICE="cpu"; stack run static-mnist-mlp
```

With Nix, CUDA 10, and cabal, this can be achieved with:

```sh
$ nix-shell \
  --arg cudaSupport true \
  --argstr cudaMajorVersion 10 \
  --command "export DEVICE=\"cuda:0\"; cabal run static-mnist-mlp"
```

### Set up your development environement

If you want to develop the project with great Haskell IDE integration,
you should consider using [ghcide](https://github.com/digital-asset/ghcide).
It is the currently preferred language server backend and is provided by the Nix shell environment.
If you are not using Nix, the `ghcide` binary can be installed using `stack` or `cabal`;
see instructions [here](https://github.com/digital-asset/ghcide#with-cabal-or-stack).

You will then want to install an integration for your preferred editor. `ghcide` supports:

* [VS Code](https://github.com/digital-asset/ghcide#using-with-vs-code),
* [Atom](https://github.com/digital-asset/ghcide#using-with-atom),
* [Sublime Text](https://github.com/digital-asset/ghcide#using-with-sublime-text),
* [Emacs](https://github.com/digital-asset/ghcide#using-with-emacs),
* [Vim](https://github.com/digital-asset/ghcide#using-with-vimneovim),
* and [others](https://github.com/digital-asset/ghcide).

In order to get started with VS Code, start it from within a Nix shell:

```sh
$ nix-shell --command "code ."
```

This assumes VS Code is already installed system-wide.

A CUDA-enabled `ghcide` experience is also possible,
just append `--arg cudaSupport true` and `--argstr cudaMajorVersion 10` to the `nix-shell` command.

All that is needed now is the VS Code [Haskell Language Server plugin](https://marketplace.visualstudio.com/items?itemName=alanz.vscode-hie-server).
Follow the link to the market place, and install the plugin in VS Code.
Lastly, in the settings for the plugin, set the `Hie Variant` to `ghcide`.
Changing this setting may require a restart of VS Code.
Afterwards, you should be good to go.

There is a [short YouTube video](https://www.youtube.com/watch?v=WBYWtrKjKcE) made by [Neil Mitchell](https://twitter.com/@ndm_haskell)
that shows off `ghcide`'s features in VS Code.

## Using Hasktorch as a library in a downstream project via Nix

We have a made a [Hasktorch Skeleton](https://github.com/hasktorch/hasktorch-skeleton) project that people can clone and start working with.


## Jupyter Lab

We provide a special Nix shell environment with Jupyter Lab and Hasktorch.

```sh
$ nix-shell ./nix/jupyter-shell.nix --command "jupyter lab"
```

This will first build various dependencies and then launch Jupyter Lab as well as open it in your default browser.

Some example notebooks are found in the `notebooks/` directory.


## Contributing

We welcome new contributors.

Contact Austin Huang or Sam Stites for access to the [hasktorch slack channel][slack].
You can send an email to [hasktorch@gmail.com][email] or on twitter as [@austinvhuang][austin-twitter] or [@SamStites][sam-twitter].

[email]:mailto:hasktorch@gmail.com
[austin-twitter]:https://twitter.com/austinvhuang
[sam-twitter]:https://twitter.com/samstites
[slack]:https://hasktorch.slack.com
[gitter-dh]:https://gitter.im/dataHaskell/Lobby

## Developer Information

See [the wiki](https://github.com/hasktorch/hasktorch/wiki) for developer information.
