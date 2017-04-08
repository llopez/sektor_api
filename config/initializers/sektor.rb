Sektor.configure do |c|
  c.proxy =  Rails.application.secrets.sektor_proxy
  c.domain = Rails.application.secrets.sektor_domain
end
