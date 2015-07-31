require 'formula'

class Certstrap < Formula
    desc 'Tools to bootstrap CAs, certificate requests, and signed certificates'
    homepage 'https://github.com/square/certstrap'
    head 'https://github.com/square/certstrap.git'

    depends_on 'go' => :build

    def install
        system './build'
        bin.install 'bin/certstrap' => 'certstrap'
    end

    test do
        system bin/"certstrap", "--version"
    end
end
