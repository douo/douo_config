import com.intellij.openapi.actionSystem.AnActionEvent

import static liveplugin.PluginUtil.*

/**
 * 将当前单词或下一个单词转换为首字母大写
 * document 源码见：https://upsource.jetbrains.com/idea-ce/file/idea-ce-1731d054af4ca27aa827c03929e27eeb0e6a8366/platform/core-api/src/com/intellij/openapi/editor/Document.java
 */
registerAction("Capitalize Word", "alt  C") { AnActionEvent event ->
    runDocumentWriteAction(event.project) {
        currentEditorIn(event.project).with {
            int offset = caretModel.offset
            char[] text = document.getChars();
            if (offset < text.length) {
                int startOffset = offset;
                int endOffset = offset;
                if (Character.isLetter(text[offset])) {
                    while (startOffset > 0 && Character.isLetter(text[startOffset - 1])) {
                        startOffset--;
                    }
                    while(Character.isLetter(text[++endOffset ]) && endOffset < text.length);
                } else {
                    while(!Character.isLetter(text[++startOffset ]) && startOffset < text.length - 1);
                    endOffset = startOffset;
                    while (endOffset < text.length - 1 && Character.isLetter(text[++endOffset]));
                }
                if(endOffset>startOffset) {
                    String word = Character.toUpperCase(text[startOffset]).toString();
                    for (int i = startOffset + 1; i < endOffset; i++) {
                        word += Character.toLowerCase(text[i]);
                    }
                    caretModel.moveToOffset(endOffset)
                    document.replaceString(startOffset, endOffset, word)
                }
            }
        }
    }
}