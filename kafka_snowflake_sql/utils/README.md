# 🚀 Logger Setup  

## 📌 Overview  
This module sets up a logging system that captures and stores log messages in both a file and the console. It ensures that logs are structured and easily accessible for debugging and monitoring.  

## 🔥 Features  

- **📁 Ensures Logs Directory Exists**  
  ✅ Automatically creates a `logs/` directory if it doesn't exist to store log files.  

- **📜 Standardized Log Format**  
  ✅ Defines a consistent log format: `[Timestamp] - [Log Level] - [Message]`.  

- **📡 Dual Logging (File + Console)**  
  - 📂 Logs are written to a specified file.  
  - 🖥️ Logs are also printed to the console for real-time monitoring.  

- **⚙️ Customizable Logger**  
  - 🎯 Accepts a `name` parameter to create multiple loggers.  
  - 📝 Allows specifying different log files for separate components.  

## 🔍 How It Works  

1. **🛠️ Creates a Logger**  
   - A logger instance is initialized with a specific name and log file.  

2. **📄 Adds a File Handler**  
   - ✍️ Writes log messages to the specified file.  
   - 🏷️ Uses a predefined log format.  

3. **🖥️ Adds a Console Handler**  
   - 📢 Prints log messages to the console in the same format.  

4. **✅ Returns the Configured Logger**  
   - The logger can now be used throughout the project for consistent logging.  

## 🎯 Benefits  

✅ **Easy debugging** with real-time console output.  
✅ **Persistent logs** for tracking past events.  
✅ **Consistent formatting** across all logs.  
✅ **Reusable setup** for multiple components in a project.  

🚀 Use this logger setup to keep your logs structured, accessible, and organized!

