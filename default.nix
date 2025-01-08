{ lib
, pkgs
, php
, configFile ? null
, smartyConfigFile ? null
}:

php.buildComposerProject (finalAttrs: {
  pname = "league";
  version = "1.0.0";

  src = ./.;

  postPatch = (lib.optionalString (configFile != null) ''
    cp ${configFile} config.php
    rm *.default.php
  '') + (lib.optionalString (smartyConfigFile != null) ''
    cp ${smartyConfigFile} configs/main.conf
  '');

  vendorHash = "sha256-U57XSvk8Ycu8WlvkD+CMjEjLtHaucFoU8U6Wauc+GDo=";
})
