from kafka import KafkaProducer
import json
import time
import random
from config.kafka_config import KAFKA_CONFIG
from utils.logger import setup_logger

# Set up logger
logger = setup_logger("producer", "logs/producer.log")

# Kafka Producer
producer = KafkaProducer(
    bootstrap_servers=KAFKA_CONFIG["bootstrap_servers"],
    value_serializer=lambda v: json.dumps(v).encode("utf-8")
)

stocks = ["AAPL", "GOOGL", "MSFT", "AMZN", "TSLA"]

while True:
    stock_data = {
        "symbol": random.choice(stocks),
        "price": round(random.uniform(100, 2000), 2),
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S")
    }
    
    producer.send(KAFKA_CONFIG["topic"], stock_data)
    logger.info(f"📤 Sent: {stock_data}")

    time.sleep(2)  # Simulating real-time data
