# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add MinimalCss to rails application
    class MinimalCss < RailsAppGenerator::Addon
      LIBRARIES = {
        water: {
          source: 'https://watercss.kognise.dev',
          content: '<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">'
        },
        picnic: {
          source: 'https://picnicss.com',
          content: '<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/picnic">'
        },
        chota: {
          source: 'https://jenil.github.io/chota/',
          content: '<link rel="stylesheet" href="https://unpkg.com/chota@latest">'
        }
      }.freeze

      # https://purecss.io/
      # https://bulma.io/
      # https://get.foundation/
      # https://www.blazeui.com/
      # https://getbase.org/
      # https://cirrus-ui.netlify.app/
      # https://vanillaframework.io/
      # https://www.patternfly.org/v4/
      # https://tachyons.io/
      # https://nostalgic-css.github.io/NES.css/
      # https://selekkt.dk/skelet/v3/
      # https://picturepan2.github.io/spectre/
      # https://kylelogue.github.io/mustard-ui/
      # https://www.bonsaicss.com/
      # https://ajusa.github.io/lit/
      # https://www.cutestrap.com/
      # https://kbrsh.github.io/wing/
      # https://devinhunt.github.io/typebase.css/
      # http://getskeleton.com/
      # https://semantic-ui.com/
      # https://getuikit.com/

      # ANIMATION
      # https://animate.style/
      # https://www.csswand.dev/
      # http://animation.kaustubhmenon.com/
      # https://www.minimamente.com/project/magic/

      def apply; end

      def after_bundle
        library_key = (options[:minimal_css_library] || 'water').to_sym

        insert_into_file 'app/views/layouts/application.html.erb', head(library_key), before: %r{^\s+</head>}, force: true
      end

      private

      def head(library_key)
        library = LIBRARIES[library_key] || LIBRARIES[:water]

        content = library[:content]

        "    #{content}\n"
      end
    end
  end
end
