Product.delete_all

4.times do |x|
  Product.create(title: "Seven Mobile Apps in Seven Weeks '#{x+1}'", 
  description: 
    %{<p>
      <em>Native Apps, Multiple Platforms</em>
      Answer the question “Can we build this for ALL the devices?” with a resounding YES. This book will help you get there with a real-world introduction to seven platforms, whether you’re new to mobile or an experienced developer needing to expand your options. Plus, you’ll find out which cross-platform solution makes the most sense for your needs.
      </p>},
  image_url: 'http://s3-eu-west-1.amazonaws.com/which-tools-production/feature_tool/projects/46/images/Category_iphone.jpg',
  price: 26.00)
end
