# frozen_string_literal: true.

require_relative 'rakelib/check_changelog'

# Welcome message
markdown [
  "Hey 👋 I'm Eve, the friendly bot watching over jmbde 🤖",
  'Thanks a lot for your contribution!',
  '', '---', ''
]

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn('PR is classed as Work in Progress') if github.pr_title.include? '[WIP]'

# Warn when there is a big PR
warn('Big PR') if git.lines_of_code > 500

need_fixes = []

# Check for correct base branch
is_release = github.branch_for_head.start_with?('release/')
to_develop = github.branch_for_base == 'develop'
to_master = github.branch_for_base == 'master'
if is_release
  message('This is a Release PR')
  need_fixes << warn("Release branches should be merged into 'master'") unless to_master

  require 'open3'

  stdout, _, status = Open3.capture3('bundle', 'exec', 'rake', 'changelog:check')
  markdown [
    '',
    '### ChangeLog check',
    '',
    stdout
  ]
  need_fixes << raise('Please fix the CHANGELOG errors') unless status.success?

  stdout, _, status = Open3.capture3('bundle', 'exec', 'rake', 'release:check_versions')
  markdown [
    '',
    '### Release version check',
    '',
    stdout
  ]
  need_fixes << raise('Please fix the versions inconsistencies') unless status.success?
elsif !to_develop
  need_fixes << raise("Feature branches should start from and be merged into 'develop', " \
    "not #{github.branch_for_base}")
end

# Check `lock` files
podfile_changed = git.modified_files.include?('Podfile.lock')
package_changed = git.modified_files.include?('Package.resolved')
if podfile_changed ^ package_changed
  need_fixes << warn('You should make sure that `Podfile.lock` and `Package.resolved` are changed in sync')
end

# Check for a CHANGELOG entry
declared_trivial = github.pr_title.include? '#trivial'
has_changelog = git.modified_files.include?('CHANGELOG.md')
changelog_msg = ''
unless has_changelog || declared_trivial
  repo_url = github.pr_json['head']['repo']['html_url']
  pr_title = github.pr_title
  pr_title += '.' unless pr_title.end_with?('.')
  pr_number = github.pr_json['number']
  pr_url = github.pr_json['html_url']
  pr_author = github.pr_author
  pr_author_url = "https://github.com/#{pr_author}"

  need_fixes = raise("Please include a CHANGELOG entry to credit your work.  \nYou can find it at [CHANGELOG.md](#{repo_url}/blob/master/CHANGELOG.md).")

  changelog_msg = <<-CHANGELOG_FORMAT.gsub(/^ *\|/, '')
  |📝 We use the following format for CHANGELOG entries:
  |```
  | * #{pr_title}
  |   [##{pr_number}](#{pr_url})
  |   [@#{pr_author}](#{pr_author_url})
  |```
  |:bulb: Don't forget to end the line describing your changes by a period and two spaces.
  CHANGELOG_FORMAT
  # changelog_msg is printed during the "Encouragement message" section, see below
end

changelog_warnings = check_changelog
unless changelog_warnings.empty?
  need_fixes << warn('Found some warnings in CHANGELOG.md')
  changelog_warnings.each do |warning|
    warn(warning[:message], file: 'CHANGELOG.md', line: warning[:line])
  end
end

# Encouragement message
if need_fixes.empty?
  markdown('Seems like everything is in order 👍 You did a good job here! 🤝')
else
  markdown('Once you fix those tiny nitpickings above, we should be good to go! 🙌')
  markdown(changelog_msg) unless changelog_msg.empty?
  markdown('ℹ️ _I will update this comment as you add new commits_')
end

# Run SwiftLint
swiftlint.config_file = '.swiftlint.yml'
swiftlint.lint_files

# Warn when new tests are added but the XCTestManifests wasn't updated to run on Linux
tests_added_or_modified = git.modified_files.grep(/XCode\/Tests/).empty? || git.added_files.grep(/XCode\/Tests/).empty?
xc_manifest_updated = !git.modified_files.grep(/XCode\/Tests\/XCTestManifests.swift/).empty?
if tests_added_or_modified && !xc_manifest_updated
  warn("It seems like you've added new tests to the library. If that's the case, please update the [XCTestManifests.swift](https://github.com/httpswift/swifter/blob/stable/XCode/Tests/XCTestManifests.swift) file running in your terminal the command `swift test --generate-linuxmain`.")

  # This is a temporary warning to remove the entry for the failed test until we solve the issue in Linux
  warn("If you ran the command `swift test --generate-linuxmain` in your terminal, please remove the line `testCase(IOSafetyTests.__allTests__IOSafetyTests),` from `public func __allTests() -> [XCTestCaseEntry]` in the bottom of the file. For more reference see [#366](https://github.com/httpswift/swifter/issues/366).")
end
