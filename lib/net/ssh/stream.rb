require 'net/ssh/stream/version'

require 'net/ssh'

module Net
  module SSH
    class Stream

      def initialize(*args)
        @session ||= Net::SSH.start *args
      end

      def close
        if @session && !@session.closed?
          @session.close
          @session = nil
        end
      end

      def exec(command, options={})
        stdout = options.fetch(:stdout, STDOUT)
        stderr = options.fetch(:stderr, STDERR)

        exit_code = nil
        
        @session.open_channel do |channel|
          channel.exec(command) do |ch, success|
            unless success
              abort "FAILED: couldn't execute command (ssh.channel.exec)"
            end
            
            channel.on_data do |ch, data|
              stdout << data
            end

            channel.on_extended_data do |ch, type, data|
              stderr << data
            end

            channel.on_request("exit-status") do |ch, data|
              exit_code = data.read_long
            end
          end
        end

        @session.loop
        
        exit_code
      end

      def exec!(command, options={})
        exit_code = self.exec command, options
        raise "Command fail - Exit code #{exit_code} - #{command}" if exit_code != 0
      end

      def self.start(*args)
        stream = self.new *args
        yield stream
      ensure
        stream.close
        nil
      end

    end
  end
end