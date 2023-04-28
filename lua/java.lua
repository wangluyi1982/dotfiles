local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls/'
local plugins_dir = jdtls_dir .. '/plugins/'
local path_to_jar = plugins_dir .. '/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local lombok_path = jdtls_dir .. "lombok.jar"


local jdk_home
local config_dir
if package.config:sub(1,1) == '\\' then -- Windows
    print('Windows')
    jdk_home = "C:/Users/luyiw/scoop/apps/openjdk19/current/"
    config_dir = jdtls_dir .. '/config_win/'
elseif package.config:sub(1,1) == '/' then -- macOS
    if package.config:sub(3,3) == '\n' then
        print('mac')
        jdk_home = "/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
        config_dir = jdtls_dir .. '/config_mac/'
    else -- Linux
        print('linux')
        jdk_home = "/usr/lib/jvm/java-19-openjdk-amd64"
        config_dir = jdtls_dir .. '/config_linux/'
    end
end

local jdtls_cache = vim.fn.stdpath('cache') .. '/jdtls/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = jdtls_cache .. '/workspace/' .. project_name
os.execute("mkdir " .. workspace_dir)

-- Main Config
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    jdk_home .. '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. lombok_path,
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', path_to_jar,
    '-configuration', config_dir,
    '-data', workspace_dir,
  },

  on_attach = function(_)
      require'vim.lsp.log'.error('xxx on_attach: '..vim.inspect(vim.lsp.get_active_clients()))
  end,
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --root_dir = function() return vim.fs.dirname(vim.fs.find({ '.gradlew', '.gitignore', 'mvnw', 'build.grade.kts', 'pom.xml', '.git' }, { upward = true })[1]) .. "\\" end ,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      home = jdk_home ,
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-19",
            path = jdk_home
          },
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },

    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org"
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('lspconfig').jdtls.setup(config)
