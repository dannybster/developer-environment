# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/wulf"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "wulf"; then
  window_root "$HOME/Dropbox/wulfstack/products/neoma/"

  # Create the window the runs the server and Cypress tests.
  new_window "server/cypress"
  split_h 50

  select_pane 1
  run_cmd "npm run start:neoma:cypress"

  select_pane 2
  run_cmd "npm run cypress"

  # Create a window that runs the tests.
  new_window "tests"
  split_h 50

  select_pane 1
  run_cmd "npm run test:neoma:e2e -- --watch"

  select_pane 2
  run_cmd "npm run test:neoma -- --watch"

  # Create a window contains the IDE.
  new_window "ide"
  run_cmd "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
