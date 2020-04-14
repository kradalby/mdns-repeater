class MdnsRepeater < Formula
  desc "Multicast DNS repeater"
  homepage "https://github.com/kradalby/mdns-repeater"
  head "https://github.com/kradalby/mdns-repeater.git"

  def install
    system "make"
    bin.install "mdns-repeater"
    doc.install "README.txt", "LICENSE.txt"
  end

  plist_options :manual => "mdns-repeater"

  def plist; <<-EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/mdns-repeater utun2 en0</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
      </dict>
    </plist>
    EOS
  end

  test do
    system bin/"mdns-repeater", "-h"
  end
end
