{pkgs}: let
  inherit (pkgs) lib;
  name = "run-raincloud-installer";
in
  pkgs.writeShellApplication {
    inherit name;
    runtimeInputs = with pkgs; [gnutar gzip];
    text = ''
      if [ $# -lt 1 ]; then
        echo "Usage: $(basename "$0") /path/to/rain_cloud_setup_wizard"
        exit 1
      fi
      INST="$1"
      if [[ "''${INST##*.}" == "tgz" ]]; then
        DTMP=$(mktemp -d)
        echo "Archive specified, unpacking (to $DTMP) first..."
        tar -zxf "$INST" -C "$DTMP"
        INST="$DTMP/rain_cloud_setup_wizard"
      echo "done."
      fi
      # if the specified installer was not an archive, assume it's a binary
      echo "Running $INST"
      LD_LIBRARY_PATH=${lib.makeLibraryPath [pkgs.libepoxy]} \
        ${lib.getExe pkgs.steam-run} "$INST"
    '';
  }
