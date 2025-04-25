-- Create user
insert into auth.users (instance_id, id, aud, role, email, encrypted_password, raw_app_meta_data, raw_user_meta_data, email_confirmed_at, created_at)
  values ('00000000-0000-0000-0000-000000000000', '73c4e9d8-8c60-4754-a177-b5f084f4dde3', 'authenticated', 'authenticated', 'anass.zairig@gmail.com', '$2a$10$ctC4G6LDAVV3tgjN/oCg2ej4sfJcXlTc0cGhqLZ370Z10hCGpCs3u', '{"provider":"email","providers":["email"]}', '{}', timezone('utc'::text, now()), timezone('utc'::text, now()));

insert into auth.identities (id, user_id, identity_data, provider, provider_id, created_at)
  values ('73c4e9d8-8c60-4754-a177-b5f084f4dde3', '73c4e9d8-8c60-4754-a177-b5f084f4dde3', '{"sub": "73c4e9d8-8c60-4754-a177-b5f084f4dde3", "email": "anass.zairig@gmail.com"}', 'email', 'anass.zairig@gmail.com', timezone('utc'::text, now()));

-- Add task seed data
INSERT INTO tasks (title, description, status, priority, due_date, user_id) 
VALUES 
('Complete project proposal', 'Draft the initial proposal for the new client project', 'To Do', 'high', NOW() + INTERVAL '3 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Weekly grocery shopping', 'Get fruits, vegetables, and other essentials', 'To Do', 'medium', NOW() + INTERVAL '1 day', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Research vacation destinations', 'Look for affordable options for summer vacation', 'In Progress', 'low', NOW() + INTERVAL '7 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Gym workout', 'Complete 30 minutes cardio and strength training', 'In Progress', 'medium', NOW(), '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Pay utility bills', 'Electricity, water, and internet bills due this week', 'To Do', 'high', NOW() + INTERVAL '2 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Read new book', 'Start reading "Atomic Habits"', 'Not Started', 'low', NOW() + INTERVAL '14 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Doctor appointment', 'Annual checkup at City Hospital', 'To Do', 'high', NOW() + INTERVAL '5 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Update portfolio website', 'Add recent projects and update skills section', 'Done', 'medium', NOW() + INTERVAL '12 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Clean garage', 'Organize tools and donate unused items', 'Not Started', 'low', NOW() + INTERVAL '21 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3'),
('Submit tax documents', 'Deadline approaching for annual filing', 'To Do', 'high', NOW() + INTERVAL '10 days', '73c4e9d8-8c60-4754-a177-b5f084f4dde3');