brew cask install openscad
LIBRARY_DIR='~/Documents/OpenSCAD/libraries'
mkdir -p ${LIBRARY_DIR}
cd ${LIBRARY_DIR}
git clone https://github.com/openscad/scad-utils.git
cd -
