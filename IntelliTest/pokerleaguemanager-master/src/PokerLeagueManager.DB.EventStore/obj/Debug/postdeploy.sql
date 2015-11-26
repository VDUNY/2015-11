﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

DELETE FROM Subscribers

IF '$(PublishEnvironment)' = 'dev'
BEGIN
INSERT INTO Subscribers(SubscriberId, SubscriberUrl) VALUES(newid(), 'http://localhost:1766/Infrastructure/EventService.svc')
END

IF '$(PublishEnvironment)' = 'Local'
BEGIN
INSERT INTO Subscribers(SubscriberId, SubscriberUrl) VALUES(newid(), 'http://localhost:83/PokerLeagueManager.Queries.WCF/Infrastructure/EventService.svc')
END

IF '$(PublishEnvironment)' = 'Build'
BEGIN
INSERT INTO Subscribers(SubscriberId, SubscriberUrl) VALUES(newid(), 'http://localhost:783/PokerLeagueManager.Queries.WCF/Infrastructure/EventService.svc')
END
DELETE FROM [dbo].[Events]

INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'206bc554-c29c-48c0-853c-5ec6e00b658e', CAST(0x0000A2D30109D5F5 AS DateTime), N'e20e8c0d-963d-43e6-9b71-13f84605de8f', N'43ce51cf-8564-484f-b9c8-d77387115018', N'PokerLeagueManager.Common.Events.GameCreatedEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<GameCreatedEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">43ce51cf-8564-484f-b9c8-d77387115018</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">e20e8c0d-963d-43e6-9b71-13f84605de8f</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">206bc554-c29c-48c0-853c-5ec6e00b658e</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:07:52.7107824-06:00</Timestamp><GameDate>2014-01-30T00:00:00</GameDate></GameCreatedEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'3f8c720e-bfb4-486b-a39c-6eea3616b018', CAST(0x0000A2D30109D5F8 AS DateTime), N'e20e8c0d-963d-43e6-9b71-13f84605de8f', N'43ce51cf-8564-484f-b9c8-d77387115018', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">43ce51cf-8564-484f-b9c8-d77387115018</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">e20e8c0d-963d-43e6-9b71-13f84605de8f</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">3f8c720e-bfb4-486b-a39c-6eea3616b018</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:07:52.7267711-06:00</Timestamp><PayIn>1000</PayIn><Placing>1</Placing><PlayerName>Dylan Smith</PlayerName><Winnings>7272</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'f2f121e6-d103-446e-b0ac-f6ef4cb552ef', CAST(0x0000A2D30109D5FB AS DateTime), N'e20e8c0d-963d-43e6-9b71-13f84605de8f', N'43ce51cf-8564-484f-b9c8-d77387115018', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">43ce51cf-8564-484f-b9c8-d77387115018</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">e20e8c0d-963d-43e6-9b71-13f84605de8f</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">f2f121e6-d103-446e-b0ac-f6ef4cb552ef</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:07:52.7347824-06:00</Timestamp><PayIn>5000</PayIn><Placing>2</Placing><PlayerName>Shane Wilkins</PlayerName><Winnings>20</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'34ecef5a-5635-4aa0-a654-10e78d3fb81c', CAST(0x0000A2D30109D5FB AS DateTime), N'e20e8c0d-963d-43e6-9b71-13f84605de8f', N'43ce51cf-8564-484f-b9c8-d77387115018', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">43ce51cf-8564-484f-b9c8-d77387115018</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">e20e8c0d-963d-43e6-9b71-13f84605de8f</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">34ecef5a-5635-4aa0-a654-10e78d3fb81c</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:07:52.7357824-06:00</Timestamp><PayIn>1000</PayIn><Placing>3</Placing><PlayerName>Ryan Fritsch</PlayerName><Winnings>0</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'c1e9c092-c537-48b9-a0f7-c030d80da9f8', CAST(0x0000A2D30109D5FB AS DateTime), N'e20e8c0d-963d-43e6-9b71-13f84605de8f', N'43ce51cf-8564-484f-b9c8-d77387115018', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">43ce51cf-8564-484f-b9c8-d77387115018</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">e20e8c0d-963d-43e6-9b71-13f84605de8f</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">c1e9c092-c537-48b9-a0f7-c030d80da9f8</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:07:52.7377824-06:00</Timestamp><PayIn>272</PayIn><Placing>4</Placing><PlayerName>Grant Hirose</PlayerName><Winnings>0</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'42d6d391-7298-47f2-8d55-833d04d08428', CAST(0x0000A2D30109D5FB AS DateTime), N'e20e8c0d-963d-43e6-9b71-13f84605de8f', N'43ce51cf-8564-484f-b9c8-d77387115018', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">43ce51cf-8564-484f-b9c8-d77387115018</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">e20e8c0d-963d-43e6-9b71-13f84605de8f</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">42d6d391-7298-47f2-8d55-833d04d08428</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:07:52.7387757-06:00</Timestamp><PayIn>20</PayIn><Placing>5</Placing><PlayerName>GW Stein</PlayerName><Winnings>0</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'4c7f8540-ad30-4c3d-bf68-f1983c5aa5c8', CAST(0x0000A2D3010A2D8B AS DateTime), N'96e8085c-a974-417f-935c-ff04c260e5fa', N'0bccc477-8fe7-4aa9-a6d1-1941ca898b32', N'PokerLeagueManager.Common.Events.GameCreatedEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<GameCreatedEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0bccc477-8fe7-4aa9-a6d1-1941ca898b32</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">96e8085c-a974-417f-935c-ff04c260e5fa</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">4c7f8540-ad30-4c3d-bf68-f1983c5aa5c8</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:07.4519131-06:00</Timestamp><GameDate>2014-02-06T00:00:00</GameDate></GameCreatedEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'0835237e-b104-4e9c-8c84-e00233461870', CAST(0x0000A2D3010A2D8B AS DateTime), N'96e8085c-a974-417f-935c-ff04c260e5fa', N'0bccc477-8fe7-4aa9-a6d1-1941ca898b32', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0bccc477-8fe7-4aa9-a6d1-1941ca898b32</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">96e8085c-a974-417f-935c-ff04c260e5fa</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0835237e-b104-4e9c-8c84-e00233461870</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:07.4519131-06:00</Timestamp><PayIn>100</PayIn><Placing>1</Placing><PlayerName>GW Stein</PlayerName><Winnings>240</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'cf30bd20-72bf-4549-a230-c15578351729', CAST(0x0000A2D3010A2D8B AS DateTime), N'96e8085c-a974-417f-935c-ff04c260e5fa', N'0bccc477-8fe7-4aa9-a6d1-1941ca898b32', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0bccc477-8fe7-4aa9-a6d1-1941ca898b32</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">96e8085c-a974-417f-935c-ff04c260e5fa</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">cf30bd20-72bf-4549-a230-c15578351729</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:07.4549129-06:00</Timestamp><PayIn>100</PayIn><Placing>2</Placing><PlayerName>Dylan Smith</PlayerName><Winnings>50</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'67238d7e-7a04-4a77-9073-3943432334fe', CAST(0x0000A2D3010A2D8B AS DateTime), N'96e8085c-a974-417f-935c-ff04c260e5fa', N'0bccc477-8fe7-4aa9-a6d1-1941ca898b32', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0bccc477-8fe7-4aa9-a6d1-1941ca898b32</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">96e8085c-a974-417f-935c-ff04c260e5fa</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">67238d7e-7a04-4a77-9073-3943432334fe</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:07.4559139-06:00</Timestamp><PayIn>50</PayIn><Placing>3</Placing><PlayerName>Colin Hickson</PlayerName><Winnings>20</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'9d901426-37e6-4e05-8568-6db0eda47702', CAST(0x0000A2D3010A2D8B AS DateTime), N'96e8085c-a974-417f-935c-ff04c260e5fa', N'0bccc477-8fe7-4aa9-a6d1-1941ca898b32', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0bccc477-8fe7-4aa9-a6d1-1941ca898b32</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">96e8085c-a974-417f-935c-ff04c260e5fa</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">9d901426-37e6-4e05-8568-6db0eda47702</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:07.4569029-06:00</Timestamp><PayIn>50</PayIn><Placing>4</Placing><PlayerName>Ryan Fritsch</PlayerName><Winnings>0</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'c47de537-088d-431c-9d19-cf6de8e6183e', CAST(0x0000A2D3010A2D8B AS DateTime), N'96e8085c-a974-417f-935c-ff04c260e5fa', N'0bccc477-8fe7-4aa9-a6d1-1941ca898b32', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0bccc477-8fe7-4aa9-a6d1-1941ca898b32</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">96e8085c-a974-417f-935c-ff04c260e5fa</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">c47de537-088d-431c-9d19-cf6de8e6183e</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:07.4579112-06:00</Timestamp><PayIn>5</PayIn><Placing>5</Placing><PlayerName>Tim Saunders</PlayerName><Winnings>0</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'e0b34c23-6e73-4c94-81e2-9c9e13026002', CAST(0x0000A2D3010A2D8B AS DateTime), N'96e8085c-a974-417f-935c-ff04c260e5fa', N'0bccc477-8fe7-4aa9-a6d1-1941ca898b32', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">0bccc477-8fe7-4aa9-a6d1-1941ca898b32</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">96e8085c-a974-417f-935c-ff04c260e5fa</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">e0b34c23-6e73-4c94-81e2-9c9e13026002</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:07.4579112-06:00</Timestamp><PayIn>5</PayIn><Placing>6</Placing><PlayerName>Shane Wilkins</PlayerName><Winnings>0</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'8fb4b056-c2c7-4613-bb14-efe1b01e552c', CAST(0x0000A2D3010A4B13 AS DateTime), N'9f6aaf25-d622-49a0-9b1e-e196f14cfe11', N'b01fe76b-ec27-44c6-963c-ca0779132cd7', N'PokerLeagueManager.Common.Events.GameCreatedEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<GameCreatedEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">b01fe76b-ec27-44c6-963c-ca0779132cd7</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">9f6aaf25-d622-49a0-9b1e-e196f14cfe11</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">8fb4b056-c2c7-4613-bb14-efe1b01e552c</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:32.6599455-06:00</Timestamp><GameDate>2014-02-13T00:00:00</GameDate></GameCreatedEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'2d51e974-8713-46bc-8d0d-c54bce6a83bb', CAST(0x0000A2D3010A4B16 AS DateTime), N'9f6aaf25-d622-49a0-9b1e-e196f14cfe11', N'b01fe76b-ec27-44c6-963c-ca0779132cd7', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">b01fe76b-ec27-44c6-963c-ca0779132cd7</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">9f6aaf25-d622-49a0-9b1e-e196f14cfe11</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2d51e974-8713-46bc-8d0d-c54bce6a83bb</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:32.660939-06:00</Timestamp><PayIn>60</PayIn><Placing>1</Placing><PlayerName>Dylan Smith</PlayerName><Winnings>130</Winnings></PlayerAddedToGameEvent>', 0)
INSERT [dbo].[Events] ([EventId], [EventDateTime], [CommandId], [AggregateId], [EventType], [EventData], [Published]) VALUES (N'a5c77556-5510-4c58-8b3b-736af990bd2c', CAST(0x0000A2D3010A4B16 AS DateTime), N'9f6aaf25-d622-49a0-9b1e-e196f14cfe11', N'b01fe76b-ec27-44c6-963c-ca0779132cd7', N'PokerLeagueManager.Common.Events.PlayerAddedToGameEvent, PokerLeagueManager.Common.Events, Version=1.0.1402.15005, Culture=neutral, PublicKeyToken=3f7de0d3c7580ba8', N'<PlayerAddedToGameEvent xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AggregateId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">b01fe76b-ec27-44c6-963c-ca0779132cd7</AggregateId><CommandId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">9f6aaf25-d622-49a0-9b1e-e196f14cfe11</CommandId><EventId xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">a5c77556-5510-4c58-8b3b-736af990bd2c</EventId><Timestamp xmlns="http://schemas.datacontract.org/2004/07/PokerLeagueManager.Common.Events.Infrastructure">2014-02-15T16:09:32.6619386-06:00</Timestamp><PayIn>70</PayIn><Placing>2</Placing><PlayerName>GW Stein</PlayerName><Winnings>0</Winnings></PlayerAddedToGameEvent>', 0)
GO
