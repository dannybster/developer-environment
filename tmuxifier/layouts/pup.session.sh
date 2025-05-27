# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/neoma"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "pup"; then
  window_root "$HOME/Dropbox/wulfstack/products/pup/"

  # Create the window the runs the server and Cypress tests.
  # new_window "server/cypress"
  # split_h 50
  #
  # select_pane 1
  # run_cmd "npm run start:neoma:cypress"
  #
  # select_pane 2
  # run_cmd "npm run cypress"
  #

  # Create a window to run the dev server.
  new_window "server"
  run_cmd "npm run start:dev"

  # Create a window that runs the tests.
  new_window "tests"
  split_h 50

  select_pane 1
  run_cmd "npm run test:e2e"

  select_pane 2
  run_cmd "npm run test"

  # Create a window contains the IDE.
  new_window "ide"
  run_cmd "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
