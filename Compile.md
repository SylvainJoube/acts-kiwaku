# Après installation


```
export CURRENT_HOME_DIR="/home/sasa/work"
```

```
cmake -B acts_build -S acts_src -DCMAKE_CXX_STANDARD=17 -DACTS_BUILD_PLUGIN_DD4HEP=ON -DCMAKE_BUILD_TYPE=Debug -DACTS_BUILD_ODD=ON -DACTS_BUILD_EXAMPLES_PYTHON_BINDINGS=ON -DACTS_BUILD_PLUGIN_TGEO=On -DACTS_BUILD_BENCHMARKS=ON -DACTS_BUILD_PLUGIN_DIGITIZATION=ON -DACTS_BUILD_PLUGIN_JSON=ON -DACTS_BUILD_EXAMPLES_PYTHON_BIN=ON -DACTS_BUILD_EXAMPLES=ON -DACTS_BUILD_EXAMPLES_DD4HEP=ON\
&& cmake --build acts_build/ -j`nproc`
```

Clusterisation test
```
cmake -B acts_build -S acts_src -DCMAKE_CXX_STANDARD=17 -DCMAKE_BUILD_TYPE=Debug  -DACTS_BUILD_EXAMPLES_PYTHON_BINDINGS=ON  -DACTS_BUILD_UNITTESTS=ON -DACTS_BUILD_EXAMPLES=ON && cmake --build acts_build/ -j`nproc`
```

Digitization example run -Deprecated
```
cmake -B acts_build -S acts_src -DCMAKE_CXX_STANDARD=17 -DCMAKE_BUILD_TYPE=Debug -DACTS_BUILD_EXAMPLES_BINARIES=ON && cmake --build acts_build/ -j`nproc`
```

```
source $CURRENT_HOME_DIR/root_install/bin/thisroot.sh \
&& source $CURRENT_HOME_DIR/geant4.11.1.1_install/bin/geant4.sh \
&& source $CURRENT_HOME_DIR/LCIO_src/setup.sh \
&& source $CURRENT_HOME_DIR/DD4hep_src/bin/thisdd4hep.sh

source $CURRENT_HOME_DIR/acts_build/python/setup.sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CURRENT_HOME_DIR/acts_build/thirdparty/OpenDataDetector/factory

python3 acts_src/Examples/Scripts/Python/full_chain_odd.py
python3 acts_src/Examples/Scripts/Python/digitization.py
```