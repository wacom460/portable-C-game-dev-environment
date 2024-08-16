#define RAYLIB_NUKLEAR_IMPLEMENTATION
#include <raylib-nuklear.h>

struct nk_context* ctx;

int main(int argc, char** argv) {
	ctx = InitNuklear(16);
	InitWindow(640, 480, "program");
	SetWindowState(FLAG_WINDOW_RESIZABLE);
	SetTargetFPS(60);
	SetExitKey(0);//Disable esc to close
	while (!WindowShouldClose()) {
		UpdateNuklear(ctx);
		
//nuklear code
		if (nk_begin(ctx, "test win", nk_rect(5, 5, 400, 300),
			NK_WINDOW_BORDER | NK_WINDOW_MOVABLE | NK_WINDOW_CLOSABLE | NK_WINDOW_SCALABLE)) {
			nk_layout_row_static(ctx, 50, 200, 1);
			if (nk_button_label(ctx, "button1")) {
				//do action
			}
		}
		nk_end(ctx);
		
//raylib drawing
		BeginDrawing();
		ClearBackground((Color) { 35, 20, 130, 80 });
		DrawNuklear(ctx);
		EndDrawing();
	}
	return 0;
}