README - Lab 2

Instructions to run:
--------------------
1. Open MySQL Workbench and connect to your local server.
2. Load the schema and data from the given script:
   - Create and insert data using the provided CREATE TABLE and INSERT statements.
3. Execute each SQL file (`q1.sql` to `q5.sql`) in the following order:

   a. q1.sql: Creates ListAllSubscribers() to print subscriber names using a cursor.
   b. q2.sql: Creates GetWatchHistoryBySubscriber(sub_id) to return watch history.
   c. q3.sql: Creates AddSubscriberIfNotExists(subName) to conditionally add a subscriber.
   d. q4.sql: Creates SendWatchTimeReport() that prints watch time for all active viewers.
   e. q5.sql: Creates PrintAllSubscribersWatchHistory() to print all watch history.

4. Call procedures using:
   - CALL ListAllSubscribers();
   - CALL GetWatchHistoryBySubscriber(1);
   - CALL AddSubscriberIfNotExists('New User');
   - CALL SendWatchTimeReport();
   - CALL PrintAllSubscribersWatchHistory();

GitHub Repository:
-------------------
https://github.com/SnigdhaPani/2025204029_SSD_lab_activity_submissions
