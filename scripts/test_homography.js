function getHomography(srcW, srcH, p) {
    const x0 = p[0][0], y0 = p[0][1];
    const x1 = p[1][0], y1 = p[1][1];
    const x2 = p[2][0], y2 = p[2][1];
    const x3 = p[3][0], y3 = p[3][1];

    const dx1 = x1 - x2;
    const dx2 = x3 - x2;
    const sx  = x0 - x1 + x2 - x3;
    const dy1 = y1 - y2;
    const dy2 = y3 - y2;
    const sy  = y0 - y1 + y2 - y3;

    let g, h;
    const det = dx1 * dy2 - dy1 * dx2;
    g = (sx * dy2 - sy * dx2) / det;
    h = (dx1 * sy - dy1 * sx) / det;

    const a = x1 - x0 + g * x1;
    const b = x3 - x0 + h * x3;
    const c = x0;
    const d = y1 - y0 + g * y1;
    const e = y3 - y0 + h * y3;
    const f = y0;

    // Scale for input width & height
    const h00 = a / srcW, h01 = b / srcH, h02 = c;
    const h10 = d / srcW, h11 = e / srcH, h12 = f;
    const h20 = g / srcW, h21 = h / srcH, h22 = 1;

    return {
        matrix: [
            h00, h10, 0, h20,
            h01, h11, 0, h21,
            0,   0,   1, 0,
            h02, h12, 0, 1
        ],
        project(u, v) {
            const xp = h00 * u + h01 * v + h02;
            const yp = h10 * u + h11 * v + h12;
            const wp = h20 * u + h21 * v + h22;
            return [xp / wp, yp / wp];
        }
    };
}

const W = 1024, H = 600;
const pts = [[252, 175], [761, 181], [800, 488], [277, 497]];
const res = getHomography(W, H, pts);

console.log("P0 test:", res.project(0, 0), "Expected:", pts[0]);
console.log("P1 test:", res.project(W, 0), "Expected:", pts[1]);
console.log("P2 test:", res.project(W, H), "Expected:", pts[2]);
console.log("P3 test:", res.project(0, H), "Expected:", pts[3]);
console.log("CSS matrix3d:", res.matrix.join(', '));
