#!/bin/sh

deps="python3-gobject gtk3 gcc gobject-introspection-devel cairo-gobject-devel pkg-config python3-devel"
dnf install $deps -y
