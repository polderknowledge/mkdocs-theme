#!/usr/bin/env bash
# Download and install requirements for documentation auto-deployment.
#
# This script does the following:
#
# - Installs mkdocs under the current user.
# - Installs pymdown-extensions under the current user.
# - If the zf-mkdoc-theme is not present under the current directory, downloads
#   and installs the latest tarball.
#
# In order to work, it needs the following environment variables defined:
#
# This script should be fetched from the master branch by any project opting
# into the documentation auto-deployment workflow.
#
# @license   http://opensource.org/licenses/BSD-3-Clause BSD-3-Clause
# @copyright Copyright (c) 2016 Zend Technologies USA Inc. (http://www.zend.com)

SCRIPT_PATH="$(pwd)"

# Install mkdocs and required extensions.
pip install --user mkdocs
pip install --user pymdown-extensions

# Conditionally install zf-mkdoc-theme.
if [[ ! -d "mkdoc-theme/theme" ]];then
    echo "Downloading mkdoc-theme..." ;
    mkdir -p mkdoc-theme ;
    curl -s -L https://github.com/polderknowledge/mkdocs-theme/releases/latest | egrep -o '/polderknowledge/mkdocs-theme/archive/[0-9]*\.[0-9]*\.[0-9]*\.tar\.gz' | head -n1 | wget -O mkdocs-theme.tgz --base=https://github.com/ -i - ;
    (
        cd mkdocs-theme ;
        tar xzf ../mkdocs-theme.tgz --strip-components=1 ;
    );
    echo "Finished downloading and installing mkdocs-theme" ;
fi

exit 0;
