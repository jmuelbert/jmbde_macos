set -oe pipefail
mkdir -p build
xcodebuild -workspace JMBde.xcworkspace -scheme JMBde -configuration Debug -destination "platform=macOS" clean test \
  | tee build/output \
  | grep .[0-9]ms \
  | grep -v ^0.[0-9]ms \
  | sort -nr > build/build-times.txt \
	&& cat build/build-times.txt | less