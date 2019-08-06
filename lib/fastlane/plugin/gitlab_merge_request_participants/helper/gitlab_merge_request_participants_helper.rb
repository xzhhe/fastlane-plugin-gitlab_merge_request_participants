require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class GitlabMergeRequestParticipantsHelper
      # class methods that you define here become available in your action
      # as `Helper::GitlabMergeRequestParticipantsHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the gitlab_merge_request_participants plugin helper!")
      end
    end
  end
end
