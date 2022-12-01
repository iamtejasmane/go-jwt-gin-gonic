package routes

import (
	"github.com/gin-gonic/gin"
	controller "github.com/iamtejasmane/go-jwt-gin-gonic/controllers"
	"github.com/iamtejasmane/go-jwt-gin-gonic/middleware"
)

func UserRoutes(incomingRoutes *gin.Engine) {
	incomingRoutes.Use(middleware.Authenticate())
	incomingRoutes.GET("/users", controller.GetUsers())
	incomingRoutes.GET("/users/:user_id", controller.GetUser())
}
