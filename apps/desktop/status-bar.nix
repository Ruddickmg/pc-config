{ pkgs, ... }: {
   home.packages = with pkgs; [ yambar ];
   programs.yambar = {
     enable = true;
     settings = {
       bar = {
         location = "top";
         height = 26;
         background = "00000066";
         right = [
           {
             clock.content = [
               {
                 string.text = "{time}";
               }
             ];
           }
         ];
       };
     };
   };
}