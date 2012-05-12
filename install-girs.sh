#!/bin/sh


mkdir -p ~/.Builder/girepository-1.2 || false

rm ~/.Builder/girepository-1.2/*.typelib

ls *.gir | sed s/.gir// | awk \
    '{ print "g-ir-compiler  " $1 ".gir --includedir=. -o  ~/.Builder/girepository-1.2/" $1 ".typelib" }' \
    | sh -x

ls *.gir | sed s/.gir// | awk \
    '{ print "diff -u  original/" $1 ".gir " $1 ".gir > diffs/" $1 ".diff" }' \
    | sh -x



sudo cp ~/.Builder/girepository-1.2/GLib-2.0.typelib /usr/lib/girepository-1.0/