# braindump

A site for writing.

[![Build Status](https://secure.travis-ci.org/icco/braindump.png)](http://travis-ci.org/icco/braindump)

## MVP

 * One box for writing text
 * Ability to export all data in a reasonable format
 * a Stream
 * revision history
 * Mobile apps

## Database Stuff

 * `rake ar:migrate:new`
 * edit file
 * `rake ar:migrate`

## Resources

To run your site locally, run `rake local`.

## Thoughts

 * write a router that automatically creates routes for all helpers using json.

 * currently designed around one stream of posts per person. Posts are editable and have version history.
   * Plan: redsign stream page. Make version history less apparent. Eventually transition to multiple threads
   * Also add friends and an auth system.
