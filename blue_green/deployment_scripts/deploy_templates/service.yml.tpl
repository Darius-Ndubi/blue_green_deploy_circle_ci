apiVersion: v1
kind: Service
metadata:
  name: activo-web-blue-green-service-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
  labels:
    app: activo-web-${CURRENT_VERSION}-${DEPLOYMENT_ENVIRONMENT}
spec:
  selector:
    app: activo-web-${CURRENT_VERSION}-${DEPLOYMENT_ENVIRONMENT}
  type: NodePort
  ports:
   - protocol: TCP
     port: 80
     targetPort: 3000
