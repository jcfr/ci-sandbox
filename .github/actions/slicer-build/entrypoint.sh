#!/bin/sh -l

cp -r $GITHUB_WORKSPACE /usr/src/Slicer

/usr/src/Slicer-build/BuildSlicer.sh
package=$(head -n1 /usr/src/Slicer-build/Slicer-build/PACKAGE_FILE.txt)
echo "package [${package}]"

echo "::set-output name=package::$package"
