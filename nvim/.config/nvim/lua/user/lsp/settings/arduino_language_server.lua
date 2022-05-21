return {
   cmd = {
      -- Required
      "arduino-language-server",
      "-clangd", "clangd",
      "-cli", "arduino-cli",
      "-cli-config", "/home/oskar/.arduino15/arduino-cli.yaml",
      "-fqbn", "arduino:avr:nano:cpu=atmega328old",
   },
}
-- return {
--    cmd = {
--       -- Required
--       "arduino-language-server",
--       "-clangd clangd",
--       "-cli",
--       "arduino-cli",
--       "-cli-config",
--       "/home/oskar/.arduino15/arduino-cli.yaml",
--       "-fqbn",
--       "arduino:avr:mega",
--    },
-- }
