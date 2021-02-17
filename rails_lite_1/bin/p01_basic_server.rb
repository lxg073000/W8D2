require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  # req.each_header do |data|
  #   res.write(data) #if data.include?('referer')
  # end

  requested_path = req.fetch_header("REQUEST_PATH")
  res.write(requested_path)
  
  res['Content-Type'] = 'text/html'
  # res.write('WELL WASN\'t THIS EASY?...')

  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)