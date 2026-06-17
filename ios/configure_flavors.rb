#!/usr/bin/env ruby
# frozen_string_literal: true

require 'xcodeproj'
require 'fileutils'

project_path = File.expand_path('Runner.xcodeproj', __dir__)
project = Xcodeproj::Project.open(project_path)

runner_target = project.targets.find { |t| t.name == 'Runner' }
raise 'Runner target not found' unless runner_target

tests_target = project.targets.find { |t| t.name == 'RunnerTests' }
raise 'RunnerTests target not found' unless tests_target

project_target_level = project.build_configuration_list
runner_config_list = runner_target.build_configuration_list
tests_config_list = tests_target.build_configuration_list

flavors = {
  'free' => {
    debug: 'Flutter/freeDebug.xcconfig',
    release: 'Flutter/freeRelease.xcconfig',
    profile: 'Flutter/freeProfile.xcconfig',
  },
  'paid' => {
    debug: 'Flutter/paidDebug.xcconfig',
    release: 'Flutter/paidRelease.xcconfig',
    profile: 'Flutter/paidProfile.xcconfig',
  },
}

base_project_configs = {
  'Debug' => project_target_level.build_configurations.find { |c| c.name == 'Debug' },
  'Release' => project_target_level.build_configurations.find { |c| c.name == 'Release' },
  'Profile' => project_target_level.build_configurations.find { |c| c.name == 'Profile' },
}

base_runner_configs = {
  'Debug' => runner_config_list.build_configurations.find { |c| c.name == 'Debug' },
  'Release' => runner_config_list.build_configurations.find { |c| c.name == 'Release' },
  'Profile' => runner_config_list.build_configurations.find { |c| c.name == 'Profile' },
}

base_tests_configs = {
  'Debug' => tests_config_list.build_configurations.find { |c| c.name == 'Debug' },
  'Release' => tests_config_list.build_configurations.find { |c| c.name == 'Release' },
  'Profile' => tests_config_list.build_configurations.find { |c| c.name == 'Profile' },
}

flutter_group = project.main_group.find_subpath('Flutter', true)

def duplicate_build_config(project, name, base_config)
  config = project.new(Xcodeproj::Project::Object::XCBuildConfiguration)
  config.name = name
  config.base_configuration_reference = base_config.base_configuration_reference
  config.build_settings = base_config.build_settings.dup
  config
end

flavors.each do |flavor, configs|
  {
    'Debug' => configs[:debug],
    'Release' => configs[:release],
    'Profile' => configs[:profile],
  }.each do |build_type, xcconfig_path|
    config_name = "#{build_type}-#{flavor}"

    unless project_target_level.build_configurations.any? { |c| c.name == config_name }
      project_config = duplicate_build_config(project, config_name, base_project_configs[build_type])
      project_target_level.build_configurations << project_config
    end

    unless runner_config_list.build_configurations.any? { |c| c.name == config_name }
      file_ref = flutter_group.files.find { |f| f.path == xcconfig_path }
      file_ref ||= flutter_group.new_file(xcconfig_path)

      runner_config = duplicate_build_config(project, config_name, base_runner_configs[build_type])
      runner_config.base_configuration_reference = file_ref
      runner_config.build_settings.delete('PRODUCT_BUNDLE_IDENTIFIER')
      runner_config_list.build_configurations << runner_config
    end

    next if tests_config_list.build_configurations.any? { |c| c.name == config_name }

    tests_config = duplicate_build_config(project, config_name, base_tests_configs[build_type])
    tests_config_list.build_configurations << tests_config
  end
end

project.save

schemes_dir = File.expand_path('Runner.xcodeproj/xcshareddata/xcschemes', __dir__)
FileUtils.mkdir_p(schemes_dir)

