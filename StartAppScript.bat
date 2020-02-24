@echo on

echo | gradlew.bat :clean

echo | gradlew.bat :build

java -jar ./build/libs/PenaltyExtractor.jar