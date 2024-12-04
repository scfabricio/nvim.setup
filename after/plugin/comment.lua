require('Comment').setup({
    toggler = {
        line = 'gcc', -- Comentar linha
        block = 'gbc', -- Comentar bloco
    },
    opleader = {
        line = 'gc', -- Operador para comentar linha
        block = 'gb', -- Operador para comentar bloco
    },
    mappings = {
        basic = true, -- Ativa mapeamentos básicos como `gcc` e `gbc`
        extra = true, -- Ativa mapeamentos extras como `gco`, `gcO`, etc.
    },
})

