require 'formula'

class ItunesIndexer < Formula
    desc 'Tool to generate a SQLite index of an iTunes music library'
    homepage 'https://github.com/roguePanda/itunes-remote/tree/master/itunes-indexer'
    head 'https://github.com/roguePanda/itunes-remote.git'

    depends_on :macos => :mavericks
    depends_on :xcode

    def install
        (buildpath/"itunes-indexer").cd do
            xcodebuild "-workspace", "itunes-indexer.xcworkspace",
                       "-scheme", "itunes-indexer",
                       "DSTROOT=#{prefix}",
                       "INSTALL_PATH=/bin",
                       "install"
        end
    end

    # TODO: need to know user to run as
    # plist_options :manual => "itunes-indexer -d "
    #
    # def plist; <<-EOS.undent
    #     <?xml version="1.0" encoding="UTF-8"?>
    #     <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    #     <plist version="1.0">
    #         <key>Label</key>
    #         <string>#{plist_name}</string>
    #         <key>ProgramArguments</key>
    #     </plist>
    #     EOS
    # end
end
