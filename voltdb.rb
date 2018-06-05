require 'formula'

class Voltdb < Formula
  version '3.7.0.5'
  homepage 'https://github.com/VoltDB/voltdb'
  head 'https://github.com/VoltDB/voltdb.git'
  url 'https://github.com/VoltDB/voltdb/archive/voltdb-3.7.0.5.tar.gz'
  sha256 'ab9b7b02eca75303914e0b641e1edd344bec977528051dd8452fce616bb78a64'

  depends_on 'ant'

  def install
    system 'ant'

    inreplace Dir["bin/*"] - ["bin/voltadmin"],
      /VOLTDB_LIB=\$VOLTDB_HOME\/lib/, 'VOLTDB_LIB=$VOLTDB_HOME/lib/voltdb'

    (lib/'voltdb').install Dir['lib/*']
    lib.install_symlink lib/"voltdb/python"

    # make sure that the voltdb database directory is created
    (var+"voltdb").mkpath
    prefix.install 'bin', 'tools', 'voltdb', 'version.txt', 'doc'
  end
end
