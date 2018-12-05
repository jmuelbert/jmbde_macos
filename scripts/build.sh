set -o pipefail
export FRAMEWORK_NAME="jmbde"
export SCHEME="jmbde-macos"
export SDK="macosx10.14"
export DESTINATION="arch=x86_64"
export SWIFT_VERSION="4.2.1"
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export UPDATE_DOCS="true"
export EXPANDED_CODE_SIGN_IDENTITY="-"
export EXPANDED_CODE_SIGN_IDENTITY_NAME="-"
mkdir -p build
gem install bundler
bundle install
brew update
brew outdated xctool || brew upgrade xctool
brew outdated carthage || brew upgrade carthage
pod install --repo-update
xcodebuild -version
xcodebuild -showsdks
xcodebuild -workspace "$FRAMEWORK_NAME.xcworkspace" -scheme "$SCHEME" -sdk "$SDK" -destination "$DESTINATION" -configuration Debug clean build test ONLY_ACTIVE_ARCH=YES SWIFT_VERSION=$SWIFT_VERSION -verbose
