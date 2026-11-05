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
    float _291 = _285 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _293 = _285 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[2].x, _291);
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[0].x, _293);
    float _299 = _285 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].z, _295);
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].z, _297);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[1].x, _299);
    float _307 = _301 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _309 = _303 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _311 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].z, _305);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _319 = _309 + _317;
    float _321 = _311 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _323 = _315 * _315;
    float _325 = _321 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _327 = fma(_319, _319, _323);
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[2].x, _325);
    float _331 = sqrt(_327);
    float _333 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[2].z, _329);
    float _335 = _333 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _337 = _331 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _339 = _289;
    float _341 = _333;
    float _343 = _311;
    float _345 = _335;
    if (!_337)
    {
        _339 = _309;
    }
    float _347 = _339;
    float _349 = _347;
    if (!_337)
    {
        _341 = _307;
    }
    float _351 = _341;
    float _353 = _351;
    if (!_337)
    {
        _343 = _321;
    }
    float _355 = _343;
    bool _357 = !_337;
    float _359 = _355;
    if (!_357)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _365 = _331 + _363;
        float _367 = _321 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _369 = rsqrt(_327);
        float _371 = _365 * _361;
        float _373 = _371 * 0.15915493667125701904296875;
        float _375 = _373 * 6.283185482025146484375;
        float _377 = cos(_375);
        float _379 = _373 * 6.283185482025146484375;
        float _381 = sin(_379);
        float _383 = _377 + (-1.0);
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _387 = fma(_381, _367, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _389 = fma(_321, _377, _385);
        float _391 = _369 * _387;
        float _393 = _389 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _395 = fma(_319, _391, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _397 = fma(_315, _391, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _399 = fma(_395, (*spvDescriptorSet0.vp_c4)._m0[2].x, _393);
        float _401 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[2].z, _399);
        float _403 = _401 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _359 = _389;
        _349 = _395;
        _353 = _397;
        _345 = _403;
    }
    float _405 = _359;
    float _407 = _349;
    float _409 = _353;
    float _411 = _345;
    float _413 = _405 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _415 = _405 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c4)._m0[1].x, _413);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c4)._m0[0].x, _415);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[1].z, _417);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[0].z, _419);
    float _425 = _421 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _427 = _423 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _429 = _425 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _431 = _425 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _433 = _425 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _435 = _425 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _437 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[8].x, _429);
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[7].x, _431);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[9].x, _433);
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[10].x, _435);
    float _445 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[8].z, _437);
    float _447 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[7].z, _439);
    float _449 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[9].z, _441);
    float _451 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[10].z, _443);
    float _453 = _445 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _455 = _447 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _457 = _449 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _459 = _451 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _455;
    out.gl_Position.y = _453;
    out.gl_Position.z = _457;
    out.gl_Position.w = _459;
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
    float _291 = _285 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _293 = _285 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[2].x, _291);
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[0].x, _293);
    float _299 = _285 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].z, _295);
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].z, _297);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[1].x, _299);
    float _307 = _301 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _309 = _303 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _311 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].z, _305);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _319 = _309 + _317;
    float _321 = _311 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _323 = _315 * _315;
    float _325 = _321 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _327 = fma(_319, _319, _323);
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[2].x, _325);
    float _331 = sqrt(_327);
    float _333 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[2].z, _329);
    float _335 = _333 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _337 = _331 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _339 = _289;
    float _341 = _333;
    float _343 = _311;
    float _345 = _335;
    if (!_337)
    {
        _339 = _309;
    }
    float _347 = _339;
    float _349 = _347;
    if (!_337)
    {
        _341 = _307;
    }
    float _351 = _341;
    float _353 = _351;
    if (!_337)
    {
        _343 = _321;
    }
    float _355 = _343;
    bool _357 = !_337;
    float _359 = _355;
    if (!_357)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _365 = _331 + _363;
        float _367 = _321 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _369 = rsqrt(_327);
        float _371 = _365 * _361;
        float _373 = _371 * 0.15915493667125701904296875;
        float _375 = _373 * 6.283185482025146484375;
        float _377 = cos(_375);
        float _379 = _373 * 6.283185482025146484375;
        float _381 = sin(_379);
        float _383 = _377 + (-1.0);
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _387 = fma(_381, _367, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _389 = fma(_321, _377, _385);
        float _391 = _369 * _387;
        float _393 = _389 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _395 = fma(_319, _391, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _397 = fma(_315, _391, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _399 = fma(_395, (*spvDescriptorSet0.vp_c4)._m0[2].x, _393);
        float _401 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[2].z, _399);
        float _403 = _401 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _359 = _389;
        _349 = _395;
        _353 = _397;
        _345 = _403;
    }
    float _405 = _359;
    float _407 = _349;
    float _409 = _353;
    float _411 = _345;
    float _413 = _405 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _415 = _405 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c4)._m0[1].x, _413);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c4)._m0[0].x, _415);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[1].z, _417);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[0].z, _419);
    float _425 = _421 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _427 = _423 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _429 = _425 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _431 = _425 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _433 = _425 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _435 = _425 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _437 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[8].x, _429);
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[7].x, _431);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[9].x, _433);
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[10].x, _435);
    float _445 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[8].z, _437);
    float _447 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[7].z, _439);
    float _449 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[9].z, _441);
    float _451 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[10].z, _443);
    float _453 = _445 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _455 = _447 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _457 = _449 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _459 = _451 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _455;
    out.gl_Position.y = _453;
    out.gl_Position.z = _457;
    out.gl_Position.w = _459;
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
    float _291 = _285 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _293 = _285 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[2].x, _291);
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[0].x, _293);
    float _299 = _285 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].z, _295);
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].z, _297);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c7)._m0[1].x, _299);
    float _307 = _301 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _309 = _303 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _311 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].z, _305);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _319 = _309 + _317;
    float _321 = _311 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _323 = _315 * _315;
    float _325 = _321 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _327 = fma(_319, _319, _323);
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[2].x, _325);
    float _331 = sqrt(_327);
    float _333 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[2].z, _329);
    float _335 = _333 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _337 = _331 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _339 = _289;
    float _341 = _333;
    float _343 = _311;
    float _345 = _335;
    if (!_337)
    {
        _339 = _309;
    }
    float _347 = _339;
    float _349 = _347;
    if (!_337)
    {
        _341 = _307;
    }
    float _351 = _341;
    float _353 = _351;
    if (!_337)
    {
        _343 = _321;
    }
    float _355 = _343;
    bool _357 = !_337;
    float _359 = _355;
    if (!_357)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _365 = _331 + _363;
        float _367 = _321 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _369 = rsqrt(_327);
        float _371 = _365 * _361;
        float _373 = _371 * 0.15915493667125701904296875;
        float _375 = _373 * 6.283185482025146484375;
        float _377 = cos(_375);
        float _379 = _373 * 6.283185482025146484375;
        float _381 = sin(_379);
        float _383 = _377 + (-1.0);
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _387 = fma(_381, _367, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _389 = fma(_321, _377, _385);
        float _391 = _369 * _387;
        float _393 = _389 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _395 = fma(_319, _391, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _397 = fma(_315, _391, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _399 = fma(_395, (*spvDescriptorSet0.vp_c4)._m0[2].x, _393);
        float _401 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[2].z, _399);
        float _403 = _401 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _359 = _389;
        _349 = _395;
        _353 = _397;
        _345 = _403;
    }
    float _405 = _359;
    float _407 = _349;
    float _409 = _353;
    float _411 = _345;
    float _413 = _405 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _415 = _405 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c4)._m0[1].x, _413);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c4)._m0[0].x, _415);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[1].z, _417);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[0].z, _419);
    float _425 = _421 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _427 = _423 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _429 = _425 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _431 = _425 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _433 = _425 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _435 = _425 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _437 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[8].x, _429);
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[7].x, _431);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[9].x, _433);
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c4)._m0[10].x, _435);
    float _445 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[8].z, _437);
    float _447 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[7].z, _439);
    float _449 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[9].z, _441);
    float _451 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[10].z, _443);
    float _453 = _445 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _455 = _447 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _457 = _449 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _459 = _451 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _455;
    out.gl_Position.y = _453;
    out.gl_Position.z = _457;
    out.gl_Position.w = _459;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

