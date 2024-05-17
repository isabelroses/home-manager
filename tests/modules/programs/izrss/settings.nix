{ ... }:

{
  config = {
    programs.izrss = {
      enable = true;

      urls = [ "https://example.com/rss.xml" "https://example.co.uk/rss.xml" ];

      settings = {
        dateformat = "2006/01/02";
        colors = {
          text = "#cdd6f4";
          inverttext = "#1e1e2e";
          subtext = "#a6adc8";
          accent = "#74c7ec";
          borders = "#313244";
        };
      };
    };

    nmt.script = ''
      assertFileExists home-files/.config/izrss/urls
      assertFileContent home-files/.config/izrss/urls ${./basic-urls}

      assertFileExists home-files/.config/izrss/config.toml
      assertFileContent home-files/.config/izrss/config.toml ${
        ./basic-configuration.toml
      }
    '';
  };
}
