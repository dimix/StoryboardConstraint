Pod::Spec.new do |s|
  s.name               = 'StoryboardConstraint'
  s.version            = '0.1.1'
  s.summary            = 'A simple way to use programmatically Autolayout Constraint created in Storyboard.'
  s.description        = <<-DESC
A simple way to use programmatically Autolayout Constraint created in Storyboard.
- Predefined basic constraints: top, bottom, leading, trailing, height, width, centerX, centerY
- A complete method to find a specific constraint through the views
                       DESC
  s.homepage           = 'https://github.com/dimix/StoryboardConstraint'
  s.screenshots        = 'https://raw.githubusercontent.com/dimix/StoryboardConstraint/master/readme-images/demo.gif'
  s.license            = "MIT"
  s.author             = { 'Dimitri Giani' => 'dimitri.giani@gmail.com' }
  s.platform           = :ios, "9.0"
  s.source             = { :git => 'https://github.com/dimix/StoryboardConstraint.git', :tag => "#{s.version}" }
  s.source_files       = "Classes", "StoryboardConstraint/*.{swift}"
end
