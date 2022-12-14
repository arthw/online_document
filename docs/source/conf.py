# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Online Documents'
copyright = '2022, Zhang Jianyu'
author = 'Zhang Jianyu'
release = '0.1'
version = '0.1'
# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
        'sphinx_multiversion',
        'recommonmark',
        'sphinx_markdown_tables',
        'sphinx.ext.coverage',
        'sphinx.ext.autosummary',
        'sphinx_md',
        #'autoapi.extension',
        'sphinx.ext.napoleon',
        'sphinx.ext.githubpages',
        'sphinx.ext.autodoc',
        ]

templates_path = ['_templates']

exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

#html_theme = 'alabaster'
html_theme = 'sphinx_rtd_theme'
html_theme_options = {
    'logo_only': False,
    'display_version': True,
    'prev_next_buttons_location': 'bottom',
    'style_external_links': False,
    'vcs_pageview_mode': '',
    #'style_nav_header_background': 'white',
    # Toc options
    'collapse_navigation': True,
    'sticky_navigation': True,
    'navigation_depth': -1,
    'includehidden': True,
    'titles_only': False
}

html_sidebars = {
    '**': [
        'versioning.html',
    ],
}

html_static_path = ['_static']

