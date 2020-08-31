# Uncomment the next line to define a global platform for your project
platform :ios, '13.6'
use_frameworks!
workspace 'DesafioTransbank'

def networkingPods
  pod 'Alamofire'
end

def projectPods
  pod 'Kingfisher'
  pod 'SwiftLint'
end

def uiPods
  pod 'SketchKit'
  pod 'lottie-ios'
end

def unitTestPods
  pod 'Nimble-Snapshots'
  pod 'Quick'
  pod 'Nimble'
end

target 'DesafioTransbank' do
  project 'DesafioTransbank'
  projectPods
  uiPods

  target 'DesafioTransbankTests' do
    inherit! :search_paths
    unitTestPods
  end
end

target 'Components' do
  project 'Components/Components'
  uiPods

  target 'ComponentsTests' do
    unitTestPods
  end
end

target 'Network' do
  project 'Network/Network'
  networkingPods

  target 'NetworkTests' do
    unitTestPods
  end
end
