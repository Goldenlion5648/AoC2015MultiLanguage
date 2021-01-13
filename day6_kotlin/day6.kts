//@SuppressWarnings
import java.util.Scanner
import java.io.File
import java.io.InputStream

fun solve(lineList: MutableList<String>, isPart1Rule: Boolean):
        Array<IntArray> {
    var board = Array(1000) { IntArray(1000) }
    //loop through each instruction and turn on, off, or toggle the
    //lights in that range
    lineList.forEach {
        //        println(it)
        var cur = it.split(" ")
        if (cur[0].equals("turn")) {
            var r1 = cur[2].split(",").map { it.toInt() }
            var r2 = cur.last().split(",").map { it.toInt() }
            var newVal = 0
            if (cur[1].equals("on")) {
                newVal = 1
            }
            for (i in r1[0]..r2[0]) {
                for (j in r1[1]..r2[1]) {
                    if (isPart1Rule) {
                        board[i][j] = newVal

                    } else {
                        if (newVal == 0)
                            board[i][j] = Math.max(0, board[i][j] - 1)
                        else
                            board[i][j] += 1

                    }
                }
            }
        } else {
//            must be a toggle
            var r1 = cur[1].split(",").map { it.toInt() }
            var r2 = cur.last().split(",").map { it.toInt() }
            for (i in r1[0]..r2[0]) {
                for (j in r1[1]..r2[1]) {
                    if (isPart1Rule) {
                        board[i][j] = (board[i][j] + 1) % 2
                    } else {
                        board[i][j] = (board[i][j] + 2)

                    }
                }
            }
        }
    }
    return board

}

fun calcBrightness(board: Array<IntArray>): Int {
    var answer = 0
    board.forEach { answer += it.sum() }
    return answer
}

fun main() {

    val lineList = mutableListOf<String>()

    File("input6.txt").useLines { lines -> lines.forEach { lineList.add(it) } }
    println("part 1 " + calcBrightness(solve(lineList, true)))
    println("part 2 " + calcBrightness(solve(lineList, false)))

}
main()