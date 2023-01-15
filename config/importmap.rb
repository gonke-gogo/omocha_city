# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "fontawesome", to: "https://kit.fontawesome.com/4db33ad136.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
