# Instructions for bumping
* Clone and diff `setup.py`

    gcl https://github.com/dbcli/pgcli.git
    gd -w  v1.5.1 v1.7.0 -- setup.py

* Look the changes in dependencies and modify the ebuild accordingly.
* Repeat for dependencies we maintain
