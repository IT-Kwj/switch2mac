#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _245 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _59 = in.m_39.x;
    float _61 = in.m_39.y;
    float _63 = in.m_39.z;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _67 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _65;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _71 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _69;
    float _73 = _67 * _67;
    int _76 = as_type<int>(_57) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _78 = _76 + as_type<int>(_55);
    int _80 = _78 * 48;
    int _82 = _80 + 16;
    int _84 = _80 + 32;
    int _86 = _80 + 48;
    uint _89 = uint(int(uint(_82) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_89)];
    float _91 = as_type<float>(_dmw0.x);
    int _93 = _82 + 4;
    uint _95 = uint(int(uint(_93) >> uint(2)));
    float _97 = as_type<float>(_dmw0.y);
    int _99 = _82 + 8;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    float _103 = as_type<float>(_dmw0.z);
    int _105 = _82 + 12;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    float _109 = as_type<float>(_dmw0.w);
    uint _111 = uint(int(uint(_84) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_111)];
    float _113 = as_type<float>(_dmw1.x);
    int _115 = _84 + 4;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    float _119 = as_type<float>(_dmw1.y);
    int _121 = _84 + 8;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    float _125 = as_type<float>(_dmw1.z);
    int _127 = _84 + 12;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw1.w);
    uint _133 = uint(int(uint(_86) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_133)];
    float _135 = as_type<float>(_dmw2.x);
    int _137 = _86 + 4;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>(_dmw2.y);
    int _143 = _86 + 8;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    float _147 = as_type<float>(_dmw2.z);
    int _149 = _86 + 12;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>(_dmw2.w);
    float _155 = fma(_71, _71, _73);
    float _157 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _159 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _157;
    float _161 = fma(_159, _159, _155);
    float _163 = in.m_41.x;
    float _165 = sqrt(_161);
    bool _169 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _177 = _173 || _175;
    float _179 = _97 * _61;
    float _181 = _119 * _61;
    float _183 = fma(_91, _59, _179);
    float _185 = _141 * _61;
    float _187 = fma(_113, _59, _181);
    float _189 = fma(_103, _63, _183);
    float _191 = fma(_135, _59, _185);
    float _193 = fma(_125, _63, _187);
    float _195 = _109 + _189;
    float _197 = _135;
    if (!_177)
    {
        _197 = 1.0;
    }
    float _199 = _197;
    float _201 = fma(_147, _63, _191);
    float _203 = _131 + _193;
    float _205 = _195 * _163;
    float _207 = _153 + _201;
    float _209 = _203 * _163;
    float _211 = _207 * _163;
    bool _213 = !_177;
    float _215 = _199;
    if (!_213)
    {
        bool _217 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _219 = isnan(_165);
        bool _221 = _217 || _219;
        bool _223 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _225 = _221 || _223;
        if (!_225)
        {
            float _227 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _229 = _165 + _227;
            float _231 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _233 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _231;
            float _235 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _237 = _235 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _239 = 1.0 / _233;
            float _241 = _229 * _239;
            float _243 = fma(_241, _237, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _215 = _243;
            _245 = true;
        }
        else
        {
            bool _247 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _249 = isnan(_165);
            bool _251 = _247 || _249;
            bool _253 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _255 = _251 || _253;
            if (!_255)
            {
                float _257 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _259 = _165 + _257;
                float _261 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _263 = _261 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _265 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _267 = _265 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _269 = 1.0 / _263;
                float _271 = _259 * _269;
                float _273 = fma(_271, _267, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _215 = _273;
                _245 = true;
            }
            else
            {
                _215 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _245 = false;
    float _275 = _215;
    float _277 = _275 + (-1.0);
    float _279 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _281 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _283 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _285 = fma(_209, _275, _279);
    float _287 = fma(_205, _275, _281);
    float _289 = fma(_211, _275, _283);
    float _291 = _285 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _293 = _285 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[1].x, _291);
    float _297 = _285 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _299 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[0].x, _293);
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].z, _295);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[2].x, _297);
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].z, _299);
    float _307 = _301 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].z, _303);
    float _311 = _305 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _313 = _307 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _315 = _309 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _317 = _307 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _319 = _307 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[1].x, _313);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[0].x, _317);
    float _325 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[2].x, _319);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[1].z, _321);
    float _329 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[0].z, _323);
    float _331 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[2].z, _325);
    float _333 = _327 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _335 = _329 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _337 = _331 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _339 = _333 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _341 = _333 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _343 = _333 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _345 = _333 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _347 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[7].x, _339);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[8].x, _341);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[9].x, _343);
    float _353 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[10].x, _345);
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[7].z, _347);
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[8].z, _349);
    float _359 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[9].z, _351);
    float _361 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[10].z, _353);
    float _363 = _355 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _365 = _357 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _367 = _359 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _369 = _361 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _363;
    out.gl_Position.y = _365;
    out.gl_Position.z = _367;
    out.gl_Position.w = _369;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _245 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _59 = in.m_39.x;
    float _61 = in.m_39.y;
    float _63 = in.m_39.z;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _67 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _65;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _71 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _69;
    float _73 = _67 * _67;
    int _76 = as_type<int>(_57) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _78 = _76 + as_type<int>(_55);
    int _80 = _78 * 48;
    int _82 = _80 + 16;
    int _84 = _80 + 32;
    int _86 = _80 + 48;
    uint _89 = uint(int(uint(_82) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_89)];
    float _91 = as_type<float>(_dmw0.x);
    int _93 = _82 + 4;
    uint _95 = uint(int(uint(_93) >> uint(2)));
    float _97 = as_type<float>(_dmw0.y);
    int _99 = _82 + 8;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    float _103 = as_type<float>(_dmw0.z);
    int _105 = _82 + 12;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    float _109 = as_type<float>(_dmw0.w);
    uint _111 = uint(int(uint(_84) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_111)];
    float _113 = as_type<float>(_dmw1.x);
    int _115 = _84 + 4;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    float _119 = as_type<float>(_dmw1.y);
    int _121 = _84 + 8;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    float _125 = as_type<float>(_dmw1.z);
    int _127 = _84 + 12;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw1.w);
    uint _133 = uint(int(uint(_86) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_133)];
    float _135 = as_type<float>(_dmw2.x);
    int _137 = _86 + 4;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>(_dmw2.y);
    int _143 = _86 + 8;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    float _147 = as_type<float>(_dmw2.z);
    int _149 = _86 + 12;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>(_dmw2.w);
    float _155 = fma(_71, _71, _73);
    float _157 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _159 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _157;
    float _161 = fma(_159, _159, _155);
    float _163 = in.m_41.x;
    float _165 = sqrt(_161);
    bool _169 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _177 = _173 || _175;
    float _179 = _97 * _61;
    float _181 = _119 * _61;
    float _183 = fma(_91, _59, _179);
    float _185 = _141 * _61;
    float _187 = fma(_113, _59, _181);
    float _189 = fma(_103, _63, _183);
    float _191 = fma(_135, _59, _185);
    float _193 = fma(_125, _63, _187);
    float _195 = _109 + _189;
    float _197 = _135;
    if (!_177)
    {
        _197 = 1.0;
    }
    float _199 = _197;
    float _201 = fma(_147, _63, _191);
    float _203 = _131 + _193;
    float _205 = _195 * _163;
    float _207 = _153 + _201;
    float _209 = _203 * _163;
    float _211 = _207 * _163;
    bool _213 = !_177;
    float _215 = _199;
    if (!_213)
    {
        bool _217 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _219 = isnan(_165);
        bool _221 = _217 || _219;
        bool _223 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _225 = _221 || _223;
        if (!_225)
        {
            float _227 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _229 = _165 + _227;
            float _231 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _233 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _231;
            float _235 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _237 = _235 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _239 = 1.0 / _233;
            float _241 = _229 * _239;
            float _243 = fma(_241, _237, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _215 = _243;
            _245 = true;
        }
        else
        {
            bool _247 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _249 = isnan(_165);
            bool _251 = _247 || _249;
            bool _253 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _255 = _251 || _253;
            if (!_255)
            {
                float _257 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _259 = _165 + _257;
                float _261 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _263 = _261 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _265 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _267 = _265 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _269 = 1.0 / _263;
                float _271 = _259 * _269;
                float _273 = fma(_271, _267, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _215 = _273;
                _245 = true;
            }
            else
            {
                _215 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _245 = false;
    float _275 = _215;
    float _277 = _275 + (-1.0);
    float _279 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _281 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _283 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _285 = fma(_209, _275, _279);
    float _287 = fma(_205, _275, _281);
    float _289 = fma(_211, _275, _283);
    float _291 = _285 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _293 = _285 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[1].x, _291);
    float _297 = _285 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _299 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[0].x, _293);
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].z, _295);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[2].x, _297);
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].z, _299);
    float _307 = _301 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].z, _303);
    float _311 = _305 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _313 = _307 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _315 = _309 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _317 = _307 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _319 = _307 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[1].x, _313);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[0].x, _317);
    float _325 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[2].x, _319);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[1].z, _321);
    float _329 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[0].z, _323);
    float _331 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[2].z, _325);
    float _333 = _327 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _335 = _329 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _337 = _331 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _339 = _333 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _341 = _333 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _343 = _333 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _345 = _333 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _347 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[7].x, _339);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[8].x, _341);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[9].x, _343);
    float _353 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[10].x, _345);
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[7].z, _347);
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[8].z, _349);
    float _359 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[9].z, _351);
    float _361 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[10].z, _353);
    float _363 = _355 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _365 = _357 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _367 = _359 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _369 = _361 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _363;
    out.gl_Position.y = _365;
    out.gl_Position.z = _367;
    out.gl_Position.w = _369;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _245 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _59 = in.m_39.x;
    float _61 = in.m_39.y;
    float _63 = in.m_39.z;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _67 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _65;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _71 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _69;
    float _73 = _67 * _67;
    int _76 = as_type<int>(_57) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _78 = _76 + as_type<int>(_55);
    int _80 = _78 * 48;
    int _82 = _80 + 16;
    int _84 = _80 + 32;
    int _86 = _80 + 48;
    uint _89 = uint(int(uint(_82) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_89)];
    float _91 = as_type<float>(_dmw0.x);
    int _93 = _82 + 4;
    uint _95 = uint(int(uint(_93) >> uint(2)));
    float _97 = as_type<float>(_dmw0.y);
    int _99 = _82 + 8;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    float _103 = as_type<float>(_dmw0.z);
    int _105 = _82 + 12;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    float _109 = as_type<float>(_dmw0.w);
    uint _111 = uint(int(uint(_84) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_111)];
    float _113 = as_type<float>(_dmw1.x);
    int _115 = _84 + 4;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    float _119 = as_type<float>(_dmw1.y);
    int _121 = _84 + 8;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    float _125 = as_type<float>(_dmw1.z);
    int _127 = _84 + 12;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw1.w);
    uint _133 = uint(int(uint(_86) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_133)];
    float _135 = as_type<float>(_dmw2.x);
    int _137 = _86 + 4;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>(_dmw2.y);
    int _143 = _86 + 8;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    float _147 = as_type<float>(_dmw2.z);
    int _149 = _86 + 12;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>(_dmw2.w);
    float _155 = fma(_71, _71, _73);
    float _157 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _159 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _157;
    float _161 = fma(_159, _159, _155);
    float _163 = in.m_41.x;
    float _165 = sqrt(_161);
    bool _169 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _177 = _173 || _175;
    float _179 = _97 * _61;
    float _181 = _119 * _61;
    float _183 = fma(_91, _59, _179);
    float _185 = _141 * _61;
    float _187 = fma(_113, _59, _181);
    float _189 = fma(_103, _63, _183);
    float _191 = fma(_135, _59, _185);
    float _193 = fma(_125, _63, _187);
    float _195 = _109 + _189;
    float _197 = _135;
    if (!_177)
    {
        _197 = 1.0;
    }
    float _199 = _197;
    float _201 = fma(_147, _63, _191);
    float _203 = _131 + _193;
    float _205 = _195 * _163;
    float _207 = _153 + _201;
    float _209 = _203 * _163;
    float _211 = _207 * _163;
    bool _213 = !_177;
    float _215 = _199;
    if (!_213)
    {
        bool _217 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _219 = isnan(_165);
        bool _221 = _217 || _219;
        bool _223 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _225 = _221 || _223;
        if (!_225)
        {
            float _227 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _229 = _165 + _227;
            float _231 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _233 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _231;
            float _235 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _237 = _235 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _239 = 1.0 / _233;
            float _241 = _229 * _239;
            float _243 = fma(_241, _237, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _215 = _243;
            _245 = true;
        }
        else
        {
            bool _247 = _165 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _249 = isnan(_165);
            bool _251 = _247 || _249;
            bool _253 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _255 = _251 || _253;
            if (!_255)
            {
                float _257 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _259 = _165 + _257;
                float _261 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _263 = _261 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _265 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _267 = _265 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _269 = 1.0 / _263;
                float _271 = _259 * _269;
                float _273 = fma(_271, _267, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _215 = _273;
                _245 = true;
            }
            else
            {
                _215 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _245 = false;
    float _275 = _215;
    float _277 = _275 + (-1.0);
    float _279 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _281 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _283 = _277 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _285 = fma(_209, _275, _279);
    float _287 = fma(_205, _275, _281);
    float _289 = fma(_211, _275, _283);
    float _291 = _285 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _293 = _285 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[1].x, _291);
    float _297 = _285 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _299 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[0].x, _293);
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].z, _295);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[2].x, _297);
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].z, _299);
    float _307 = _301 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].z, _303);
    float _311 = _305 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _313 = _307 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _315 = _309 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _317 = _307 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _319 = _307 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[1].x, _313);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[0].x, _317);
    float _325 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[2].x, _319);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[1].z, _321);
    float _329 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[0].z, _323);
    float _331 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[2].z, _325);
    float _333 = _327 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _335 = _329 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _337 = _331 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _339 = _333 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _341 = _333 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _343 = _333 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _345 = _333 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _347 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[7].x, _339);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[8].x, _341);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[9].x, _343);
    float _353 = fma(_335, (*spvDescriptorSet0.vp_c4)._m0[10].x, _345);
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[7].z, _347);
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[8].z, _349);
    float _359 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[9].z, _351);
    float _361 = fma(_337, (*spvDescriptorSet0.vp_c4)._m0[10].z, _353);
    float _363 = _355 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _365 = _357 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _367 = _359 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _369 = _361 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _363;
    out.gl_Position.y = _365;
    out.gl_Position.z = _367;
    out.gl_Position.w = _369;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

