{
  processes = {
    "🎥 slides" = {
      exec = "presenterm slides/index.md";
      process-compose = {
        log_configuration = {
          fields_order = [
            "level"
            "message"
            "time"
          ];
        };
        description = "Terminal Slide Deck using Presenterm";
        is_tty = true;
        namespace = "✨ Front-End";
      };
    };

    "💊 Microdoctor" = {
      exec = "doctor";
      process-compose = {
        description = "💊 Microdoctor";
        namespace = "🩺 HEALTH CHECK";
        disabled = false;
        is_tty = true;
      };
    };

    "🔮 fastfetch -C all.jsonc" = {
      exec = "fastfetch -C all.jsonc";
      process-compose = {
        namespace = "🩺 HEALTH CHECK";
        is_tty = true;
        disabled = false;
      };
    };

    "🤖 open-webui serve --port 1212" = {
      exec = "open-webui serve --port 1212";
      process-compose = {
        description = "🤖 Use the GPT LLM of your choice";
        namespace = "🧮 VIEWS";
        disabled = true;
        is_tty = true;
        # depends_on = {
        #   postgres.condition = "process_healthy";
        # };
      };
    };

    "🟩 supabase start" = {
      exec = "process-compose process stop postgres; supabase start --workdir microvisor/services";
      process-compose = {
        description = "🟩 Supabase | 54323";
        is_tty = true;
        depends_on = {
          postgres.condition = "process_complete";
        };
        ready_log_line = "Started supabase local development setup.";
        namespace = "📀 DATABASES";
        disabled = true;
      };
    };

    "👋 hello" = {
      exec = "hello";
      process-compose = {
        description = "👋🧩 Show the Devenv logo art and a friendly greeting";
        namespace = "🩺 HEALTH CHECK";
        disabled = false;
      };
    };

    "🕹  console" = {
      exec = ''
        ttyd --writable --browser --url-arg --once devenv up
      '';
      process-compose = {
        description = "🕹 Attach the Microvisor Kernel to the Browser";
        namespace = "🧮 VIEWS";
        disabled = true;
      };
    };

    "📦 node-modules-inspector --depth=7 --port=7000" = {
      exec = "pnpm node-modules-inspector --depth=7 --port=7000";
      process-compose = {
        description = "📦 Node Modules Inspector | 7000";
        is_tty = true;
        readiness_probe = {
          http_get = {
            port = "7000";
            host = "localhost";
            scheme = "http";
          };
        };
        namespace = "📦 DEPS";
        disabled = true;
      };
    };

    "ℹ devenv info" = {
      exec = "devenv info";
      process-compose = {
        description = "❄ devenv info";
        is_tty = true;
        namespace = "🩺 HEALTH CHECK";
        disabled = false;
      };
    };
  };

  process = {
    manager.args = {
      "theme" = "One Dark";
    };
    managers.process-compose.settings.availability = {
      restart = "on_failure";
      backoff_seconds = 2;
      max_restarts = 5;
    };
  };
}
