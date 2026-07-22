pcmanfm_sources = files(
  'pcmanfm.c',
  'app-config.c',
  'main-win.c',
  'tab-page.c',
  'desktop.c',
  'volume-manager.c',
  'pref.c',
  'single-inst.c',
  'connect-server.c',
)

pcmanfm_modules_dir = get_option('libdir') / 'pcmanfm'

pcmanfm_c_args = [
  '-DPACKAGE_DATA_DIR="' + get_option('prefix') / get_option('datadir') / 'pcmanfm' + '"',
  '-DPACKAGE_UI_DIR="' + get_option('prefix') / get_option('datadir') / 'pcmanfm' / 'ui' + '"',
  '-DPACKAGE_MODULES_DIR="' + get_option('prefix') / pcmanfm_modules_dir + '"',
  '-DPACKAGE_LOCALE_DIR="' + get_option('prefix') / get_option('localedir') + '"',
  '-Wall',
  '-Werror-implicit-function-declaration',
] + g_cast_checks_args

executable('pcmanfm',
  pcmanfm_sources,
  c_args : pcmanfm_c_args,
  include_directories : config_h_dir,
  dependencies : fm_deps + [x11_dep],
  install : true,
)

install_headers('pcmanfm-modules.h')

# prepare empty modules directory, matching the autotools install-exec-local
install_emptydir(pcmanfm_modules_dir)
