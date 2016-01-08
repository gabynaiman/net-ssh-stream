require 'minitest_helper'

describe Net::SSH::Stream do

  let(:username) { `whoami`.strip }

  def exec(command, stdout: STDOUT, stderr: STDERR)
    exit_status = nil
    Net::SSH::Stream.start('localhost', username) do |stram|
      exit_status = stram.exec command, stdout: stdout, stderr: stderr
    end
    exit_status
  end
  
  it 'STDOUT' do
    stdout = StringIO.new
    exit_status = exec 'pwd', stdout: stdout
    stdout.rewind

    assert_equal 0, exit_status
    assert_equal "/home/#{username}", stdout.read.strip
  end

  it 'STDERR' do
    stderr = StringIO.new
    exit_status = exec 'invalid-command', stderr: stderr
    stderr.rewind

    refute_equal 0, exit_status
    assert_equal "bash: invalid-command: command not found", stderr.read.strip
  end

end