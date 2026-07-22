# GtkBuilder UI definition files
ui_sources = [
  'pref.glade',
  'desktop-pref.glade',
  'autorun.glade',
  'connect.glade',
]

ui_install_dir = get_option('datadir') / 'pcmanfm' / 'ui'

about_conf = configuration_data()
about_conf.set('VERSION', meson.project_version())

about_glade = configure_file(
  input : 'about.glade.in',
  output : 'about.glade',
  configuration : about_conf,
)

# Purge GtkBuilder UI files: strip comments and collapse inter-tag whitespace
glade_to_ui = files('glade2ui.sh')

foreach f : ui_sources
  out = f.replace('.glade', '.ui')
  custom_target(out,
    input : f,
    output : out,
    command : [glade_to_ui, '@INPUT@', '@OUTPUT@'],
    install : true,
    install_dir : ui_install_dir,
  )
endforeach

custom_target('about.ui',
  input : about_glade,
  output : 'about.ui',
  command : [glade_to_ui, '@INPUT@', '@OUTPUT@'],
  install : true,
  install_dir : ui_install_dir,
)
