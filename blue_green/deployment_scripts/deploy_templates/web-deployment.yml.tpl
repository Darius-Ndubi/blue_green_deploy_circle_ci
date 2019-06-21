apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: activo-web-${CURRENT_VERSION}-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
spec:
  replicas: 2
  template:
    metadata:
      labels:
        app: activo-web-${CURRENT_VERSION}-${DEPLOYMENT_ENVIRONMENT}
        color: ${CURRENT_VERSION}
    spec:
      containers:
      - name: activo-web-${CURRENT_VERSION}-${DEPLOYMENT_ENVIRONMENT}
        image: gcr.io/fastfoodfast-221906/activo-web-staging-${CURRENT_VERSION}
        imagePullPolicy: Always
        ports:
        - containerPort: 3000