class FreckleApi < NSObject
  TOKEN = "1opmx4g9v944psyjfq35985jcs94au1"
  URL = "https://appren.letsfreckle.com/api/"

  def self.getProjects(&block)
    request(:get, "projects.json") do |response|
      if response.ok?
        json = BubbleWrap::JSON.parse(response.body.to_str)
        block.call(json)
      else
        App.alert(response.body)
      end
    end
  end

  def self.request(*args, &block)
    verb = args.shift
    url = URL + args.shift
    options = args.shift
    options ||= {}
    options[:headers] = {"X-FreckleToken" => TOKEN}
    BubbleWrap::HTTP.send(verb, url, options, &block)
  end
end
