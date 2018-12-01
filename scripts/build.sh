set -oe pipefail
export FRAMEWORK_NAME="jmbde"
export SCHEME="jmbde"
export SDK="macosx10.14"
export DESTINATION="arch=x86_64"
export SWIFT_VERSION="4.2.1"
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export UPDATE_DOCS="true"
export EXPANDED_CODE_SIGN_IDENTITY="-"
export EXPANDED_CODE_SIGN_IDENTITY_NAME="-"
mkdir -p build
xcodebuild -version
xcodebuild -showsdks
xcodebuild -workspace "$FRAMEWORK_NAME.xcworkspace" -scheme "$SCHEME" -destination "$DESTINATION" -configuration Debug clean ONLY_ACTIVE_ARCH=YES GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES SWIFT_VERSION=$SWIFT_VERSION  | xcpretty