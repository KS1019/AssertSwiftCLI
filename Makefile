StringHelperPath=swift-argument-parser/Sources/ArgumentParserTestHelpers/StringHelpers.swift
TestHelpersPath=swift-argument-parser/Sources/ArgumentParserTestHelpers/TestHelpers.swift
DependencyPath=Sources/ArgumentParserTestHelpers/

update-dependencies: copy-swift-argument-parser-dependencies

copy-swift-argument-parser-dependencies: clean-old-dependencies
	git clone https://github.com/apple/swift-argument-parser && cp $(StringHelperPath) $(DependencyPath) && cp $(TestHelpersPath) $(DependencyPath) && rm -rf swift-argument-parser
	rm -rf swift-argument-parser

clean-old-dependencies:
	cd $(DependencyPath) && find . -type f | xargs rm -f
