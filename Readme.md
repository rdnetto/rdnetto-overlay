# Rdnetto-Overlay

This is an overlay for use with Gentoo and Sabayon Linux. It contains packages intended for my personal use. I make no guarrantees about its stability or safety - use at your own risk.

## Installing

    $ sudo wget https://raw.githubusercontent.com/rdnetto/rdnetto-overlay/master/repository.xml -O /etc/layman/overlays/rdnetto-overlay.xml
    $ sudo layman -f -a rdnetto-overlay

## License
All original ebuilds written by me are licensed under the Apache License 2.0 (see LICENSE). Ebuilds taken from the Gentoo tree remain under GPLv2. Refer to the header of an ebuild to see which license applies.
