TYPE=VIEW
query=select `tvdatabase`.`schedule`.`scheduleId` AS `scheduleId`,`tvdatabase`.`schedule`.`typeId` AS `typeId`,(case when (`tvdatabase`.`schedule`.`movieId` is not null) then `tvdatabase`.`movie`.`movieName` when (`tvdatabase`.`schedule`.`episodeId` is not null) then concat(`tvdatabase`.`seriesepisode`.`seriesName`,_utf8\'. \',`tvdatabase`.`seriesepisode`.`episodeName`) when (`tvdatabase`.`schedule`.`broadcastId` is not null) then `tvdatabase`.`broadcast`.`broadcastName` end) AS `scheduletitle`,(case when (`tvdatabase`.`schedule`.`movieId` is not null) then _utf8\'фильм\' when (`tvdatabase`.`schedule`.`episodeId` is not null) then _utf8\'сериал\' when (`tvdatabase`.`schedule`.`broadcastId` is not null) then _utf8\'передача\' end) AS `scheduletype`,(case when (`tvdatabase`.`schedule`.`movieId` is not null) then `tvdatabase`.`schedule`.`movieId` when (`tvdatabase`.`schedule`.`episodeId` is not null) then `tvdatabase`.`schedule`.`episodeId` when (`tvdatabase`.`schedule`.`broadcastId` is not null) then `tvdatabase`.`schedule`.`broadcastId` end) AS `objectId`,cast(concat(time_format(`tvdatabase`.`schedule`.`scheduleStart`,_utf8\'%H:%i\'),_utf8\' - \',time_format(`tvdatabase`.`schedule`.`scheduleEnd`,_utf8\'%H:%i\')) as char charset utf8) AS `scheduleTime`,cast(concat(`tvdatabase`.`channel`.`channelOrder`,_utf8\'. \',`tvdatabase`.`channel`.`channelName`) as char charset utf8) AS `channelOrderName`,`tvdatabase`.`channel`.`channelName` AS `channelname`,`tvdatabase`.`schedule`.`scheduleDate` AS `scheduledate`,`tvdatabase`.`schedule`.`scheduleStart` AS `schedulestart`,`tvdatabase`.`schedule`.`scheduleEnd` AS `scheduleend`,`tvdatabase`.`schedule`.`scheduleIsNextDay` AS `scheduleisnextday`,`tvdatabase`.`schedule`.`channelId` AS `channelId`,`tvdatabase`.`channel`.`channelOrder` AS `channelOrder` from ((((`tvdatabase`.`schedule` left join `tvdatabase`.`broadcast` on((`tvdatabase`.`schedule`.`broadcastId` = `tvdatabase`.`broadcast`.`broadcastId`))) left join `tvdatabase`.`movie` on((`tvdatabase`.`schedule`.`movieId` = `tvdatabase`.`movie`.`movieId`))) left join `tvdatabase`.`seriesepisode` on((`tvdatabase`.`schedule`.`episodeId` = `tvdatabase`.`seriesepisode`.`episodeId`))) join `tvdatabase`.`channel` on((`tvdatabase`.`schedule`.`channelId` = `tvdatabase`.`channel`.`channelId`)))
md5=aa0d1c86b829f42b3d84c48c58e046af
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
revision=1
timestamp=2009-07-05 21:59:06
create-version=1
source=select `schedule`.`scheduleId` AS `scheduleId`,`schedule`.`typeId` AS `typeId`,(case when (`schedule`.`movieId` is not null) then `movie`.`movieName` when (`schedule`.`episodeId` is not null) then concat(`seriesepisode`.`seriesName`,_utf8\'. \',`seriesepisode`.`episodeName`) when (`schedule`.`broadcastId` is not null) then `broadcast`.`broadcastName` end) AS `scheduletitle`,(case when (`schedule`.`movieId` is not null) then _utf8\'фильм\' when (`schedule`.`episodeId` is not null) then _utf8\'сериал\' when (`schedule`.`broadcastId` is not null) then _utf8\'передача\' end) AS `scheduletype`,(case when (`schedule`.`movieId` is not null) then `schedule`.`movieId` when (`schedule`.`episodeId` is not null) then `schedule`.`episodeId` when (`schedule`.`broadcastId` is not null) then `schedule`.`broadcastId` end) AS `objectId`,cast(concat(time_format(`schedule`.`scheduleStart`,_utf8\'%H:%i\'),_utf8\' - \',time_format(`schedule`.`scheduleEnd`,_utf8\'%H:%i\')) as char charset utf8) AS `scheduleTime`,cast(concat(`channel`.`channelOrder`,_utf8\'. \',`channel`.`channelName`) as char charset utf8) AS `channelOrderName`,`channel`.`channelName` AS `channelname`,`schedule`.`scheduleDate` AS `scheduledate`,`schedule`.`scheduleStart` AS `schedulestart`,`schedule`.`scheduleEnd` AS `scheduleend`,`schedule`.`scheduleIsNextDay` AS `scheduleisnextday`,`schedule`.`channelId` AS `channelId`,`channel`.`channelOrder` AS `channelOrder` from ((((`schedule` left join `broadcast` on((`schedule`.`broadcastId` = `broadcast`.`broadcastId`))) left join `movie` on((`schedule`.`movieId` = `movie`.`movieId`))) left join `seriesepisode` on((`schedule`.`episodeId` = `seriesepisode`.`episodeId`))) join `channel` on((`schedule`.`channelId` = `channel`.`channelId`)))