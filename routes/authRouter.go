package routes

import (
	"github.com/gin-gonic/gin"
	controller "github.com/iamtejasmane/go-jwt-gin-gonic/controllers"
)

func AuthRoutes(incomingRoutes *gin.Engine) {
	incomingRoutes.POST("users/signup", controller.Signup())
	incomingRoutes.POST("users/login", controller.Login())
}
