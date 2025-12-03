const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    content: [
        './public/*.html',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*.{erb,haml,html,slim}',
        './app/components/**/*.{erb,haml,html,slim}',
    ],
    safelist: [
        'bg-base-200',
        'bg-primary',
        'bg-secondary',
        'bg-accent',
        'bg-neutral',
        'bg-info',
        'bg-success',
        'bg-warning',
        'bg-error',
    ],
    theme: {
        extend: {
            fontFamily: {
                sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/container-queries'),
        require('./app/assets/tailwind/daisyui.js'),
    ],
    daisyui: {
        themes: true,
    },
}
