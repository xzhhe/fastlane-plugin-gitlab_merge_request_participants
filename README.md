# gitlab_merge_request_participants plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-gitlab_merge_request_participants)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-gitlab_merge_request_participants`, add it to your project by running:

```bash
fastlane add_plugin gitlab_merge_request_participants
```

## About gitlab_merge_request_participants

Get a list of merge request participants

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

```ruby
fastlane_require 'pp'
lane :test do
  pp gitlab_merge_request_participants(
    host: 'https://git.in.xxx.com/api/v4',
    private_token: 'xxx',
    project_id: '16456',
    mr_id: '33',
    ignore_users: [56,421,426,1016,143]
  )
end
```

then output like this:

```
["xiongzenghui", "chenkang", "wangfei", "hchen"]
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
