require 'spec_helper_acceptance'

describe 'repoforge installation', :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do

  context 'valid user parameter' do

    it 'should work with no errors' do
      pp = <<-EOS
        include ::repoforge
      EOS

      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
   end

   describe yumrepo('repoforge') do
     it { should exist }
     it { should be_enabled }
   end

  end

end
