require 'java'

module Pony
	module MS
	  import com.google.appengine.api.mail.MailServiceFactory 
	  import com.google.appengine.api.mail.MailService 
	  Service = MailServiceFactory.mail_service
	end
	
	def self.mail(options)
	  raise(ArgumentError, ":to is required") unless options[:to]
		raise(ArgumentError, ":from is required") unless options[:from]
		transport_via_gae build_gae_mail(options)
	end
	def self.transport_via_gae mail
		MS::Service.send(mail)
	end	
	def self.build_gae_mail(options)
		to = options[:to]
		from = options[:from]
		subject = options[:subject]
		body = options[:body] || " "
		mail = MS::MailService::Message.new(from,to,subject,body)
	end
end
