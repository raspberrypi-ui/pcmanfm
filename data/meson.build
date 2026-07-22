man_conf = configuration_data()
man_conf.set('PACKAGE', meson.project_name())
man_conf.set('VERSION', meson.project_version())

configure_file(
  input : 'pcmanfm.1.in',
  output : 'pcmanfm.1',
  configuration : man_conf,
  install : true,
  install_dir : get_option('mandir') / 'man1',
)

i18n.merge_file(
  input : 'pcmanfm.desktop.in',
  output : 'pcmanfm.desktop',
  type : 'desktop',
  po_dir : '../po',
  install : true,
  install_dir : get_option('datadir') / 'applications',
)

install_data('pcmanfm.conf',
  install_dir : get_option('sysconfdir') / 'xdg' / 'pcmanfm' / 'default',
)

subdir('ui')
subdir('icons')
