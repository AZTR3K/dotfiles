-- Vim remaps

-- Set leader key
vim.g.mapleader = " "

-- Better pane navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Yank
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Open explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move selected lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- View message history
vim.keymap.set({ "n", "v" }, "<C-_>", ":message<CR>")

-- Improve navigation behaviours
-- Join lines
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Go to next and previous search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- This is my personal setup for debugging and running assembly asm format files
-- using: hyprland wm and xdotool for echoing keyboard keys
-- compiles locally and then runs .com files on dosbox

vim.keymap.set("n", "<leader>d", function()
    if vim.bo.filetype == "asm" then
        local asm_file = vim.fn.expand("%:p")
        local asm_dir = vim.fn.expand("%:p:h")
        local output_file = vim.fn.expand("%:t:r")

        --nasm file -o output
        vim.fn.system("nasm " .. asm_file .. " -o " .. output_file .. ".com")

        if vim.v.shell_error ~= 0 then
            -- Run the NASM command and capture the output, including errors
            local result = vim.fn.systemlist("nasm " .. asm_file .. " -o " .. output_file .. ".com 2>&1")
            for _, line in ipairs(result) do
                print(line) -- Print each line of the error message
            end
            print("Compilation Failed")
            return
        end

        print("Compilation Successful")
        local dosbox_command = table.concat({
            "dosbox",
            "-c \"mount c: " .. asm_dir .. "\"",
            "-c \"c:\"",
            "-c \"afd " .. output_file .. ".com \"",
            "-c \"exit \""
        }, " ")

        local job_id = vim.fn.jobstart(
            "xdotool key alt+4 && xdotool key alt+Return && " .. dosbox_command .. " -fullscreen", {
                on_exit = function()
                    vim.fn.system("xdotool key ctrl+d && xdotool key alt+3")
                end
            })

        if job_id <= 0 then
            print("Failed to start DOSBox!")
        end
    else
        print("This command works only for .asm files!")
    end
end, { desc = "Compile, mount in DOSBox, and run AFD for .asm files" })


vim.keymap.set("n", "<leader>r", function()
    local filetype = vim.bo.filetype


    if filetype == "c" then
        -- Compile and run C program
        local filepath = vim.fn.expand("%:r")
        local filename = vim.fn.expand("%:t:r")
        vim.fn.system("gcc " .. filepath .. ".c -o " .. filename)
        vim.cmd("!./" .. filename)
    elseif filetype == "asm" then
        -- Compile and run Assembly program (DOS)
        local asm_file = vim.fn.expand("%:p")
        local asm_dir = vim.fn.expand("%:p:h")
        local output_file = vim.fn.expand("%:t:r")

        -- Compile NASM file
        local compile_cmd = "nasm " .. asm_file .. " -o " .. output_file .. ".com"
        local compile_result = vim.fn.systemlist(compile_cmd)

        if vim.v.shell_error ~= 0 then
            print("Compilation Failed")
            for _, line in ipairs(compile_result) do
                print(line) -- Print each error message
            end
            return
        end
        print("Compilation Successful")

        -- DOSBox execution command
        local dosbox_command = table.concat({
            "dosbox",
            "-c \"mount c: " .. asm_dir .. "\"",
            "-c \"c:\"",
            "-c \"" .. output_file .. ".com\"",
        }, " ")

        -- Open DOSBox in fullscreen using xdotool
        local job_id = vim.fn.jobstart(
            "xdotool key alt+4 && xdotool key alt+Return && " .. dosbox_command .. " -fullscreen", {
                on_exit = function()
                    vim.fn.system("xdotool key ctrl+d && xdotool key alt+3")
                end
            })

        if job_id <= 0 then
            print("Failed to start DOSBox!")
        end
    else
        print("This command works only for .c and .asm files!")
    end
end, { desc = "Compile and run C/ASM files" })
