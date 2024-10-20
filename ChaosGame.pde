// Picks a random point to start, then picks a random anchor point and moves
// halfway to it. When this is repeated, the points will surprisingly form a
// fractal pattern, more specifically a Sierpiński triangle.

ArrayList<PVector> anchors = new ArrayList<PVector>();
ArrayList<PVector> points = new ArrayList<PVector>();
PVector currentPoint;

void setup() {
    size(800, 800);

    anchors.add(new PVector(400, 100));
    anchors.add(new PVector(100, 700));
    anchors.add(new PVector(700, 700));

    PVector point = new PVector(random(width), random(height));
    currentPoint = point;
}

void update() {
    points.add(currentPoint);
    PVector to = anchors.get((int)random(anchors.size()));
    PVector newPoint = currentPoint.copy().add(to).div(2);
    currentPoint = newPoint;
}

void draw() {
    update();
    background(0);

    stroke(0, 255, 0);
    strokeWeight(8);
    for (PVector a : anchors) {
        point(a.x, a.y);
    }

    stroke(255);
    strokeWeight(1);
    for (PVector p : points) {
        point(p.x, p.y);
    }

    stroke(255, 0, 255);
    strokeWeight(8);
    point(currentPoint.x, currentPoint.y);
}