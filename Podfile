# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rxswift_pods
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
end
target 'Task' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

  # Pods for Task
  use_frameworks!
  rxswift_pods

  target 'TaskTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TaskUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
