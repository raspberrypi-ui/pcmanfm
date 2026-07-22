project('pcmanfm', 'c',
  version : '1.4.0',
  license : 'GPL-2.0-or-later',
  meson_version : '>= 0.60.0',
  default_options : ['c_std=gnu11'],
)

cc = meson.get_compiler('c')
i18n = import('i18n')

gettext_package = 'pcmanfm'

conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', gettext_package)

# Large file support
conf.set('_LARGEFILE64_SOURCE', 1, description : 'Whether to enable large file support')
conf.set('_FILE_OFFSET_BITS', 64, description : 'File offset bits')

g_cast_checks_args = ['-DG_DISABLE_CAST_CHECKS']

extra_c_args = [
  '-D_LARGEFILE_SOURCE', '-D_REENTRANT', '-D_FILE_OFFSET_BITS=64',
  # turn off glib debug checks
  '-DG_DISABLE_ASSERT', '-DG_DISABLE_CHECKS',
  # gtk-layer-shell only supports GTK+ 3, so warnings about deprecated GTK+ 3
  # API are expected and silenced here, same as the old --with-gtk=3 path.
  '-Wno-deprecated-declarations',
]

add_project_arguments(extra_c_args, language : 'c')

configure_file(output : 'config.h', configuration : conf)
config_h_dir = include_directories('.')
add_project_arguments('-DHAVE_CONFIG_H', language : 'c')

x11_dep = dependency('x11')
gio_dep = dependency('gio-unix-2.0', version : '>= 2.18.0')
gthread_dep = dependency('gthread-2.0')
glib_dep = dependency('glib-2.0')
pango_dep = dependency('pango', version : '>= 1.20.0')
libfm_dep = dependency('libfm', version : '>= 1.0')
layer_shell_dep = dependency('gtk-layer-shell-0', version : '>= 0.6')
gtk_dep = dependency('gtk+-3.0')
libfm_gtk_dep = dependency('libfm-gtk3', version : '>= 1.0.1')
m_dep = cc.find_library('m', required : false)

fm_deps = [
  gio_dep, gthread_dep, glib_dep, pango_dep,
  libfm_dep, layer_shell_dep, gtk_dep, libfm_gtk_dep, m_dep,
]

subdir('src')
subdir('po')
subdir('data')
