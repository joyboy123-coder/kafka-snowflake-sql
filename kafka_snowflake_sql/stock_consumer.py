from kafka import KafkaConsumer
import json
import pandas as pd
import snowflake.connector
from snowflake.connector.pandas_tools import write_pandas
from config.kafka_config import KAFKA_CONFIG
from config.snowflake_config import SNOWFLAKE_CONFIG
from utils.logger import setup_logger

# Set up logger
logger = setup_logger("consumer", "logs/consumer.log")

# Snowflake Connection
conn = snowflake.connector.connect(**SNOWFLAKE_CONFIG)
cursor = conn.cursor()
cursor.execute(f"USE DATABASE {SNOWFLAKE_CONFIG['database']}; USE SCHEMA {SNOWFLAKE_CONFIG['schema']};")

# Kafka Consumer
consumer = KafkaConsumer(
    KAFKA_CONFIG["topic"],
    bootstrap_servers=KAFKA_CONFIG["bootstrap_servers"],
    value_deserializer=lambda x: json.loads(x.decode("utf-8"))
)

# Read messages and store in a list
data_list = []

for message in consumer:
    data = message.value
    data_list.append(data)

    if len(data_list) >= 5:  # Insert every 5 records
        df = pd.DataFrame(data_list)
        df.columns = df.columns.str.upper()
        # Use write_pandas to load DataFrame into Snowflake
        success, nchunks, nrows, _ = write_pandas(conn, df, "YOUR_TABLE",auto_create_table = True)

        if success:
            logger.info(f"✅ Inserted {nrows} records into Snowflake")
        else:
            logger.error("❌ Failed to insert data")

        data_list = []  # Reset list

cursor.close()
conn.close()
