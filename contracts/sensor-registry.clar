;; Sensor Registry Contract

(define-map sensors
  { sensor-id: uint }
  {
    owner: principal,
    location: (tuple (lat int) (lng int)),
    sensor-type: (string-ascii 20),
    status: (string-ascii 10)
  }
)

(define-data-var sensor-count uint u0)

(define-public (register-sensor (location (tuple (lat int) (lng int))) (sensor-type (string-ascii 20)))
  (let
    ((new-sensor-id (+ (var-get sensor-count) u1)))
    (map-set sensors
      { sensor-id: new-sensor-id }
      {
        owner: tx-sender,
        location: location,
        sensor-type: sensor-type,
        status: "active"
      }
    )
    (var-set sensor-count new-sensor-id)
    (ok new-sensor-id)
  )
)

(define-read-only (get-sensor (sensor-id uint))
  (map-get? sensors { sensor-id: sensor-id })
)

(define-public (update-sensor-status (sensor-id uint) (new-status (string-ascii 10)))
  (let
    ((sensor (unwrap! (map-get? sensors { sensor-id: sensor-id }) (err u404))))
    (asserts! (is-eq tx-sender (get owner sensor)) (err u403))
    (map-set sensors
      { sensor-id: sensor-id }
      (merge sensor { status: new-status })
    )
    (ok true)
  )
)

(define-read-only (get-sensor-count)
  (var-get sensor-count)
)

