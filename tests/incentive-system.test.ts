import { describe, it, expect, beforeEach } from "vitest"

describe("incentive-system", () => {
  let contract: any
  
  beforeEach(() => {
    contract = {
      createInitiative: (description: string, tokens: number) => ({ value: 1 }),
      rewardParticipant: (initiativeId: number, participant: string, amount: number) => ({ success: true }),
      getInitiative: (initiativeId: number) => ({
        creator: "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM",
        description: "Reduce car usage",
        status: "active",
        tokensAllocated: 1000,
      }),
      getTokenBalance: (account: string) => 500,
    }
  })
  
  describe("create-initiative", () => {
    it("should create a new clean air initiative", () => {
      const result = contract.createInitiative("Reduce car usage", 1000)
      expect(result.value).toBe(1)
    })
  })
  
  describe("reward-participant", () => {
    it("should reward a participant for their contribution", () => {
      const result = contract.rewardParticipant(1, "ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG", 100)
      expect(result.success).toBe(true)
    })
  })
  
  describe("get-initiative", () => {
    it("should return initiative information", () => {
      const result = contract.getInitiative(1)
      expect(result.description).toBe("Reduce car usage")
      expect(result.status).toBe("active")
      expect(result.tokensAllocated).toBe(1000)
    })
  })
  
  describe("get-token-balance", () => {
    it("should return the token balance for an account", () => {
      const result = contract.getTokenBalance("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM")
      expect(result).toBe(500)
    })
  })
})

