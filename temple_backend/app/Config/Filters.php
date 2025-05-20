<?php

namespace Config;

use App\Filters\Cors;
use CodeIgniter\Filters\CSRF;
use CodeIgniter\Filters\DebugToolbar;
use CodeIgniter\Filters\ForceHTTPS;
use CodeIgniter\Filters\Honeypot;
use CodeIgniter\Filters\InvalidChars;
use CodeIgniter\Filters\PageCache;
use CodeIgniter\Filters\PerformanceMetrics;
use CodeIgniter\Filters\SecureHeaders;


class Filters extends BaseFilters
{
    /**
     * Configures aliases for Filter classes to
     * make reading things nicer and simpler.
     *
     * @var array<string, class-string|list<class-string>>
     */
    public array $aliases = [
        'csrf'          => CSRF::class,
        'toolbar'       => DebugToolbar::class,
        'honeypot'      => Honeypot::class,
        'invalidchars'  => InvalidChars::class,
        'secureheaders' => SecureHeaders::class,
        'cors'          => Cors::class,
        'forcehttps'    => ForceHTTPS::class,
        'pagecache'     => PageCache::class,
        'performance'   => PerformanceMetrics::class,
    ];

    /**
     * List of special required filters.
     *
     * Applied before and after other filters, always run.
     *
     * @var array{before: list<string>, after: list<string>}
     */
    public array $required = [
        'before' => [
            'forcehttps', // Force Global Secure Requests
            'pagecache',  // Web Page Caching
        ],
        'after' => [
            'pagecache',   // Web Page Caching
            'performance', // Performance Metrics
            'toolbar',     // Debug Toolbar
        ],
    ];

    /**
     * Filters always applied before and after every request.
     *
     * @var array<string, list<string>>
     */
    public array $globals = [
        'before' => [
            'cors', // handle preflight OPTIONS and add CORS headers before controller runs
        ],
        'after' => [
            'cors',      // add CORS headers after controller
            'toolbar',
            'honeypot',
            'invalidchars',
            'secureheaders',
            'pagecache',
            'performance',
        ],
    ];

    /**
     * Filter aliases that apply to specific HTTP methods.
     *
     * @var array<string, list<string>>
     */
    public array $methods = [];

    /**
     * Filter aliases that run on specific URI patterns.
     *
     * @var array<string, array<string, list<string>>>
     */
    public array $filters = [];
}
