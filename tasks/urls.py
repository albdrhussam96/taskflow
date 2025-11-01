from rest_framework.routers import DefaultRouter
from .views import TeamViewSet, TaskViewSet
router = DefaultRouter()
router.register(r'teams', TeamViewSet)
router.register(r'tasks', TaskViewSet)

urlpatterns = router.urls