apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: travella-staging
  namespace: staging
  labels:
    app: travella-staging
  annotations:
    kubernetes.io/ingress.global-static-ip-name: {{ INGRESS_STATIC_IP_NAME }}
spec:
  tls:
    - secretName: {{ PROJECT_NAME }}-tls-secrets
  rules:
  - host: travela-staging.andela.com
    http:
      paths:
      - path: /*
        backend:
          serviceName: travella-frontend
          servicePort: http
  - host: travela-staging-api.andela.com
    http:
      paths:
      - path: /*
        backend:
          serviceName: travella-backend
          servicePort: http
