--
-- ASYNC
--

--Should work. Send a valid message via a valid channel name
SELECT pg_notify('notify_async1','sample message1');
SELECT pg_notify('notify_async1','sample_message1',true);
SELECT pg_notify('notify_async1','sample_message1',false);
SELECT pg_notify('notify_async1','');
SELECT pg_notify('notify_async1',NULL);

-- Should fail. Send a valid message via an invalid channel name
SELECT pg_notify('','sample message1');
-- ERROR:  channel name cannot be empty
SELECT pg_notify(NULL,'sample message1');
-- ERROR:  channel name cannot be empty
SELECT pg_notify('notify_async_channel_name_too_long______________________________','sample_message1');
-- ERROR:  channel name too long

--Should work. Valid NOTIFY/LISTEN/UNLISTEN commands
NOTIFY notify_async2;
NOTIFY notify_async2 WITH (collapse off);
NOTIFY notify_async2, '';
NOTIFY notify_async2, '' (collapse on);
NOTIFY notify_async2, '' WITH (collapse off);
LISTEN notify_async2;
UNLISTEN notify_async2;
UNLISTEN *;

-- Should fail. Invalid option syntax
NOTIFY notify_async2, 'test' WITH ( wrong opt );
NOTIFY notify_async2, 'test' (collapse = maybe);


-- Should return zero while there are no pending notifications.
-- src/test/isolation/specs/async-notify.spec tests for actual usage.
SELECT pg_notification_queue_usage();
