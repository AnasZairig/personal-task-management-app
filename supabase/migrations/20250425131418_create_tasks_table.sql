-- Create enum for task priority
CREATE TYPE task_priority AS ENUM ('low', 'medium', 'high');

-- Create tasks table
CREATE TABLE IF NOT EXISTS tasks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  description TEXT,
  status TEXT NOT NULL,
  priority task_priority NOT NULL DEFAULT 'medium',
  due_date TIMESTAMP WITH TIME ZONE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);

-- Create index on user_id for faster queries
CREATE INDEX IF NOT EXISTS idx_tasks_user_id ON tasks(user_id);

-- Create index on status for faster filtering
CREATE INDEX IF NOT EXISTS idx_tasks_status ON tasks(status);

-- Create index on due_date for faster sorting and filtering
CREATE INDEX IF NOT EXISTS idx_tasks_due_date ON tasks(due_date);

-- Enable Row Level Security
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;

-- Create policy for users to see only their own tasks
CREATE POLICY "Users can only access their own tasks" 
ON tasks FOR ALL 
USING (auth.uid() = user_id);

-- Create function to update timestamps
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to automatically update timestamps
CREATE TRIGGER update_tasks_updated_at
BEFORE UPDATE ON tasks
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();