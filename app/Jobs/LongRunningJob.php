<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Http;

class LongRunningJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        Http::post('https://hooks.slack.com/services/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', [
            'text' => ':rocket: Long running job started '.now()->toDateTimeString(),
        ])
            ->header('Content-Type', 'application/json');

        for ($i = 0; $i < 45; $i++) {
            sleep(1);
            Http::post('https://hooks.slack.com/services/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', [
                'text' => ':hourglass_flowing_sand: Long running job in progress '.now()->toDateTimeString(),
            ])
                ->header('Content-Type', 'application/json');
        }

        Http::post('https://hooks.slack.com/services/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', [
            'text' => ':checkerd-flag: Long running job finished '.now()->toDateTimeString(),
        ])
            ->header('Content-Type', 'application/json');
    }
}
