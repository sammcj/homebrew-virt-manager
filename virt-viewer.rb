class VirtViewer < Formula
  desc "App for virtualized guest interaction"
  homepage "https://virt-manager.org/"
  url "https://virt-manager.org/download/sources/virt-manager/virt-manager-1.4.0.tar.gz"
  sha256 "bf31a40cc48500cbf87a0e93a5838fc3f6ce4e2fa03f8bce6aa2615625e6caca"

  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  depends_on "gtk+3"
  depends_on "gtk-vnc"
  depends_on "hicolor-icon-theme"
  depends_on "libvirt"
  depends_on "shared-mime-info"
  depends_on "spice-gtk"
  depends_on "spice-protocol"
  depends_on "gettext"
  depends_on :x11
  # TODO: audio

  def install
    system "sudo python setup.py install ", "--prefix=/usr"
  end

  def post_install
    # manual update of mime database
    system "#{Formula["shared-mime-info"].opt_bin}/update-mime-database", "#{HOMEBREW_PREFIX}/share/mime"
    # manual icon cache update step
    system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
  end
end
