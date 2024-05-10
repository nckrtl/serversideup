<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />

        <!-- Styles -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="font-sans antialiased dark:bg-gray-900 dark:text-white/50 h-screen flex items-center justify-center">
        <a href="{{ route('dispatch-job') }}">
            <button class="py-2 px-4 rounded-lg bg-gray-700 border-t border-gray-600 text-white">Dispatch long running job</button>
        </a>
    </body>
</html>
