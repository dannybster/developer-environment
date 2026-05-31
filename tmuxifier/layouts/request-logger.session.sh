# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/logging"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "logging"; then
  session_root "$HOME/Dropbox/neomaventures/software/npm/pack/packages/logging"

  # Create a new window for the specs.
  new_window "specs"
  split_h 50

  select_pane 1
  run_cmd "npm run test:e2e -- --watch"

  select_pane 2
  run_cmd "npm run test -- --watch"

  # Start the IDE.
  new_window "ide"
  run_cmd "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
