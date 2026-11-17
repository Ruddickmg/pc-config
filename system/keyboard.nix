{ ... }:
{
  # Caps Lock: tap = Esc, hold = Ctrl (built-in keyboard only).
  services.keyd = {
    enable = true;
    keyboards.builtin = {
      # 0001:0001 is the "AT Translated Set 2 keyboard", i.e. the Framework 13
      # internal keyboard. Verify with `sudo keyd monitor` if hardware changes.
      ids = [ "0001:0001" ];
      settings = {
        main = {
          capslock = "overload(control, esc)";
          # Physical Esc becomes Caps Lock, so a real Caps Lock stays reachable.
          esc = "capslock";
        };
        # Don't emit Esc when a long Ctrl hold is finally released.
        global.overload_tap_timeout = 200;
      };
    };
  };

  # Tell libinput that keyd's virtual keyboard is internal so
  # disable-while-typing keeps working on the touchpad.
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd*keyboard
    AttrKeyboardIntegration=internal
  '';
}
