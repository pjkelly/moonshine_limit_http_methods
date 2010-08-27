module LimitHttpMethods

  # Define options for this plugin via the <tt>configure</tt> method
  # in your application manifest:
  #
  #    configure(:limit_http_methods => {:methods => ['PUT', 'DELETE']})
  #
  # You only need to do this if you don't like the default list of methods provided below.
  #
  # Moonshine will autoload plugins, just call the recipe(s) you need in your
  # manifests:
  #
  #    recipe :limit_http_methods
  #
  def limit_http_methods(hash = {})
    options = {
      :methods => ['CONNECT', 'OPTIONS', 'PATCH', 'PROPFIND', 'PROPPATCH', 'MKCOL', 'COPY', 'MOVE', 'LOCK', 'UNLOCK']
    }.merge(hash)

    previous_extra = configuration[:passenger][:vhost_extra] || ''
    method_limits = <<-METHOD_LIMITS
  <Location />
    <Limit #{options[:methods].join(" ")}>
      order deny,allow
      deny from all
    </Limit>
  </Location>
METHOD_LIMITS

    configure(:passenger => { :vhost_extra => "#{previous_extra}\n#{method_limits}"})
  end

end
