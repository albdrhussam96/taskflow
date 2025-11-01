from rest_framework import viewsets, filters, status
from rest_framework.decorators import action
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from .models import Team, Project, Task, Comment, Attachment
from .serializers import TeamSerializer, ProjectSerializer, TaskSerializer, CommentSerializer, AttachmentSerializer
from .permissions import IsAdminOrAssigneeOrReadOnly

class TeamViewSet(viewsets.ModelViewSet):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer
    permission_classes = [IsAdminOrAssigneeOrReadOnly]
    filter_backends = [filters.SearchFilter]
    search_fields = ['name', 'description']

class TaskViewSet(viewsets.ModelViewSet):
    queryset = Task.objects.select_related('project', 'created_by').prefetch_related('assignees')
    serializer_class = TaskSerializer
    permission_classes = [IsAdminOrAssigneeOrReadOnly]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    filterset_fields = ['status', 'project', 'priority', 'assignees']
    search_fields = ['title', 'description']
    ordering_fields = ['priority', 'due_date', 'created_at']

    @action(detail=True, methods=['post'])
    def change_status(self, request, pk=None):
        task = self.get_object()
        status_value = request.data.get('status')
        if status_value not in dict(task._meta.get_field('status').choices):
            return Response({'detail': 'Invalid status'}, status=status.HTTP_400_BAD_REQUEST)
        task.status = status_value
        task.save()
        return Response(self.get_serializer(task).data)
