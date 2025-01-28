;; Air Quality Reports Contract

(define-map air-quality-reports
  { report-id: uint }
  {
    timestamp: uint,
    area: (string-ascii 50),
    aqi: uint,
    status: (string-ascii 20),
    recommendations: (string-utf8 500)
  }
)

(define-data-var report-count uint u0)

(define-public (generate-report
  (area (string-ascii 50))
  (aqi uint)
  (status (string-ascii 20))
  (recommendations (string-utf8 500))
)
  (let
    ((new-report-id (+ (var-get report-count) u1)))
    (map-set air-quality-reports
      { report-id: new-report-id }
      {
        timestamp: block-height,
        area: area,
        aqi: aqi,
        status: status,
        recommendations: recommendations
      }
    )
    (var-set report-count new-report-id)
    (ok new-report-id)
  )
)

(define-read-only (get-report (report-id uint))
  (map-get? air-quality-reports { report-id: report-id })
)

(define-read-only (get-latest-report)
  (map-get? air-quality-reports { report-id: (var-get report-count) })
)

(define-read-only (get-report-count)
  (var-get report-count)
)

