#!/bin/bash

set -e
if xcode-select -p | grep -q '/Applications/Xcode.app/Contents/Developer'; then
  echo "Found Xcode installed.";
else
  echo "Full version of Xcode is required. Install it from Apple App store."
  echo "Also 'Accept' Xcode license after installation, either from its UI or via command line."
  exit 1;
fi

if python --version 2>&1 | grep -q '2.7'; then
  echo "Found Python 2.7";
else
  echo "Python 2.7 not in PATH. Adjust your system PATH so that Python 2.7 is the default python version";
  exit 1;
fi

if pip --version 2>&1 | grep -q '18.'; then
  echo "Found pip";
else
  echo "Installing pip";
  curl https://bootstrap.pypa.io/get-pip.py | sudo python
fi

sudo pip install webapp2 webob psutil
sudo pip install mod_wsgi
