require 'fastlane/action'
require_relative '../helper/gitlab_merge_request_participants_helper'

module Fastlane
  module Actions
    class GitlabMergeRequestParticipantsAction < Action
      def self.run(params)
        require 'gitlab'
        
        host = params[:host]
        private_token = params[:private_token]
        project_id = params[:project_id]
        mr_id = params[:mr_id]
        ignore_users = params[:ignore_users]

        gc = Gitlab.client(endpoint: host, private_token: private_token)
        gc.merge_request_participants(project_id, mr_id).map {|user|
          if ignore_users && ignore_users.include?(user.id)
            nil
          else
            gc.user(user.id).public_email.split('@')[0]
          end
        }.reject {|name| name.nil?}
      end

      def self.description
        "Get a list of merge request participants"
      end

      def self.authors
        ["xiongzenghui"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Get a list of merge request participants"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :host,
            description: "host for gitlab server",
            verify_block: proc do |value|
              UI.user_error!("No host given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :private_token,
            description: "private_token for gitlab server",
            verify_block: proc do |value|
              UI.user_error!("No private_token given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :project_id,
            description: "project_id for gitlab git repo",
            verify_block: proc do |value|
              UI.user_error!("No project_id given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :mr_id,
            description: "id for gitlab merge request",
            verify_block: proc do |value|
              UI.user_error!("No mr_id for given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :ignore_users,
            description: "ignore user id",
            is_string: false,
            optional: true
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