%w[free paid].each do |flavor|
  scheme_path = File.join(schemes_dir, "#{flavor}.xcscheme")
  scheme_xml = <<~XML
    <?xml version="1.0" encoding="UTF-8"?>
    <Scheme
       LastUpgradeVersion = "1510"
       version = "1.3">
       <BuildAction
          parallelizeBuildables = "YES"
          buildImplicitDependencies = "YES">
          <PreActions>
             <ExecutionAction
                ActionType = "Xcode.IDEStandardExecutionActionsCore.ExecutionActionType.ShellScriptAction">
                <ActionContent
                   title = "Run Prepare Flutter Framework Script"
                   scriptText = "/bin/sh &quot;$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh&quot; prepare&#10;">
                   <EnvironmentBuildable>
                      <BuildableReference
                         BuildableIdentifier = "primary"
                         BlueprintIdentifier = "97C146ED1CF9000F007C117D"
                         BuildableName = "Runner.app"
                         BlueprintName = "Runner"
                         ReferencedContainer = "container:Runner.xcodeproj">
                      </BuildableReference>
                   </EnvironmentBuildable>
                </ActionContent>
             </ExecutionAction>
          </PreActions>
          <BuildActionEntries>
             <BuildActionEntry
                buildForTesting = "YES"
                buildForRunning = "YES"
                buildForProfiling = "YES"
                buildForArchiving = "YES"
                buildForAnalyzing = "YES">
                <BuildableReference
                   BuildableIdentifier = "primary"
                   BlueprintIdentifier = "97C146ED1CF9000F007C117D"
                   BuildableName = "Runner.app"
                   BlueprintName = "Runner"
                   ReferencedContainer = "container:Runner.xcodeproj">
                </BuildableReference>
             </BuildActionEntry>
          </BuildActionEntries>
       </BuildAction>
       <TestAction
          buildConfiguration = "Debug-#{flavor}"
          selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
          selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
          customLLDBInitFile = "$(SRCROOT)/Flutter/ephemeral/flutter_lldbinit"
          shouldUseLaunchSchemeArgsEnv = "YES"
          shouldAutocreateTestPlan = "YES">
       </TestAction>
       <LaunchAction
          buildConfiguration = "Debug-#{flavor}"
          selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
          selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
          customLLDBInitFile = "$(SRCROOT)/Flutter/ephemeral/flutter_lldbinit"
          launchStyle = "0"
          useCustomWorkingDirectory = "NO"
          ignoresPersistentStateOnLaunch = "NO"
          debugDocumentVersioning = "YES"
          debugServiceExtension = "internal"
          allowLocationSimulation = "YES">
          <BuildableProductRunnable
             runnableDebuggingMode = "0">
             <BuildableReference
                BuildableIdentifier = "primary"
                BlueprintIdentifier = "97C146ED1CF9000F007C117D"
                BuildableName = "Runner.app"
                BlueprintName = "Runner"
                ReferencedContainer = "container:Runner.xcodeproj">
             </BuildableReference>
          </BuildableProductRunnable>
       </LaunchAction>
       <ProfileAction
          buildConfiguration = "Profile-#{flavor}"
          shouldUseLaunchSchemeArgsEnv = "YES"
          savedToolIdentifier = ""
          useCustomWorkingDirectory = "NO"
          debugDocumentVersioning = "YES">
          <BuildableProductRunnable
             runnableDebuggingMode = "0">
             <BuildableReference
                BuildableIdentifier = "primary"
                BlueprintIdentifier = "97C146ED1CF9000F007C117D"
                BuildableName = "Runner.app"
                BlueprintName = "Runner"
                ReferencedContainer = "container:Runner.xcodeproj">
             </BuildableReference>
          </BuildableProductRunnable>
       </ProfileAction>
       <AnalyzeAction
          buildConfiguration = "Debug-#{flavor}">
       </AnalyzeAction>
       <ArchiveAction
          buildConfiguration = "Release-#{flavor}"
          revealArchiveInOrganizer = "YES">
       </ArchiveAction>
    </Scheme>
  XML
  File.write(scheme_path, scheme_xml)
end

puts 'iOS flavors configured: free, paid'
