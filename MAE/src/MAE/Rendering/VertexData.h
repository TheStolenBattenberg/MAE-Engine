#pragma once

#include <MAE/Core/Releasable.h>
#include <MAE/Core/Types.h>

class VertexData: public Releasable {
public:
	virtual void release() = 0;

	virtual void replaceVertexBuffer(class VertexBuffer* old, class VertexBuffer* replacement) = 0;
	virtual void setIndexBuffer(class IndexBuffer* ib) = 0;
};
