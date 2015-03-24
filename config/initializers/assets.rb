Rails.application.config.assets.version = '1.0'
Rails.application.config.serve_static_files = true

# Enable the asset pipeline
Rails.application.config.assets.enabled = true
Rails.application.config.assets.initialize_on_precompile = false

Rails.application.config.assets.precompile += %w( modernizr.js )
