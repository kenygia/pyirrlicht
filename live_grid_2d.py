from pyirrlicht import *

class live_grid_2d:
	def __init__(self, *args, **kwargs):
		self.video_driver = args[0]
		self.cursor_control = args[1]
		try:
			self.cellw = args[2]
		except:
			self.cellw = 32
		if 'cellw' in kwargs:
			self.cellw = kwargs.pop('cellw', 32)
		try:
			self.cellh = args[3]
		except:
			self.cellh = 32
		if 'cellh' in kwargs:
			self.cellh = kwargs.pop('cellh', 32)
		try:
			self.color_line = args[4]
		except:
			self.color_line = SColor(255, 0, 255, 0)
		if 'color_line' in kwargs:
			self.color_line = kwargs.pop('color_line', SColor(255, 0, 255, 0))
		try:
			self.color_active_cell = args[4]
		except:
			self.color_active_cell = SColor(128, 150, 150, 255)
		if 'color_active_cell' in kwargs:
			self.color_active_cell = kwargs.pop('color_active_cell', SColor(128, 150, 150, 255))
		try:
			self.color_points = args[5]
		except:
			self.color_points = SColor(255, 255, 255, 255)
		if 'color_points' in kwargs:
			self.color_points = kwargs.pop('color_points', SColor(255, 255, 255, 255))
		try:
			self.width_line = args[6]
		except:
			self.width_line = 3
		if 'width_line' in kwargs:
			self.width_line = kwargs.pop('width_line', 3)
		try:
			self.size_clip = args[7]
		except:
			self.size_clip = 0
		if 'size_clip' in kwargs:
			self.size_clip = kwargs.pop('size_clip', 0)
		try:
			self.size_point = args[8]
		except:
			self.size_point = 3.0
		if 'size_point' in kwargs:
			self.size_point = kwargs.pop('size_point', 3.0)
		try:
			self.is_draw_lines = args[9]
		except:
			self.is_draw_lines = True
		if 'is_draw_lines' in kwargs:
			self.is_draw_lines = kwargs.pop('is_draw_lines', True)
		try:
			self.is_draw_points = args[10]
		except:
			self.is_draw_points = True
		if 'is_draw_points' in kwargs:
			self.is_draw_points = kwargs.pop('is_draw_points', True)
		self.screen_size = dimension2du(self.video_driver.getScreenSize())
		self.create_cells()
		self.create_lines()

	def create_cells(self):
		self.cells = []
		w = self.screen_size.X / self.cellw + 2
		h = self.screen_size.Y / self.cellh + 2
		x1, x2, y1, y2 = 0, 0, 0, 0
		for x in range(w):
			x2 = x * self.cellw
			for y in range(h):
				y2 = y * self.cellh
				self.cells.append(recti(x1, y1, x2, y2))
				y1 = y2
			x1 = x2

	def create_lines(self):
		self.lines = []
		w = self.screen_size.X / self.cellw + 1
		h = self.screen_size.Y / self.cellh + 1
		x1 = 0
		for x in range(1, w):
			x1 = x * self.cellw
			self.lines.append((vector2di(x1, 0), vector2di(x1, self.screen_size.Y)))
		y1 = 0
		for y in range(1, h):
			y1 = y * self.cellh
			self.lines.append((vector2di(0, y1), vector2di(self.screen_size.X, y1)))

	def get_current_point(self):
		if self.cursor_control:
			return self.cursor_control.getPosition()
		else:
			return position2di()

	def get_current_cell(self):
		for rect in self.cells:
			if rect.isPointInside(self.get_current_point()):
				return rect
		return recti()

	def draw_current_cell(self):
		if self.size_clip:
			rect = self.get_current_cell()
			ulc = rect.UpperLeftCorner
			lrc = rect.LowerRightCorner
			clip = recti(ulc.X + self.size_clip, ulc.Y + self.size_clip, lrc.X - self.size_clip, lrc.Y - self.size_clip)
			self.video_driver.draw2DRectangle(self.color_active_cell, rect, clip)
		else:
			self.video_driver.draw2DRectangle(self.color_active_cell, self.get_current_cell())

	def draw_lines(self):
		if self.width_line:
			for point1, point2 in self.lines:
				self.video_driver.draw2DLineW(point1, point2, self.color_line, self.width_line)
		else:
			for point1, point2 in self.lines:
				self.video_driver.draw2DLine(point1, point2, self.color_line)

	def draw_points(self):
		if self.size_point:
			for rect in self.cells:
				self.video_driver.draw2DPolygon(rect.UpperLeftCorner, self.size_point, self.color_points)
		else:
			for rect in self.cells:
				self.video_driver.drawPixel(rect.UpperLeftCorner.X, rect.UpperLeftCorner.Y, self.color_points)

	def draw(self):
		if self.screen_size != self.video_driver.getScreenSize():
			self.screen_size = None
			self.screen_size = dimension2du(self.video_driver.getScreenSize())
			self.create_cells()
			self.create_lines()
		self.draw_current_cell()
		if self.is_draw_lines:
			self.draw_lines()
		if self.is_draw_points:
			self.draw_points()

def test():
	device = createDevice(EDT_BURNINGSVIDEO, dimension2du(320, 240))
	if device:
		device.setResizable(True)
		device.setWindowCaption('Irrlicht Engine - test 2d "live grid"')
		video_driver = device.getVideoDriver()
		cursor_control = device.getCursorControl()
		color_background = SColor(255, 100, 100, 150)
		grid = live_grid_2d(video_driver, cursor_control, width_line = 3, size_point = 4.0)#, is_draw_lines = False)
		screen_size = video_driver.getScreenSize()
		while device.run():
			if device.isWindowActive():
				if video_driver.beginScene(True, True, color_background):
					grid.draw()
					video_driver.endScene()
				device.sleep(50)
			else:
				device._yield()
	else:
		print ('ERROR createDevice')

if __name__ == "__main__":
	test()
