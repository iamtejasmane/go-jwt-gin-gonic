package database

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func DBinstance() *mongo.Client {
	// load environmet file
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal(err)
	}
	// get env variable
	MongoDB := os.Getenv("MONGODB_URL")
	// get mongo client instance
	client, err := mongo.NewClient(options.Client().ApplyURI(MongoDB))
	if err != nil {
		log.Fatal(err)
	}
	// get context
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	// call cancel() after the DBinstance
	defer cancel()

	// check if client connects to the context
	err = client.Connect(ctx)
	if err != nil {
		log.Fatal(err)
	}
	// print success
	fmt.Println("Connected to MongoDB")
	// return client
	return client

}

var Client *mongo.Client = DBinstance()

func OpenCollection(client *mongo.Client, collectionName string) *mongo.Collection {
	// get collection instance and return
	var collection *mongo.Collection = (*mongo.Collection)(client.Database("").Collection(collectionName))
	return collection
}
