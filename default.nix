{ lib
, pkgs
, php
}:

php.buildComposerProject (finalAttrs: {
  pname = "league";
  version = "1.0.0";

  src = ./.;

  vendorHash = "sha256-U57XSvk8Ycu8WlvkD+CMjEjLtHaucFoU8U6Wauc+GDo=";
})
