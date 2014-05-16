require 'formula'

class Voltdb < Formula
  homepage 'https://github.com/VoltDB/voltdb'
  head 'https://github.com/VoltDB/voltdb.git'
  url 'https://github.com/VoltDB/voltdb/archive/voltdb-3.7.0.5.tar.gz'
  sha1 '4710a0b442818ee6f70c3c6bda1e653d6ae0b18e'

  depends_on :ant

  def install
    system 'ant'

    inreplace Dir["bin/*"] - ["bin/voltadmin"],
      /VOLTDB_LIB=\$VOLTDB_HOME\/lib/, 'VOLTDB_LIB=$VOLTDB_HOME/lib/voltdb'

    (lib/'voltdb').install Dir['lib/*']
    lib.install_symlink lib/"voltdb/python"
    prefix.install 'bin', 'tools', 'voltdb', 'version.txt', 'doc'
  end
end
