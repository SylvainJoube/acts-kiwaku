# This file is part of the Acts project.
#
# Copyright (C) 2021-2022 CERN for the benefit of the Acts project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# This script sets up the ACTS Python bindings in the environment in a somewhat
# robust way.

if [ -n "$ZSH_VERSION" ]; then
    python_dir=${0:a:h}
elif [ -n "$BASH_VERSION" ]; then
    python_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}"  )" &> /dev/null && pwd  )
else
    # If the current shell is not ZSH or Bash, we can't guarantee that the
    # script will work, so we throw an error.
    echo "ERROR:   neither ZSH nor Bash was detected, other shells are not supported. The environment has not been modified."
    exit 1
fi

# Make python package available
export PYTHONPATH=$python_dir:$PYTHONPATH

# Make ODD available if possible
# This seems to be only reliable on Linux for now, not on MacOS
odd_dir=$python_dir/../thirdparty/OpenDataDetector/factory
if [ -d "$odd_dir" ] && [[ "$(uname -s)" -eq "Linux" ]]; then
    echo "INFO:    Found OpenDataDetector and set it up"
    export LD_LIBRARY_PATH=$odd_dir:$LD_LIBRARY_PATH
fi

# This message might seem excessive, but the Acts bindings are only installed
# for one Python version, and it is not trivial for the user to find out which.
# Thus, we let them know explicitly so they can more easily debug any potential
# import errors.
echo "INFO:    Acts Python 3.9 bindings setup complete."
