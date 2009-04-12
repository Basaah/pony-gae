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
		MS::Service.send build_gae_mail(options)
	end
	def self.mail_to_admins(options)
		MS::Service.sendToAdmins build_gae_mail(options)
	end

	def self.build_gae_mail(options)
	  mail = MS::MailService::Message.new
		mail.setTo(options[:to].to_a)
		mail.setSender(options[:from])
		mail.setSubject(options[:subject]) if options[:subject]
		body = options[:body] || " "
		if options[:html_body] == true
      mail.setHtmlBody(body)
    else
      mail.setTextBody(body)
    end    
    mail.setReplyTo(options[:reply_to]) if options[:reply_to]
    mail.setCc(options[:cc].to_a) if options[:cc]
    mail.setBcc(options[:bcc].to_a) if options[:bcc]
    if options[:attachments]
      attachments = []
      options[:attachments].each do |filename,data|
        attachments << MS::MailService::Attachment.new(filename,data.to_java_bytes)
      end	        
      mail.setAttachments(attachments)
    end  
    mail   
	end
end

