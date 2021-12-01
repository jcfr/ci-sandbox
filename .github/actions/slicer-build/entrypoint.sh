#!/bin/bash
set -e
set -x
set -o pipefail
set -o

#cp -r $GITHUB_WORKSPACE /usr/src/Slicer

echo "GITHUB_WORKSPACE [$GITHUB_WORKSPACE]"
echo "RUNNER_TEMP [$RUNNER_TEMP]"

#/usr/src/Slicer-build/BuildSlicer.sh
#package_filepath=$(head -n1 /usr/src/Slicer-build/Slicer-build/PACKAGE_FILE.txt)
slicer_dir="/usr/src/Slicer-build/Slicer-build"
mkdir -p $slicer_dir

package_filepath="$slicer_dir/Slicer-4.13.0-2021-11-30-linux-amd64.tar.gz"
echo "Hello" > ${package_filepath}

echo "package_filepath [${package_filepath}]"

mv ${package_filepath} $GITHUB_WORKSPACE/

package=$(basename $package_filepath)
echo "package [${package}]"

echo "::set-output name=package::$package"
