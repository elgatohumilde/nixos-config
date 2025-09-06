{ lib, ... }:
let
  subdirs = builtins.attrNames (builtins.readDir ./.);
  moduleDirs = lib.filter (name: (builtins.readDir ./.).${name} == "directory") subdirs;
in
{
  imports = map (dir: ./${dir}) moduleDirs;
}
