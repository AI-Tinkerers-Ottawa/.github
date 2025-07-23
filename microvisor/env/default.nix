{
  imports = [
    ./db.nix
  ];

  # NOTE: existing env vars in devenv.nix will have priority
  dotenv = {
    enable = true;
    filename = [
      ".env"
    ];
  };

  env = {
    #====================================================
    #                  🏁 FLAGS 🏁
    #====================================================
    # SUPABASE="true"; # Requires Docker
    # SQLITE="true";
    ZELLIJ_AUTO_ATTACH = "true";
    ZELLIJ_AUTO_EXIT = "true";

    #====================================================
    #                      PORTS
    #====================================================
    APP_DEV_SERVER_PORT = "3000";
    ADMIN_DEV_SERVER_PORT = "8000";
    API_SERVER_PORT = "5150";
    DOCS_DEV_SERVER_PORT = "4000";
    ARCHITECTURE_DEV_SERVER_PORT = "5173";
    GRAPH_DEV_SERVER_PORT = "4211";
    NODE_MODULES_INSPECTOR_PORT = "7000";

    #====================================================
    #                      URLS
    #====================================================
    LOCALHOST_STRING = "http://localhost";

    APP_LOCAL_URL = "http://localhost:3000";
    ADMIN_LOCAL_URL = "http://localhost:8000";
    API_SERVER_LOCAL_URL = "http://localhost:8080";
    DOCS_LOCAL_URL = "http://localhost:4000";
    ARCHITECTURE_LOCAL_URL = "http://localhost:5173";
    SUPABASE_STUDIO_URL = "http://localhost:54323";
  };
}
