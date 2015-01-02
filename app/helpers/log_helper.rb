module LogHelper
      def self.log_req(req)
        #p req.path

        Logs.insert(:path=> req.path, :ip=> req.ip, 
        	:referer=> req.referer,  :date => DateTime.now, :uagent=> req.user_agent )# if not req.user_agent.include? 'Windows NT 6.1' 

      end

end