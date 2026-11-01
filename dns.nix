{ lib, pkgs, ... }:
let
  identifier = "us.xtian.dns";

  dnsSettings = {
    DNSProtocol = "HTTPS";
    ServerURL = "https://cloudflare-dns.com/dns-query";
    ServerAddresses = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

  # Derive UUIDs from the settings so a config change yields a new profile UUID,
  # which the activation check below uses to detect a stale install.
  mkUUID =
    salt:
    let
      h = builtins.hashString "sha256" (salt + builtins.toJSON dnsSettings);
      s = start: len: builtins.substring start len h;
    in
    lib.toUpper "${s 0 8}-${s 8 4}-${s 12 4}-${s 16 4}-${s 20 12}";

  profileUUID = mkUUID "profile";

  profile = pkgs.writeText "dns.mobileconfig" (
    lib.generators.toPlist { escape = true; } {
      PayloadType = "Configuration";
      PayloadVersion = 1;
      PayloadIdentifier = identifier;
      PayloadUUID = profileUUID;
      PayloadDisplayName = "Encrypted DNS (Cloudflare DoH)";
      PayloadScope = "System";
      PayloadContent = [
        {
          PayloadType = "com.apple.dnsSettings.managed";
          PayloadVersion = 1;
          PayloadIdentifier = "${identifier}.settings";
          PayloadUUID = mkUUID "settings";
          PayloadDisplayName = "Encrypted DNS";
          DNSSettings = dnsSettings;
        }
      ];
    }
  );

  profilePath = "/etc/nix-darwin-profiles/dns.mobileconfig";
in
{
  environment.etc."nix-darwin-profiles/dns.mobileconfig".source = profile;

  system.activationScripts.postActivation.text = ''
    if ! /usr/bin/profiles list 2>/dev/null | grep -q "${profileUUID}"; then
      echo >&2 "warning: encrypted DNS profile is not installed or is out of date."
      echo >&2 "  Run: open ${profilePath}"
      echo >&2 "  Then approve it in System Settings > General > Device Management."
    fi
  '';
}
