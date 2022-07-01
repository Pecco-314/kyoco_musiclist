export class Util {
  static error (obj, data) {
    obj.$message({
      message: data.message,
      type: 'error'
    })
  }
}
