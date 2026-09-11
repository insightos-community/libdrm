# libdrm 2.4.131 musl release

Source-built Linux x86_64 musl shared libraries and development prefix.

Upstream: https://gitlab.freedesktop.org/mesa/drm, tag libdrm-2.4.131.

CI checks project tests, ELF GLIBC symbol requirements and the relocated release in a clean offline musl container. External shared libraries remain separate and are listed in build-manifest.json. This is not a fully static binary or a GPU hardware certification.

Tag musl-v2.4.131-N publishes only after all checks pass. Published tags and assets are never overwritten.
