# TODO: check out community.flake.parts/services-flake/llm
{
  pkgs,
  inputs,
  ...
}:

{
  overlays = [
    (final: prev: {
      open-webui =
        (import inputs.nixpkgs-unstable {
          system = prev.stdenv.system;
          config = {
            allowUnfree = true;
            allowBroken = true;
          };
        }).open-webui;
    })
  ];
  packages = with pkgs; [
    tgpt
    # github.com/NixOS/nixpkgs/blob/nixos-25.05/pkgs/by-name/op/open-webui/package.nix
    open-webui
  ];

  env = {
    WEBUI_URL = "http://localhost:1212";
    SHOW_ADMIN_DETAILS = true;
    ADMIN_EMAIL = "dev@ai-tinkerers-ottawa.org";
    # OPENAI_API_KEY = "";
    DATABASE_URL = "postgresql://postgres:postgres@127.0.0.1:54322/postgres";
    # REDIS_URL = "redis://localhost:6379/0";
    ENABLE_OTEL = true;
    OTEL_EXPORTER_OTLP_ENDPOINT = "http://localhost:4317";
  };
}
