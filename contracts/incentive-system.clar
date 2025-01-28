;; Incentive System Contract

(define-fungible-token clean-air-token)

(define-map initiatives
  { initiative-id: uint }
  {
    creator: principal,
    description: (string-utf8 500),
    status: (string-ascii 20),
    tokens-allocated: uint
  }
)

(define-data-var initiative-count uint u0)

(define-public (create-initiative (description (string-utf8 500)) (tokens uint))
  (let
    ((new-initiative-id (+ (var-get initiative-count) u1)))
    (try! (ft-mint? clean-air-token tokens tx-sender))
    (map-set initiatives
      { initiative-id: new-initiative-id }
      {
        creator: tx-sender,
        description: description,
        status: "active",
        tokens-allocated: tokens
      }
    )
    (var-set initiative-count new-initiative-id)
    (ok new-initiative-id)
  )
)

(define-public (reward-participant (initiative-id uint) (participant principal) (amount uint))
  (let
    ((initiative (unwrap! (map-get? initiatives { initiative-id: initiative-id }) (err u404))))
    (asserts! (is-eq tx-sender (get creator initiative)) (err u403))
    (asserts! (<= amount (get tokens-allocated initiative)) (err u401))
    (try! (ft-transfer? clean-air-token amount tx-sender participant))
    (map-set initiatives
      { initiative-id: initiative-id }
      (merge initiative { tokens-allocated: (- (get tokens-allocated initiative) amount) })
    )
    (ok true)
  )
)

(define-read-only (get-initiative (initiative-id uint))
  (map-get? initiatives { initiative-id: initiative-id })
)

(define-read-only (get-token-balance (account principal))
  (ft-get-balance clean-air-token account)
)

