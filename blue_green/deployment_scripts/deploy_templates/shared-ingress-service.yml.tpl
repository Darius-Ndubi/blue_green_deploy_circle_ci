apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: activo-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
  annotations:
    kubernetes.io/ingress.class: "nginx"
  labels:
    app: activo-${DEPLOYMENT_ENVIRONMENT}
spec:
  rules:
    - host: www.bluedep.tk
      http:
        paths:
        - backend:
            serviceName: activo-web-blue-green-service-${DEPLOYMENT_ENVIRONMENT}
            servicePort: 80