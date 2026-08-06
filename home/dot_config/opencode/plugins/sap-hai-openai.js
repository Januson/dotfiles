// Fix: Unsupported parameter: 'max_tokens' is not supported with this model. Use 'max_completion_tokens' instead.
export const HaiOpenAiFix = async () => {
    return {
        "chat.params": async (input, output) => {
            const providerID = input.model?.providerID
            if (providerID !== "openai" && providerID !== "hai-openai") {
                return
            }

            if ("max_tokens" in output) {
                output.max_completion_tokens = output.max_tokens
                delete output.max_tokens
            }
            output.maxOutputTokens = undefined
        },
    }
}
