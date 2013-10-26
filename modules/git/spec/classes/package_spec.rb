# spec/classes/package_spec.pp

require 'spec_helper'

describe 'git::package' do

  context 'install git-core' do
    it { should contain_package('git-core')
      .with_ensure('latest')
    }
  end

end
