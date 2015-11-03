/**
 * 
 * NOTE :-> This is probably a rather bad way to go about the Model Objects, it shouldn't be bad for speed but more for expandability.
 *          It might be a good idea to split the ObjectModel class into different ones, if we have more model types.
 *
 * Also note that the MD2 loader is based off an artical by Brian Jorgensen, on Gamedev.net Props to him for helping the world learn!
 *
 */

#include "MD2Type.h" //Features: Morph Target Animation.
#include "MSMType.h" ////Features: Internal Shader, Super small file size.

//#include "MS3DType.h" //Features: Bone Based Animation. !NOTE - Currently a little broken.

struct MD2_POSITION_VERTEX
{
	union
	{
		struct
		{
			float x, y, z;
		};
		float a[3];
	};
};

struct MD2_TEXTURE_VERTEX
{
	union
	{
		struct
		{
			float s, t;
		};
		float a[2];
	};
};

class MD2Model : public Object {
	public:
		bool MD2Load(const char* mdl_name, const char* txr_name);

		IDirect3DVertexBuffer9* FetchVB(int frame);
		IDirect3DVertexBuffer9* FetchTB();
		IDirect3DIndexBuffer9* FetchIB();
		IDirect3DTexture9* FetchTexture();

		int FetchVertexCount();
		int FetchTriangleCount();
		int FetchFrameCount();
		char* FetchFrameName(int frame);

		MD2Model();
		~MD2Model();

	protected:
		void FetchHeader(std::ifstream& f_MD2);

		void FetchFrameData(std::ifstream& f_MD2);
		void FetchIndexData(std::ifstream& f_MD2);
		void FetchTextureData(std::ifstream& f_MD2);

		void ValidateHeader(void);

		MD2Type::Header Header;

		IDirect3DTexture9* Texture;

		IDirect3DVertexBuffer9* MD2VB[512];
		IDirect3DVertexBuffer9* MD2TB;
		IDirect3DIndexBuffer9* MD2IB;

		int Frames;
};