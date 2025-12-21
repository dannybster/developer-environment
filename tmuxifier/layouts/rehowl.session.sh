# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/neoma"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "rehowl"; then
  window_root "$HOME/Dropbox/wulfstack/products/rehowl/"

  # Create a window to run the dev server.
  new_window "server"
  split_h 50

  # Run the tailwind build command in the left pane.
  select_pane 1
  run_cmd "npm run build:tailwind -- --watch"

  # Run the server in the right pane.
  select_pane 2
  run_cmd "npm run start:dev"

  # create a window that runs the e2e tests.
  new_window "e2e"
  run_cmd "npm run test:e2e"

  # create a window that runs the unit/integration tests.
  new_window "specs"
  run_cmd "npm run test"

  # Create a window contains the IDE.
  new_window "ide"
  run_cmd "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
