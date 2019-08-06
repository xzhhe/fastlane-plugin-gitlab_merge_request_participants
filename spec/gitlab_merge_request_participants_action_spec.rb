describe Fastlane::Actions::GitlabMergeRequestParticipantsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The gitlab_merge_request_participants plugin is working!")

      Fastlane::Actions::GitlabMergeRequestParticipantsAction.run(nil)
    end
  end
end
