from rest_framework import permissions

class IsAdminOrAssigneeOrReadOnly(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        if request.user and request.user.is_staff:
            return True
        # For Task: allow assignees or owners to edit
        if hasattr(obj, 'assignees') and request.user in obj.assignees.all():
            return True
        if hasattr(obj, 'created_by') and obj.created_by == request.user:
            return True
        return False