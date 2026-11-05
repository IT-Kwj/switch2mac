#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

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

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2593 = false;
    bool _556 = false;
    bool _343 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2898 = as_type<float>(_125);
        out.gl_Position.z = _2898;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_109);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _119;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_161);
        out.gl_Position.z = _2966;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_66.x;
    float _167 = in.m_66.y;
    float _169 = in.m_66.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _209 = _201;
    float _227;
    if (!_207)
    {
        float _211 = in.m_68.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = in.m_68.x;
    float _241 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _237 + _243;
    bool _247 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_237);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -_257;
    float _265 = _263 + 1.0;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = 1.0 / _261;
    float _271 = _241 * _239;
    float _273 = _245 * _269;
    bool _275 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_237);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = trunc(_271);
    int _297 = int(_295);
    float _299 = _285 * _265;
    float _301 = fma(_289, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_293, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = -_285;
    float _307 = _305 + 1.0;
    float _309 = _301 * _299;
    float _311 = _303 * _299;
    float _313 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    int _321 = _297 << 4;
    int _323 = _321 + 1712;
    bool _325 = !_267;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _239 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_109);
        float _347 = 1.0 / _345;
        float _349 = _143 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    uint _354 = uint(int(uint(_323) >> uint(2)));
    uint _356 = uint(int(uint(int(_354)) >> uint(2)));
    int _358 = int(_354) & 3;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[int(_356)][_358];
    int _362 = int(_354) + 1;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    int _366 = _362 & 3;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[int(_364)][_366];
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _378 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _380 = isnan(_351);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    int _390 = _323 + 8;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    uint _394 = uint(int(uint(int(_392)) >> uint(2)));
    int _396 = int(_392) & 3;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[int(_394)][_396];
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _404 = 1.0 / _372;
    bool _406 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_351);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    float _422 = -_388;
    float _424 = _422 + 1.0;
    bool _426 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _428 = isnan(_351);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _442 = _416 * _424;
    float _444 = 1.0 / _376;
    float _446 = -_416;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = _351 + _450;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _456 = _436 * _448;
    float _458 = -_436;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _402;
    float _464 = _420 * _404;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _351 + _466;
    float _470 = fma(_464, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _472;
    float _476 = _440 * _444;
    bool _478 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = isnan(_351);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = _470 * _456;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _351 + _492;
    float _496 = fma(_476, _452, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _498 = -_488;
    float _500 = _498 + 1.0;
    float _502 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _504 = _474 * _462;
    float _506 = _388 * _500;
    float _508 = fma(_496, _442, _502);
    float _510 = fma(_504, _494, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _512 = _360 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _514 = _368 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = fma(_510, _506, _508);
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[118].x, _516);
    float _524 = in.m_70.x;
    float _526 = in.m_70.y;
    float _528 = _398 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _530 = _522 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _518;
    out.m_72.y = _520;
    out.m_72.z = _532;
    out.m_72.w = _530;
    float _534 = _319 * _526;
    float _536 = _317 * _524;
    bool _538 = !_454;
    float _554;
    if (!_538)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _542 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_109);
        float _560 = 1.0 / _558;
        float _562 = _143 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = in.m_56.x;
    float _568 = in.m_56.y;
    float _570 = in.m_56.z;
    float _572 = _568 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[4].x, _572);
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[6].x, _574);
    float _580 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
    float _582 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
    float _584 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _586 = _582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _588 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _590 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _592 = floor(_588);
    float _594 = floor(_590);
    float _596 = -_592;
    float _598 = _588 + _596;
    float _600 = -_594;
    float _602 = _590 + _600;
    float2 _3684 = float2(_598, _602);
    float _604 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3684, float2(0.0), isnan(_3684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3684, float2(0.0), isnan(_3684)), level(0.0)).x;
    float _606 = _568 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _608 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[5].x, _606);
    float _612 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    float _614 = _612 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _616 = _614 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _618 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[11].x, _616);
    float _620 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].z, _618);
    float _622 = _614 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _624 = _620 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _626 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[10].x, _622);
    float _628 = 1.0 / _624;
    float _630 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].z, _626);
    float _632 = _630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _634 = _632 + _624;
    float _636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _638 = _634 * _628;
    float _640 = _638 * 0.5;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _646 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[30].w, _644);
    float _648 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _650 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = _608 * _642;
    float _654 = 1.0 / _646;
    float _656 = _614 + _648;
    float _658 = _650 * _636;
    float _660 = _652 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _662 = _652 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _664 = _656 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _666 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _660);
    float _670 = _656 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _672 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[127].x, _664);
    float _674 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _668);
    float _676 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[126].x, _670);
    float _678 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _662);
    float _680 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[127].z, _672);
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _684 = _654 * _682;
    float _686 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[126].z, _676);
    float _688 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
    float _690 = _680 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _692 = _674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _694 = _684 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _696 = _686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _698 = _684 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _700 = _688 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _702 = !_694;
    int _704 = _702 ? 0 : 1;
    float _706 = trunc(_696);
    int _708 = int(_706);
    float _710 = _586 + _692;
    float _712 = _584 + _700;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _710 + _714;
    int _718 = 2;
    int _720 = as_type<int>(_712);
    int _722 = as_type<int>(_710);
    float _724 = _652;
    float _726 = _696;
    float _728 = _690;
    if (!_694)
    {
        _718 = 1;
    }
    int _730 = _718;
    float _732 = trunc(_690);
    int _734 = int(_732);
    int _736 = _730;
    if (!_698)
    {
        _736 = _704;
    }
    int _738 = _736;
    float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _742 = _712 + _740;
    float _744 = _716 * _716;
    int _746 = _738 << 6;
    float _748 = fma(_742, _742, _744);
    int _750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _752 = _708 + _750;
    int _754 = _752 + 1;
    int _756 = _746 + 48;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    uint _760 = uint(int(uint(int(_758)) >> uint(2)));
    int _762 = int(_758) & 3;
    float _764 = (*spvDescriptorSet0.vp_c15)._m0[int(_760)][_762];
    int _766 = int(_758) + 1;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    int _770 = _766 & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    float _774 = sqrt(_748);
    bool _776 = _754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _778 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _780 = _734 + _778;
    int _782 = _780 + 1;
    int _784 = _746 + 56;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    float _802 = _652 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _804 = _754 | _782;
    float _806 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _802);
    bool _808 = _804 < 0;
    bool _810 = _808 || _776;
    int _812 = _746 + 64;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    float _830 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _806);
    bool _832 = _782 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _834 = _832 || _810;
    bool _836 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _830 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _840 = _746 + 72;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.vp_c15)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.vp_c15)._m0[int(_852)][_854];
    float _858 = _614 + _838;
    int _860 = _746 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    int _878 = _804;
    float _880 = as_type<float>(_782);
    float _882 = as_type<float>(_754);
    int _884 = as_type<int>(_830);
    float _886 = _802;
    float _888 = _748;
    float _890 = as_type<float>(_738);
    float _892 = as_type<float>(_746);
    if (!_834)
    {
        int _894 = _782 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _896 = _894 + _754;
        _878 = _896;
    }
    int _898 = _878;
    float _900 = as_type<float>(_898);
    if (!_836)
    {
        _880 = _712;
    }
    float _902 = _880;
    float _904 = _902;
    if (!_836)
    {
        _882 = _710;
    }
    float _906 = _882;
    float _908 = _906;
    if (!_834)
    {
        int _910 = _898 << 2;
        _884 = _910;
    }
    int _912 = _884;
    int _914 = _746 + 104;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    if (!_834)
    {
        uint _932 = uint(int(uint(_898) >> uint(2)));
        _720 = int(_932);
    }
    int _934 = _720;
    if (!_834)
    {
        int _936 = 12 & _912;
        _722 = _936;
    }
    int _938 = _722;
    if (!_836)
    {
        _886 = _858;
    }
    float _940 = _886;
    bool _942 = !_836;
    float _944 = _940;
    float _946 = _876;
    if (!_942)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _774 + _950;
        float _954 = rsqrt(_748);
        float _956 = _952 * _948;
        float _958 = _858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_858, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_742, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_716, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _944 = _976;
        _904 = _980;
        _908 = _982;
        _888 = _954;
        _724 = _972;
    }
    float _984 = _944;
    float _986 = _904;
    float _988 = _908;
    float _990 = _888;
    float _992 = _724;
    float _994 = _990;
    float _996 = _992;
    float _998 = _986;
    float _1000 = _984;
    float _1002 = _988;
    if (!_834)
    {
        int _1004 = _934 << 4;
        int _1006 = _1004 + _938;
        _994 = as_type<float>(_1006);
    }
    float _1008 = _994;
    float _1010 = -_614;
    float _1012 = _1010 + _984;
    int _1014 = _746 + 80;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    float _1032 = -_584;
    float _1034 = _1032 + _986;
    float _1036 = -_586;
    float _1038 = _1036 + _988;
    float _1040 = _1012 * _1012;
    float _1042 = _656 * _876;
    float _1044 = _1038;
    float _1046 = _1040;
    if (!_834)
    {
        float _1048 = floor(_696);
        _996 = _1048;
    }
    float _1050 = _996;
    float _1052 = _656 * _828;
    float _1054 = fma(_1034, _1034, _1040);
    int _1056 = _746 + 88;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
    int _1062 = int(_1058) & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = int(_1058) + 1;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    int _1070 = _1066 & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    float _1074 = fma(_584, _868, _1042);
    float _1076 = fma(_584, _820, _1052);
    float _1078 = fma(_1038, _1038, _1054);
    float _1080 = fma(_586, _922, _1074);
    float _1082 = _656 * _772;
    float _1084 = sqrt(_1078);
    float _1086 = _1008;
    float _1088 = _1082;
    float _1090 = _1050;
    if (!_834)
    {
        int _1092 = as_type<int>(_1008) + 400;
        uint _1094 = uint(int(uint(_1092) >> uint(2)));
        uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
        int _1098 = int(_1094) & 3;
        float _1100 = (*spvDescriptorSet0.vp_c15)._m0[int(_1096)][_1098];
        _1086 = _1100;
    }
    float _1102 = _1086;
    float _1104 = _1080 + _930;
    float _1106 = fma(_584, _764, _1082);
    bool _1108 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1110 = isnan(0.5);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_586, _792, _1106);
    float _1120 = _922;
    float _1122 = _1102;
    if (!_834)
    {
        float _1124 = floor(_690);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = fma(_586, _848, _1076);
    float _1130 = _1118 + _800;
    float _1132 = _1128 + _856;
    bool _1134 = _1084 > 0.0;
    float _1136 = 1.0 / _1104;
    bool _1138 = !_1134;
    if (!_1138)
    {
        float _1140 = _203 * _203;
        float _1142 = fma(_201, _201, _1140);
        float _1144 = rsqrt(_1078);
        float _1146 = fma(_205, _205, _1142);
        float _1148 = sqrt(_1146);
        float _1150 = _1034 * _1144;
        float _1152 = _1012 * _1144;
        float _1154 = _1038 * _1144;
        bool _1156 = _1148 > 0.0;
        bool _1158 = !_1156;
        _946 = _1150;
        _1044 = _1154;
        if (!_1158)
        {
            float _1160 = rsqrt(_1146);
            float _1162 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1164 = _203 * _1160;
            float _1166 = _201 * _1160;
            float _1168 = _205 * _1160;
            float _1170 = _1152 * _1164;
            float _1172 = fma(_1150, _1166, _1170);
            float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1176 = fma(_1154, _1168, _1172);
            float _1178 = _1176 * _1174;
            float _1180 = fma(_201, _1178, _986);
            float _1182 = fma(_203, _1178, _984);
            float _1184 = fma(_205, _1178, _988);
            _998 = _1180;
            _1000 = _1182;
            _1002 = _1184;
            _1088 = _1174;
        }
    }
    float _1186 = _998;
    float _1188 = _1000;
    float _1190 = _1002;
    float _1192 = _946;
    float _1194 = _1088;
    float _1196 = _1044;
    float _1198 = _1194;
    float _1200 = _1192;
    float _1202 = _1196;
    if (_1116)
    {
        _1198 = _1186;
    }
    float _1204 = _1198;
    float _1206 = _1204;
    if (_1116)
    {
        _1200 = _1188;
    }
    float _1208 = _1200;
    float _1210 = _1208;
    if (_1116)
    {
        _209 = _1190;
    }
    float _1212 = _209;
    float _1214 = _1212;
    if (!_1116)
    {
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1218 = _614 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1222 = _584 + _1220;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1226 = -_614;
        float _1228 = _1226 + _1188;
        float _1230 = _1218 * _1218;
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1234 = _586 + _1232;
        float _1236 = -_584;
        float _1238 = _1236 + _1186;
        float _1240 = -_586;
        float _1242 = _1240 + _1190;
        float _1244 = fma(_1222, _1222, _1230);
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1248 = fma(_1234, _1234, _1244);
        float _1250 = sqrt(_1248);
        float _1252 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1254 = precise::min(_1250, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1256 = _1254 * _1246;
        float _1258 = _1252 * _1256;
        float _1260 = fma(_1228, _1258, _614);
        float _1262 = fma(_1238, _1258, _584);
        float _1264 = fma(_1242, _1258, _586);
        _1210 = _1260;
        _1206 = _1262;
        _1214 = _1264;
    }
    float _1266 = _1210;
    float _1268 = _1206;
    float _1270 = _1214;
    float _1272 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1278 = _1130 * _1136;
    float _1280 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1272);
    float _1282 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1274);
    float _1284 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1276);
    float _1286 = _1132 * _1136;
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1280);
    float _1290 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1282);
    bool _1292 = _1278 >= 0.0;
    float _1294 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1296 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1284);
    float _1298 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1300 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1302 = _1278 <= 1.0;
    bool _1304 = _1302 && _1292;
    float _1306 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1294);
    float _1308 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1312 = _1286 >= 0.0;
    bool _1314 = _1312 && _1304;
    float _1316 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1306);
    float _1318 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1320 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1310);
    float _1322 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1324 = _1286 <= 1.0;
    bool _1326 = _1324 && _1314;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1330 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1320);
    float _1332 = -_1322;
    float _1334 = fma(_1332, _1318, 1.0);
    float _1336 = _656 * _1030;
    float _1338 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1340 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1330);
    float _1342 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1344 = fma(_584, _1022, _1336);
    float _1346 = log2(_1334);
    float _1348 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1338);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1342);
    float _1352 = fma(_586, _1064, _1344);
    if (_1326)
    {
        float _1354 = float(_738);
        _890 = _1354;
    }
    float _1356 = _890;
    float _1358 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1348);
    float _1360 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1362 = _1352 + _1072;
    float _1364 = 1.0 / _1340;
    float _1366 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1368 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1370 = _1356;
    float _1372 = _1368;
    if (!_834)
    {
        float _1374 = -_1050;
        float _1376 = _696 + _1374;
        _726 = _1376;
    }
    float _1378 = _726;
    float _1380 = _1362 * _1136;
    float _1382 = _614;
    float _1384 = _1378;
    if (!_834)
    {
        float _1386 = rint(_1102);
        float _1388 = precise::max(_1386, 0.0);
        uint _1390 = uint(_1388);
        uint _1392 = clamp(_1390, 0u, 65535u);
        _1382 = as_type<float>(_1392);
    }
    float _1394 = _1382;
    float _1396 = _1346 * 0.693147182464599609375;
    float _1398 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1400 = _1342;
    if (_1326)
    {
        float _1402 = rint(_1356);
        float _1404 = precise::max(_1402, 0.0);
        uint _1406 = uint(_1404);
        uint _1408 = clamp(_1406, 0u, 65535u);
        _1400 = as_type<float>(_1408);
    }
    float _1410 = _1400;
    float _1412 = _1366 * _1364;
    if (!_834)
    {
        float _1414 = -_1126;
        float _1416 = _690 + _1414;
        _1122 = _1416;
    }
    float _1418 = _1122;
    float _1420 = _1368 * _1364;
    float _1422 = fma(_1412, 0.5, 0.5);
    float _1424 = fma(_1420, -0.5, 0.5);
    float _1426 = _1418;
    float _1428 = _1394;
    if (!_834)
    {
        float3 _5056 = float3(_1378, _1418, float(as_type<int>(_1394)));
        float3 _5060 = select(_5056, float3(0.0), isnan(_5056));
        float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5060.xy, uint(rint(_5060.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5060.xy, uint(rint(_5060.z)), level(0.0)).x;
        _1426 = _1430;
    }
    float _1432 = _1426;
    float _1434 = _1286;
    if (_1326)
    {
        float3 _5075 = float3(_1278, _1286, float(as_type<int>(_1410)));
        float3 _5077 = select(_5075, float3(0.0), isnan(_5075));
        float _1436 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5077.xy, uint(rint(_5077.z)), _1380, level(0.0));
        _1434 = _1436;
    }
    float _1438 = _1434;
    float3 _5087 = float3(_1422, _1424, _1398);
    float _1440 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5087, float3(0.0), isnan(_5087)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5087, float3(0.0), isnan(_5087)), level(0.0)).x;
    float3 _5096 = float3(_1422, _1424, _1398);
    float4 _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5096, float3(0.0), isnan(_5096)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5096, float3(0.0), isnan(_5096)), level(0.0)).xyzw;
    float _1445 = _1443.x;
    float _1447 = _1443.y;
    float _1449 = _1443.z;
    float _1451 = _1443.w;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1461 = _1457 || _1459;
    if (_834)
    {
        _1090 = 1.0;
    }
    float _1463 = _1090;
    float _1465 = _1463;
    if (_1461)
    {
        _728 = 1.0;
    }
    float _1467 = _728;
    float _1469 = _1467;
    if (_1461)
    {
        _1370 = 1.0;
    }
    float _1471 = _1370;
    float _1473 = _1471;
    float _1475 = _1438;
    float _1477 = _1447;
    float _1479 = _1445;
    float _1481 = _1451;
    float _1483 = _1449;
    if (!_1461)
    {
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1487 = _1485 * 0.15915493667125701904296875;
        float _1489 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1491 = _1487 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1493;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1515 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1513;
        float _1517 = _1505 * _1507;
        float _1519 = 1.0 / _1515;
        float _1521 = 1.0 / _1517;
        float _1523 = _1511 * _1521;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1527 = fma(_684, _1523, _1525);
        float _1529 = _1527 * _1519;
        float _1531 = precise::clamp(_1529, 0.0, 1.0);
        _1428 = _1493;
        _1384 = _1519;
        _1473 = _1531;
    }
    float _1533 = _1428;
    float _1535 = _1384;
    float _1537 = _1473;
    float _1539 = _1533;
    float _1541 = _1535;
    if (!_1461)
    {
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = _1545 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 0.15915493667125701904296875;
        float _1555 = _1545 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = 1.0 / _1551;
        float _1561 = _1553 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = _1557 * _1559;
        float _1567 = _1553 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1563 * _1565;
        float _1573 = 1.0 / _1571;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1577 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1575;
        float _1579 = 1.0 / _1577;
        float _1581 = _1569 * _1573;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1585 = fma(_684, _1581, _1583);
        float _1587 = _1585 * _1579;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        float _1591 = -_1589;
        float _1593 = _1591 + 1.0;
        _1539 = _1553;
        _1541 = _1573;
        _1469 = _1593;
    }
    float _1595 = _1539;
    float _1597 = _1541;
    float _1599 = _1469;
    float _1601 = _1597;
    float _1603 = _1595;
    if (!_834)
    {
        int _1605 = _898 << 4;
        int _1607 = _1605 + 2048;
        uint _1609 = uint(int(uint(_1607) >> uint(2)));
        uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
        int _1613 = int(_1609) & 3;
        float _1615 = (*spvDescriptorSet0.vp_c15)._m0[int(_1611)][_1613];
        int _1617 = int(_1609) + 1;
        uint _1619 = uint(int(uint(_1617) >> uint(2)));
        int _1621 = _1617 & 3;
        float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
        int _1625 = _1607 + 8;
        uint _1627 = uint(int(uint(_1625) >> uint(2)));
        uint _1629 = uint(int(uint(int(_1627)) >> uint(2)));
        int _1631 = int(_1627) & 3;
        float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
        int _1635 = int(_1627) + 1;
        uint _1637 = uint(int(uint(_1635) >> uint(2)));
        int _1639 = _1635 & 3;
        float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
        float _1643 = _656 * _1623;
        float _1645 = fma(_584, _1615, _1643);
        float _1647 = fma(_586, _1633, _1645);
        float _1649 = _1647 + _1641;
        float _1651 = precise::clamp(_1649, 0.0, 1.0);
        float _1653 = -_1651;
        float _1655 = _1653 + _1432;
        float _1657 = fma(_1655, 500.0, 1.5);
        float _1659 = exp2(_1657);
        float _1661 = 0.0 + _1659;
        float _1663 = precise::clamp(_1661, 0.0, 1.0);
        _1601 = _1641;
        _1603 = _1633;
        _900 = as_type<float>(_1607);
        _1465 = _1663;
    }
    float _1665 = _1601;
    float _1667 = _1603;
    float _1669 = _900;
    float _1671 = _1465;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1675 = _1266 + _1673;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1679 = _1268 + _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1683 = _1270 + _1681;
    float _1685 = _1675 * _1675;
    float _1687 = fma(_1679, _1679, _1685);
    float _1689 = fma(_1683, _1683, _1687);
    float _1691 = rsqrt(_1689);
    float _1693 = sqrt(_1689);
    float _1695 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1697 = _1679 * _1695;
    float _1699 = _1683 * _1695;
    float _1701 = _1697 * _1697;
    float _1703 = _1699 * _1699;
    float _1705 = _1701 + _1703;
    float _1707 = sqrt(_1705);
    bool _1709 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1713 = _1707 + _1711;
    float _1715 = _1691;
    float _1717 = _1667;
    float _1719 = _1713;
    float _1721 = _1665;
    float _1723 = _1675;
    float _1725 = _1669;
    float _1727 = _1705;
    if (_1709)
    {
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1715 = _1729;
    }
    float _1731 = _1715;
    if (_1709)
    {
        float _1733 = rsqrt(_1705);
        _1717 = _1733;
    }
    float _1735 = _1717;
    float _1737 = _1735;
    if (_1709)
    {
        float _1739 = _1713 * _1731;
        _1719 = _1739;
    }
    float _1741 = _1719;
    if (_1709)
    {
        float _1743 = _1741 * 0.15915493667125701904296875;
        _1721 = _1743;
    }
    float _1745 = _1721;
    float _1747 = _1683;
    if (_1709)
    {
        float _1749 = _1745 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        _1747 = _1751;
    }
    float _1753 = _1747;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1757 = precise::max(0.0, _1755);
    float _1759 = _1731;
    float _1761 = _1757;
    if (_1709)
    {
        float _1763 = _1745 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        _1759 = _1765;
    }
    float _1767 = _1759;
    float _1769 = -_1695;
    float _1771 = -_1757;
    float _1773 = fma(_1675, _1769, _1771);
    if (_1709)
    {
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1775;
    }
    float _1777 = _1723;
    float _1779 = _1777;
    float _1781 = _1753;
    if (_1709)
    {
        float _1783 = fma(_1753, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    if (!_1709)
    {
        _1781 = _1697;
    }
    float _1789 = _1781;
    float _1791 = _1789;
    float _1793 = _1767;
    if (_1709)
    {
        float _1795 = _1767 + (-1.0);
        _1761 = _1795;
    }
    float _1797 = _1761;
    float _1799 = _1797;
    if (_1709)
    {
        float _1801 = _1735 * _1785;
        _1202 = _1801;
    }
    float _1803 = _1202;
    if (!_1709)
    {
        _1787 = _1773;
    }
    float _1805 = _1787;
    float _1807 = _1805;
    if (_1709)
    {
        float _1809 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1809;
    }
    float _1811 = _1725;
    if (_1709)
    {
        float _1813 = _1697 * _1803;
        _1791 = _1813;
    }
    float _1815 = _1791;
    if (!_1709)
    {
        _1799 = _1699;
    }
    float _1817 = _1799;
    float _1819 = _1817;
    if (_1709)
    {
        float _1821 = _1699 * _1803;
        _1819 = _1821;
    }
    float _1823 = _1819;
    if (!_1709)
    {
        _1737 = _1701;
    }
    float _1825 = _1737;
    float _1827 = _1825;
    if (_1709)
    {
        float _1829 = fma(_1773, _1767, _1811);
        _1807 = _1829;
    }
    float _1831 = _1807;
    if (_1709)
    {
        float _1833 = _1815 * _1815;
        _1827 = _1833;
    }
    float _1835 = _1827;
    if (!_1709)
    {
        _1793 = _1703;
    }
    float _1837 = _1793;
    float _1839 = _1837;
    if (_1709)
    {
        float _1841 = _1823 * _1823;
        _1839 = _1841;
    }
    float _1843 = _1839;
    float _1845 = fma(_1831, _1831, _1835);
    float _1847 = _1845 + _1843;
    float _1849 = rsqrt(_1847);
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1853 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1851);
    float _1855 = precise::clamp(_1853, 0.0, 1.0);
    float _1857 = -_1855;
    float _1859 = _1857 + 1.0;
    float _1861 = abs(_1859);
    float _1863 = log2(_1861);
    float _1865 = _1849 * _1815;
    float _1867 = _1849 * _1831;
    float _1869 = _1849 * _1823;
    float _1871 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1873 = -_1871;
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1873);
    float _1877 = -_1869;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1875);
    float _1881 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1883 = fma(_1879, -0.5, 0.5);
    float _1885 = fma(_1879, 0.5, 0.5);
    float _1887 = exp2(_1881);
    float _1889 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1885, _1889, -0.212114393711090087890625);
    float _1893 = _1867 + 1.0;
    float _1895 = sqrt(_1883);
    float _1897 = fma(_1885, _1891, 1.570728778839111328125);
    float _1899 = -_1867;
    float _1901 = fma(_1887, _1893, _1899);
    float _1903 = fma(_1901, 0.5, 0.5);
    float _1905 = _1895 * 0.636619746685028076171875;
    float _1907 = -_1897;
    float _1909 = fma(_1905, _1907, 1.0);
    float2 _5761 = float2(_1909, _1903);
    float3 _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).xyz;
    float _1915 = _1913.x;
    float _1917 = _1913.y;
    float _1919 = _1913.z;
    float _1921 = in.m_68.z;
    float _1923 = in.m_68.w;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1927 = _564 + _1925;
    float _1929 = in.m_68.y;
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1933 = _1931 != 0;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1937 = _564 + _1935;
    float _1939 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1943 = _1941 != 0;
    float _1945 = -_604;
    float _1947 = _1945 + 1.0;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1953 = exp2(_1939);
    bool _1955 = _239 > 0.5;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1961 = _1803;
    if (!_1933)
    {
        float _1963 = in.m_68.z;
        _1961 = _1963;
    }
    float _1965 = _1961;
    if (_1933)
    {
        _1046 = _239;
    }
    float _1967 = _1046;
    float _1969 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1971 = -_189;
    int _1973 = _1955 ? as_type<int>(_1971) : as_type<int>(_189);
    float _1975 = 1.0 / _1951;
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1981 = _1923 > 0.5;
    bool _1983 = _1921 > 0.5;
    float _1985 = -_199;
    int _1987 = _1981 ? as_type<int>(_1985) : as_type<int>(_199);
    bool _1989 = _1929 > 0.5;
    float _1991 = 1.0 / _1959;
    float _1993 = _1967;
    float _1995 = _1921;
    if (!_1933)
    {
        _1993 = _1921;
    }
    float _1997 = _1993;
    float _1999 = -_189;
    int _2001 = _1989 ? as_type<int>(_1999) : as_type<int>(_189);
    if (!_1933)
    {
        _1995 = _1929;
    }
    float _2003 = _1995;
    bool _2005 = !_1943;
    float _2007 = _2005 ? _189 : as_type<float>(_2001);
    float _2009 = 1.0 / _1979;
    int _2011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2013 = _2011 != 0;
    float _2015 = -_189;
    int _2017 = _1983 ? as_type<int>(_2015) : as_type<int>(_189);
    float _2019 = _2003;
    if (!_1933)
    {
        _892 = _2003;
    }
    float _2021 = _892;
    float _2023 = _2021;
    if (_1933)
    {
        _2019 = _1929;
    }
    float _2025 = _2019;
    bool _2027 = !_2013;
    float _2029 = _2027 ? _189 : as_type<float>(_2017);
    float _2031 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1969);
    float _2033 = _1965;
    float _2035 = _2025;
    if (!_1933)
    {
        _1727 = _1965;
    }
    float _2037 = _1727;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2031);
    float _2045 = _2037;
    if (_1933)
    {
        _2045 = _2025;
    }
    float _2047 = _2045;
    if (_1933)
    {
        _2033 = _2025;
    }
    float _2049 = _2033;
    float _2051 = -_2043;
    float _2053 = _2051 + 1.0;
    if (_1933)
    {
        _2023 = _239;
    }
    float _2055 = _2023;
    if (!_1933)
    {
        _2035 = _239;
    }
    float _2057 = _2035;
    float _2059 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2067 = _2065 != 0;
    float _2069 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2073 = _2071 != 0;
    bool _2075 = !_2041;
    float _2077 = _2075 ? _189 : as_type<float>(_1973);
    float _2079 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2081 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2083 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2087;
    float _2091 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2081);
    float _2093 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2083);
    float _2095 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2085);
    float _2097 = _2089 * _1975;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2099;
    bool _2103 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2105 = isnan(_564);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2121 = _564 + _2119;
    float _2123 = _2101 * _1991;
    bool _2125 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2127 = isnan(_564);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = -_2113;
    float _2139 = _2137 + 1.0;
    bool _2141 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2143 = isnan(_564);
    bool _2145 = _2141 || _2143;
    bool _2147 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2149 = _2145 || _2147;
    float _2151 = float(_2149);
    float _2153 = _2117 * _2009;
    float _2155 = fma(_2097, _2121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2157 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2159 = isnan(_564);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2135 * _2139;
    float _2171 = -_2135;
    float _2173 = _2171 + 1.0;
    float _2175 = -_2151;
    float _2177 = _2175 + 1.0;
    float _2179 = fma(_2123, _1927, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2181 = _2151 * _2173;
    float _2183 = _2167 * _2177;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2187 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2189 = fma(_2153, _1937, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2191 = _2155 * _2183;
    float _2193 = -_2185;
    float _2195 = fma(_2187, 2.0, _2193);
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2199 = -_2167;
    float _2201 = _2199 + 1.0;
    float _2203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2205 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2197);
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2209 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2191);
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2213 = -_199;
    int _2215 = _1983 ? as_type<int>(_2213) : as_type<int>(_199);
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2219 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2207);
    float _2221 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2225 = fma(_2189, _2181, _2209);
    float _2227 = -_2217;
    float _2229 = fma(_2221, 2.0, _2227);
    float _2231 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2211);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2235 = -_199;
    int _2237 = _1989 ? as_type<int>(_2235) : as_type<int>(_199);
    float _2239 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2241 = !_2063;
    float _2243 = _2241 ? _199 : as_type<float>(_1987);
    float _2245 = fma(_2179, _2169, _2225);
    bool _2247 = !_2067;
    float _2249 = _2247 ? _199 : as_type<float>(_2215);
    float _2251 = fma(_2239, -2.0, _2233);
    bool _2253 = !_2073;
    float _2255 = _2253 ? _199 : as_type<float>(_2237);
    float _2257 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2259 = -_143;
    float _2261 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2195);
    float _2263 = _2007 + 0.5;
    float _2265 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2267 = _2029 + 0.5;
    float _2269 = -_143;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2229);
    float _2273 = fma(_2257, _2263, _2261);
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2277 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2205);
    float _2279 = fma(_2265, _2267, _2271);
    float _2281 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2251);
    float _2283 = fma(_2069, -2.0, _2275);
    float _2285 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2219);
    float _2287 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2231);
    float _2289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2291 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2283);
    float _2293 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2245);
    float _2295 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2297 = _2077 + 0.5;
    float _2299 = _2243 + (-0.5);
    float _2301 = -_2255;
    float _2303 = _2301 + 0.5;
    float _2305 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2295);
    float _2307 = abs(_684);
    float _2309 = log2(_2307);
    float _2311 = _2297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2313 = -_2287;
    float _2315 = _2313 + 1.0;
    float _2317 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2319 = -_2053;
    float _2321 = fma(_2007, _2319, _2273);
    float _2323 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2305);
    float _2325 = _2249 + (-0.5);
    float _2327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2329 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2331 = _684 <= 8000.0;
    bool _2333 = isnan(_684);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(8000.0);
    bool _2339 = _2335 || _2337;
    float _2341 = float(_2339);
    float _2343 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2323);
    float _2345 = -_2277;
    float _2347 = _2345 + 1.0;
    float _2349 = -_2329;
    float _2351 = -_2281;
    float _2353 = fma(_2349, _2299, _2351);
    float _2355 = _2343 + _1340;
    float _2357 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2361 = fma(_2243, _2315, _2353);
    out.gl_Position.x = _1366;
    out.gl_Position.y = _1368;
    out.gl_Position.z = _2343;
    out.gl_Position.w = _1340;
    float _2363 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2365 = _2355 * 0.5;
    float _2367 = _2311 * _2327;
    float _2369 = exp2(_2357);
    float _2371 = -_2285;
    float _2373 = _2371 + 1.0;
    out.m_74.w = _2363;
    float _2375 = -_2373;
    float _2377 = fma(_2029, _2375, _2279);
    float _2379 = _2317 * _2359;
    float _2381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2383 = -_1953;
    float _2385 = _2383 + 1.0;
    if (!_1326)
    {
        _1372 = 1.0;
    }
    float _2387 = _1372;
    float _2389 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_76.x = _2367;
    out.m_76.y = _2379;
    out.m_76.z = _2377;
    out.m_76.w = _2361;
    float _2391 = _2387;
    if (_1326)
    {
        bool _2393 = _1438 >= _1380;
        bool _2395 = isnan(_1438);
        bool _2397 = _2393 || _2395;
        bool _2399 = isnan(_1380);
        bool _2401 = _2397 || _2399;
        float _2403 = float(_2401);
        _2391 = _2403;
    }
    float _2405 = _2391;
    float _2407 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2409 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = _1537 * _1599;
    float _2415 = _2405 * _1671;
    float _2417 = _2407 * _1440;
    float _2419 = -_2407;
    float _2421 = _2419 + 1.0;
    out.m_78.z = _2365;
    out.m_78.w = _1340;
    bool _2423 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2425 = isnan(_1693);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2431 = _2427 || _2429;
    float _2433 = _2381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2435 = fma(_2411, -2.0, 3.0);
    float _2437 = _2411 * _2411;
    float _2439 = -_2433;
    float _2441 = -_2291;
    float _2443 = fma(_2439, _2325, _2441);
    float _2445 = _1451 * _2421;
    float _2447 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2449 = _2437 * _2435;
    float _2451 = fma(_2249, _2347, _2443);
    float _2453 = -_2449;
    float _2455 = _2453 + 1.0;
    float _2457 = _2413;
    if (!_2431)
    {
        _1475 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2459 = _1475;
    out.m_80.x = _2321;
    out.m_80.y = _2451;
    float _2461 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2449);
    float _2463 = _1451 * _2417;
    float _2465 = _2341 * _2461;
    float _2467 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2469 = _1947 * _2467;
    float _2471 = precise::clamp(_2469, 0.0, 1.0);
    float _2473 = -_2471;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2477 = -_2415;
    float _2479 = fma(_2477, _2475, 1.0);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = _2481 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2485 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_82.x = _2483;
    out.m_84.x = _2447;
    out.m_84.y = _2485;
    out.m_84.z = _2389;
    float _2487 = _1919 * _2417;
    float _2489 = fma(_1915, _2463, _1445);
    float _2491 = fma(_1917, _2463, _1447);
    float _2493 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2495 = fma(_1451, _2487, _1449);
    float _2497 = _2459;
    float _2499 = _2459;
    if (!_2431)
    {
        _1477 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2501 = _1477;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2431)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2507 = _1479;
    out.m_86.x = _2489;
    out.m_86.y = _2491;
    out.m_86.z = _2495;
    out.m_86.w = _2445;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2431)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2513 = _1481;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2431)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2519 = _1483;
    float _2521 = _2519;
    float _2523 = _2519;
    if (!_2431)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2525 = _2457;
    bool _2527 = !_2431;
    float _2529 = _2525;
    float _2531 = _2525;
    if (!_2527)
    {
        bool _2533 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2535 = isnan(_1693);
        bool _2537 = _2533 || _2535;
        bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2541 = _2537 || _2539;
        if (!_2541)
        {
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2545 = _1693 + _2543;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2547;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2555 = 1.0 / _2549;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2573 = _2545 * _2555;
            float _2575 = precise::clamp(_2573, 0.0, 1.0);
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2505 = _2583;
            _2523 = _2589;
            _2499 = _2581;
            _2517 = _2587;
            _2511 = _2585;
            _2531 = _2591;
            _2593 = true;
        }
        else
        {
            bool _2595 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2597 = isnan(_1693);
            bool _2599 = _2595 || _2597;
            bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2603 = _2599 || _2601;
            if (!_2603)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2605 = _2497;
            _2499 = _2605;
            if (!_2603)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2607 = _2503;
            _2505 = _2607;
            if (!_2603)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2609 = _2509;
            _2511 = _2609;
            if (!_2603)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2611 = _2515;
            _2517 = _2611;
            if (!_2603)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2613 = _2521;
            _2523 = _2613;
            if (!_2603)
            {
                _2529 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2615 = _2529;
            bool _2617 = !_2603;
            _2531 = _2615;
            if (!_2617)
            {
                bool _2619 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2621 = isnan(_1693);
                bool _2623 = _2619 || _2621;
                bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2627 = _2623 || _2625;
                if (!_2627)
                {
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2631 = _1693 + _2629;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2633;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2641 = 1.0 / _2635;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2659 = _2631 * _2641;
                    float _2661 = precise::clamp(_2659, 0.0, 1.0);
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2667 = fma(_2661, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2669 = fma(_2661, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2671 = fma(_2661, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2673 = fma(_2661, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2675 = fma(_2661, _2653, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2677 = fma(_2661, _2657, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2505 = _2669;
                    _2523 = _2675;
                    _2499 = _2667;
                    _2517 = _2673;
                    _2511 = _2671;
                    _2531 = _2677;
                    _2593 = true;
                }
                else
                {
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2531 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2593 = false;
    float _2679 = _2505;
    float _2681 = _2523;
    float _2683 = _2499;
    float _2685 = _2517;
    float _2687 = _2511;
    float _2689 = _2531;
    float _2691 = fma(_2485, -0.5, 0.5);
    float _2693 = precise::clamp(_2691, 0.0, 1.0);
    float _2695 = -_2679;
    float _2697 = _2695 + _2681;
    float _2699 = _2493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2701 = -_2683;
    float _2703 = _2701 + _2685;
    out.m_88.x = 0.0;
    float _2705 = fma(_2693, _2697, _2679);
    float _2707 = fma(_2693, _2703, _2683);
    out.m_59.x = _2699;
    float _2709 = -_2687;
    float _2711 = _2709 + _2689;
    float _2713 = _2705 * 0.586610972881317138671875;
    bool _2715 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2717 = fma(_2693, _2711, _2687);
    float _2719 = fma(_2707, 0.298911988735198974609375, _2713);
    bool _2721 = _1537 > 0.0;
    bool _2723 = isnan(_1537);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(0.0);
    bool _2729 = _2725 || _2727;
    float _2731 = fma(_2717, 0.114477999508380889892578125, _2719);
    bool _2733 = _1599 <= 0.0;
    bool _2735 = !_2729;
    bool _2737 = _2733 || _2735;
    float _2739 = -_2731;
    float _2741 = _2707 + _2739;
    float _2743 = -_2731;
    float _2745 = _2705 + _2743;
    float _2747 = -_2731;
    float _2749 = _2717 + _2747;
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2755 = fma(_2749, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    bool _2757 = !_2715;
    if (!_2757)
    {
        float _2759 = -_1266;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2763 = -_1268;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2767 = -_1270;
        float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2771 = _2761 * _2761;
        float _2773 = fma(_2765, _2765, _2771);
        float _2775 = fma(_2769, _2769, _2773);
        float _2777 = sqrt(_2775);
        float _2779 = rsqrt(_2775);
        float _2781 = -_2777;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2785 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = _2765 * _2779;
        float _2791 = _2761 * _2779;
        float _2793 = abs(_2787);
        float _2795 = log2(_2793);
        float _2797 = _2769 * _2779;
        float _2799 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2801 = _2485 * _2791;
        float _2803 = -_2791;
        float _2805 = -_2799;
        float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2805);
        float _2809 = fma(_2447, _2789, _2801);
        float _2811 = -_2797;
        float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2807);
        float _2815 = fma(_2389, _2797, _2809);
        float _2817 = precise::clamp(_2815, 0.0, 1.0);
        float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2821 = _2813 + _2819;
        float _2823 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2827 = precise::clamp(_2825, 0.0, 1.0);
        float _2829 = exp2(_2823);
        float _2831 = _2829 * _2827;
        float _2833 = _2817 * _2831;
        float _2835 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2837 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2835;
        out.m_88.y = _2837;
        out.m_88.z = _2839;
    }
    out.m_90.x = _2751;
    out.m_90.y = _2753;
    out.m_90.z = _2755;
    if (!_2737)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2841 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2841;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2593 = false;
    bool _556 = false;
    bool _343 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2898 = as_type<float>(_125);
        out.gl_Position.z = _2898;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_109);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _119;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_161);
        out.gl_Position.z = _2966;
    }
    if (_155)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_66.x;
    float _167 = in.m_66.y;
    float _169 = in.m_66.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _209 = _201;
    float _227;
    if (!_207)
    {
        float _211 = in.m_68.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = in.m_68.x;
    float _241 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _237 + _243;
    bool _247 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_237);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -_257;
    float _265 = _263 + 1.0;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = 1.0 / _261;
    float _271 = _241 * _239;
    float _273 = _245 * _269;
    bool _275 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_237);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = trunc(_271);
    int _297 = int(_295);
    float _299 = _285 * _265;
    float _301 = fma(_289, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_293, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = -_285;
    float _307 = _305 + 1.0;
    float _309 = _301 * _299;
    float _311 = _303 * _299;
    float _313 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    int _321 = _297 << 4;
    int _323 = _321 + 1712;
    bool _325 = !_267;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _239 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_109);
        float _347 = 1.0 / _345;
        float _349 = _143 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    uint _354 = uint(int(uint(_323) >> uint(2)));
    uint _356 = uint(int(uint(int(_354)) >> uint(2)));
    int _358 = int(_354) & 3;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[int(_356)][_358];
    int _362 = int(_354) + 1;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    int _366 = _362 & 3;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[int(_364)][_366];
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _378 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _380 = isnan(_351);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    int _390 = _323 + 8;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    uint _394 = uint(int(uint(int(_392)) >> uint(2)));
    int _396 = int(_392) & 3;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[int(_394)][_396];
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _404 = 1.0 / _372;
    bool _406 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_351);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    float _422 = -_388;
    float _424 = _422 + 1.0;
    bool _426 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _428 = isnan(_351);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _442 = _416 * _424;
    float _444 = 1.0 / _376;
    float _446 = -_416;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = _351 + _450;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _456 = _436 * _448;
    float _458 = -_436;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _402;
    float _464 = _420 * _404;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _351 + _466;
    float _470 = fma(_464, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _472;
    float _476 = _440 * _444;
    bool _478 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = isnan(_351);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = _470 * _456;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _351 + _492;
    float _496 = fma(_476, _452, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _498 = -_488;
    float _500 = _498 + 1.0;
    float _502 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _504 = _474 * _462;
    float _506 = _388 * _500;
    float _508 = fma(_496, _442, _502);
    float _510 = fma(_504, _494, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _512 = _360 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _514 = _368 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = fma(_510, _506, _508);
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[118].x, _516);
    float _524 = in.m_70.x;
    float _526 = in.m_70.y;
    float _528 = _398 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _530 = _522 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _518;
    out.m_72.y = _520;
    out.m_72.z = _532;
    out.m_72.w = _530;
    float _534 = _319 * _526;
    float _536 = _317 * _524;
    bool _538 = !_454;
    float _554;
    if (!_538)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _542 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_109);
        float _560 = 1.0 / _558;
        float _562 = _143 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = in.m_56.x;
    float _568 = in.m_56.y;
    float _570 = in.m_56.z;
    float _572 = _568 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[4].x, _572);
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[6].x, _574);
    float _580 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
    float _582 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
    float _584 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _586 = _582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _588 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _590 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _592 = floor(_588);
    float _594 = floor(_590);
    float _596 = -_592;
    float _598 = _588 + _596;
    float _600 = -_594;
    float _602 = _590 + _600;
    float2 _3684 = float2(_598, _602);
    float _604 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3684, float2(0.0), isnan(_3684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3684, float2(0.0), isnan(_3684)), level(0.0)).x;
    float _606 = _568 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _608 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[5].x, _606);
    float _612 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    float _614 = _612 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _616 = _614 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _618 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[11].x, _616);
    float _620 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].z, _618);
    float _622 = _614 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _624 = _620 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _626 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[10].x, _622);
    float _628 = 1.0 / _624;
    float _630 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].z, _626);
    float _632 = _630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _634 = _632 + _624;
    float _636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _638 = _634 * _628;
    float _640 = _638 * 0.5;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _646 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[30].w, _644);
    float _648 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _650 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = _608 * _642;
    float _654 = 1.0 / _646;
    float _656 = _614 + _648;
    float _658 = _650 * _636;
    float _660 = _652 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _662 = _652 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _664 = _656 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _666 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _660);
    float _670 = _656 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _672 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[127].x, _664);
    float _674 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _668);
    float _676 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[126].x, _670);
    float _678 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _662);
    float _680 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[127].z, _672);
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _684 = _654 * _682;
    float _686 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[126].z, _676);
    float _688 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
    float _690 = _680 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _692 = _674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _694 = _684 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _696 = _686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _698 = _684 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _700 = _688 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _702 = !_694;
    int _704 = _702 ? 0 : 1;
    float _706 = trunc(_696);
    int _708 = int(_706);
    float _710 = _586 + _692;
    float _712 = _584 + _700;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _710 + _714;
    int _718 = 2;
    int _720 = as_type<int>(_712);
    int _722 = as_type<int>(_710);
    float _724 = _652;
    float _726 = _696;
    float _728 = _690;
    if (!_694)
    {
        _718 = 1;
    }
    int _730 = _718;
    float _732 = trunc(_690);
    int _734 = int(_732);
    int _736 = _730;
    if (!_698)
    {
        _736 = _704;
    }
    int _738 = _736;
    float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _742 = _712 + _740;
    float _744 = _716 * _716;
    int _746 = _738 << 6;
    float _748 = fma(_742, _742, _744);
    int _750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _752 = _708 + _750;
    int _754 = _752 + 1;
    int _756 = _746 + 48;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    uint _760 = uint(int(uint(int(_758)) >> uint(2)));
    int _762 = int(_758) & 3;
    float _764 = (*spvDescriptorSet0.vp_c15)._m0[int(_760)][_762];
    int _766 = int(_758) + 1;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    int _770 = _766 & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    float _774 = sqrt(_748);
    bool _776 = _754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _778 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _780 = _734 + _778;
    int _782 = _780 + 1;
    int _784 = _746 + 56;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    float _802 = _652 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _804 = _754 | _782;
    float _806 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _802);
    bool _808 = _804 < 0;
    bool _810 = _808 || _776;
    int _812 = _746 + 64;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    float _830 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _806);
    bool _832 = _782 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _834 = _832 || _810;
    bool _836 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _830 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _840 = _746 + 72;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.vp_c15)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.vp_c15)._m0[int(_852)][_854];
    float _858 = _614 + _838;
    int _860 = _746 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    int _878 = _804;
    float _880 = as_type<float>(_782);
    float _882 = as_type<float>(_754);
    int _884 = as_type<int>(_830);
    float _886 = _802;
    float _888 = _748;
    float _890 = as_type<float>(_738);
    float _892 = as_type<float>(_746);
    if (!_834)
    {
        int _894 = _782 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _896 = _894 + _754;
        _878 = _896;
    }
    int _898 = _878;
    float _900 = as_type<float>(_898);
    if (!_836)
    {
        _880 = _712;
    }
    float _902 = _880;
    float _904 = _902;
    if (!_836)
    {
        _882 = _710;
    }
    float _906 = _882;
    float _908 = _906;
    if (!_834)
    {
        int _910 = _898 << 2;
        _884 = _910;
    }
    int _912 = _884;
    int _914 = _746 + 104;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    if (!_834)
    {
        uint _932 = uint(int(uint(_898) >> uint(2)));
        _720 = int(_932);
    }
    int _934 = _720;
    if (!_834)
    {
        int _936 = 12 & _912;
        _722 = _936;
    }
    int _938 = _722;
    if (!_836)
    {
        _886 = _858;
    }
    float _940 = _886;
    bool _942 = !_836;
    float _944 = _940;
    float _946 = _876;
    if (!_942)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _774 + _950;
        float _954 = rsqrt(_748);
        float _956 = _952 * _948;
        float _958 = _858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_858, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_742, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_716, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _944 = _976;
        _904 = _980;
        _908 = _982;
        _888 = _954;
        _724 = _972;
    }
    float _984 = _944;
    float _986 = _904;
    float _988 = _908;
    float _990 = _888;
    float _992 = _724;
    float _994 = _990;
    float _996 = _992;
    float _998 = _986;
    float _1000 = _984;
    float _1002 = _988;
    if (!_834)
    {
        int _1004 = _934 << 4;
        int _1006 = _1004 + _938;
        _994 = as_type<float>(_1006);
    }
    float _1008 = _994;
    float _1010 = -_614;
    float _1012 = _1010 + _984;
    int _1014 = _746 + 80;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    float _1032 = -_584;
    float _1034 = _1032 + _986;
    float _1036 = -_586;
    float _1038 = _1036 + _988;
    float _1040 = _1012 * _1012;
    float _1042 = _656 * _876;
    float _1044 = _1038;
    float _1046 = _1040;
    if (!_834)
    {
        float _1048 = floor(_696);
        _996 = _1048;
    }
    float _1050 = _996;
    float _1052 = _656 * _828;
    float _1054 = fma(_1034, _1034, _1040);
    int _1056 = _746 + 88;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
    int _1062 = int(_1058) & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = int(_1058) + 1;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    int _1070 = _1066 & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    float _1074 = fma(_584, _868, _1042);
    float _1076 = fma(_584, _820, _1052);
    float _1078 = fma(_1038, _1038, _1054);
    float _1080 = fma(_586, _922, _1074);
    float _1082 = _656 * _772;
    float _1084 = sqrt(_1078);
    float _1086 = _1008;
    float _1088 = _1082;
    float _1090 = _1050;
    if (!_834)
    {
        int _1092 = as_type<int>(_1008) + 400;
        uint _1094 = uint(int(uint(_1092) >> uint(2)));
        uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
        int _1098 = int(_1094) & 3;
        float _1100 = (*spvDescriptorSet0.vp_c15)._m0[int(_1096)][_1098];
        _1086 = _1100;
    }
    float _1102 = _1086;
    float _1104 = _1080 + _930;
    float _1106 = fma(_584, _764, _1082);
    bool _1108 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1110 = isnan(0.5);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_586, _792, _1106);
    float _1120 = _922;
    float _1122 = _1102;
    if (!_834)
    {
        float _1124 = floor(_690);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = fma(_586, _848, _1076);
    float _1130 = _1118 + _800;
    float _1132 = _1128 + _856;
    bool _1134 = _1084 > 0.0;
    float _1136 = 1.0 / _1104;
    bool _1138 = !_1134;
    if (!_1138)
    {
        float _1140 = _203 * _203;
        float _1142 = fma(_201, _201, _1140);
        float _1144 = rsqrt(_1078);
        float _1146 = fma(_205, _205, _1142);
        float _1148 = sqrt(_1146);
        float _1150 = _1034 * _1144;
        float _1152 = _1012 * _1144;
        float _1154 = _1038 * _1144;
        bool _1156 = _1148 > 0.0;
        bool _1158 = !_1156;
        _946 = _1150;
        _1044 = _1154;
        if (!_1158)
        {
            float _1160 = rsqrt(_1146);
            float _1162 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1164 = _203 * _1160;
            float _1166 = _201 * _1160;
            float _1168 = _205 * _1160;
            float _1170 = _1152 * _1164;
            float _1172 = fma(_1150, _1166, _1170);
            float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1176 = fma(_1154, _1168, _1172);
            float _1178 = _1176 * _1174;
            float _1180 = fma(_201, _1178, _986);
            float _1182 = fma(_203, _1178, _984);
            float _1184 = fma(_205, _1178, _988);
            _998 = _1180;
            _1000 = _1182;
            _1002 = _1184;
            _1088 = _1174;
        }
    }
    float _1186 = _998;
    float _1188 = _1000;
    float _1190 = _1002;
    float _1192 = _946;
    float _1194 = _1088;
    float _1196 = _1044;
    float _1198 = _1194;
    float _1200 = _1192;
    float _1202 = _1196;
    if (_1116)
    {
        _1198 = _1186;
    }
    float _1204 = _1198;
    float _1206 = _1204;
    if (_1116)
    {
        _1200 = _1188;
    }
    float _1208 = _1200;
    float _1210 = _1208;
    if (_1116)
    {
        _209 = _1190;
    }
    float _1212 = _209;
    float _1214 = _1212;
    if (!_1116)
    {
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1218 = _614 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1222 = _584 + _1220;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1226 = -_614;
        float _1228 = _1226 + _1188;
        float _1230 = _1218 * _1218;
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1234 = _586 + _1232;
        float _1236 = -_584;
        float _1238 = _1236 + _1186;
        float _1240 = -_586;
        float _1242 = _1240 + _1190;
        float _1244 = fma(_1222, _1222, _1230);
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1248 = fma(_1234, _1234, _1244);
        float _1250 = sqrt(_1248);
        float _1252 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1254 = precise::min(_1250, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1256 = _1254 * _1246;
        float _1258 = _1252 * _1256;
        float _1260 = fma(_1228, _1258, _614);
        float _1262 = fma(_1238, _1258, _584);
        float _1264 = fma(_1242, _1258, _586);
        _1210 = _1260;
        _1206 = _1262;
        _1214 = _1264;
    }
    float _1266 = _1210;
    float _1268 = _1206;
    float _1270 = _1214;
    float _1272 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1278 = _1130 * _1136;
    float _1280 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1272);
    float _1282 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1274);
    float _1284 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1276);
    float _1286 = _1132 * _1136;
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1280);
    float _1290 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1282);
    bool _1292 = _1278 >= 0.0;
    float _1294 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1296 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1284);
    float _1298 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1300 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1302 = _1278 <= 1.0;
    bool _1304 = _1302 && _1292;
    float _1306 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1294);
    float _1308 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1312 = _1286 >= 0.0;
    bool _1314 = _1312 && _1304;
    float _1316 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1306);
    float _1318 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1320 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1310);
    float _1322 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1324 = _1286 <= 1.0;
    bool _1326 = _1324 && _1314;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1330 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1320);
    float _1332 = -_1322;
    float _1334 = fma(_1332, _1318, 1.0);
    float _1336 = _656 * _1030;
    float _1338 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1340 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1330);
    float _1342 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1344 = fma(_584, _1022, _1336);
    float _1346 = log2(_1334);
    float _1348 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1338);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1342);
    float _1352 = fma(_586, _1064, _1344);
    if (_1326)
    {
        float _1354 = float(_738);
        _890 = _1354;
    }
    float _1356 = _890;
    float _1358 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1348);
    float _1360 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1362 = _1352 + _1072;
    float _1364 = 1.0 / _1340;
    float _1366 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1368 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1370 = _1356;
    float _1372 = _1368;
    if (!_834)
    {
        float _1374 = -_1050;
        float _1376 = _696 + _1374;
        _726 = _1376;
    }
    float _1378 = _726;
    float _1380 = _1362 * _1136;
    float _1382 = _614;
    float _1384 = _1378;
    if (!_834)
    {
        float _1386 = rint(_1102);
        float _1388 = precise::max(_1386, 0.0);
        uint _1390 = uint(_1388);
        uint _1392 = clamp(_1390, 0u, 65535u);
        _1382 = as_type<float>(_1392);
    }
    float _1394 = _1382;
    float _1396 = _1346 * 0.693147182464599609375;
    float _1398 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1400 = _1342;
    if (_1326)
    {
        float _1402 = rint(_1356);
        float _1404 = precise::max(_1402, 0.0);
        uint _1406 = uint(_1404);
        uint _1408 = clamp(_1406, 0u, 65535u);
        _1400 = as_type<float>(_1408);
    }
    float _1410 = _1400;
    float _1412 = _1366 * _1364;
    if (!_834)
    {
        float _1414 = -_1126;
        float _1416 = _690 + _1414;
        _1122 = _1416;
    }
    float _1418 = _1122;
    float _1420 = _1368 * _1364;
    float _1422 = fma(_1412, 0.5, 0.5);
    float _1424 = fma(_1420, -0.5, 0.5);
    float _1426 = _1418;
    float _1428 = _1394;
    if (!_834)
    {
        float3 _5056 = float3(_1378, _1418, float(as_type<int>(_1394)));
        float3 _5060 = select(_5056, float3(0.0), isnan(_5056));
        float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5060.xy, uint(rint(_5060.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5060.xy, uint(rint(_5060.z)), level(0.0)).x;
        _1426 = _1430;
    }
    float _1432 = _1426;
    float _1434 = _1286;
    if (_1326)
    {
        float3 _5075 = float3(_1278, _1286, float(as_type<int>(_1410)));
        float3 _5077 = select(_5075, float3(0.0), isnan(_5075));
        float _1436 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5077.xy, uint(rint(_5077.z)), _1380, level(0.0));
        _1434 = _1436;
    }
    float _1438 = _1434;
    float3 _5087 = float3(_1422, _1424, _1398);
    float _1440 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5087, float3(0.0), isnan(_5087)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5087, float3(0.0), isnan(_5087)), level(0.0)).x;
    float3 _5096 = float3(_1422, _1424, _1398);
    float4 _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5096, float3(0.0), isnan(_5096)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5096, float3(0.0), isnan(_5096)), level(0.0)).xyzw;
    float _1445 = _1443.x;
    float _1447 = _1443.y;
    float _1449 = _1443.z;
    float _1451 = _1443.w;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1461 = _1457 || _1459;
    if (_834)
    {
        _1090 = 1.0;
    }
    float _1463 = _1090;
    float _1465 = _1463;
    if (_1461)
    {
        _728 = 1.0;
    }
    float _1467 = _728;
    float _1469 = _1467;
    if (_1461)
    {
        _1370 = 1.0;
    }
    float _1471 = _1370;
    float _1473 = _1471;
    float _1475 = _1438;
    float _1477 = _1447;
    float _1479 = _1445;
    float _1481 = _1451;
    float _1483 = _1449;
    if (!_1461)
    {
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1487 = _1485 * 0.15915493667125701904296875;
        float _1489 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1491 = _1487 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1493;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1515 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1513;
        float _1517 = _1505 * _1507;
        float _1519 = 1.0 / _1515;
        float _1521 = 1.0 / _1517;
        float _1523 = _1511 * _1521;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1527 = fma(_684, _1523, _1525);
        float _1529 = _1527 * _1519;
        float _1531 = precise::clamp(_1529, 0.0, 1.0);
        _1428 = _1493;
        _1384 = _1519;
        _1473 = _1531;
    }
    float _1533 = _1428;
    float _1535 = _1384;
    float _1537 = _1473;
    float _1539 = _1533;
    float _1541 = _1535;
    if (!_1461)
    {
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = _1545 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 0.15915493667125701904296875;
        float _1555 = _1545 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = 1.0 / _1551;
        float _1561 = _1553 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = _1557 * _1559;
        float _1567 = _1553 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1563 * _1565;
        float _1573 = 1.0 / _1571;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1577 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1575;
        float _1579 = 1.0 / _1577;
        float _1581 = _1569 * _1573;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1585 = fma(_684, _1581, _1583);
        float _1587 = _1585 * _1579;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        float _1591 = -_1589;
        float _1593 = _1591 + 1.0;
        _1539 = _1553;
        _1541 = _1573;
        _1469 = _1593;
    }
    float _1595 = _1539;
    float _1597 = _1541;
    float _1599 = _1469;
    float _1601 = _1597;
    float _1603 = _1595;
    if (!_834)
    {
        int _1605 = _898 << 4;
        int _1607 = _1605 + 2048;
        uint _1609 = uint(int(uint(_1607) >> uint(2)));
        uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
        int _1613 = int(_1609) & 3;
        float _1615 = (*spvDescriptorSet0.vp_c15)._m0[int(_1611)][_1613];
        int _1617 = int(_1609) + 1;
        uint _1619 = uint(int(uint(_1617) >> uint(2)));
        int _1621 = _1617 & 3;
        float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
        int _1625 = _1607 + 8;
        uint _1627 = uint(int(uint(_1625) >> uint(2)));
        uint _1629 = uint(int(uint(int(_1627)) >> uint(2)));
        int _1631 = int(_1627) & 3;
        float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
        int _1635 = int(_1627) + 1;
        uint _1637 = uint(int(uint(_1635) >> uint(2)));
        int _1639 = _1635 & 3;
        float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
        float _1643 = _656 * _1623;
        float _1645 = fma(_584, _1615, _1643);
        float _1647 = fma(_586, _1633, _1645);
        float _1649 = _1647 + _1641;
        float _1651 = precise::clamp(_1649, 0.0, 1.0);
        float _1653 = -_1651;
        float _1655 = _1653 + _1432;
        float _1657 = fma(_1655, 500.0, 1.5);
        float _1659 = exp2(_1657);
        float _1661 = 0.0 + _1659;
        float _1663 = precise::clamp(_1661, 0.0, 1.0);
        _1601 = _1641;
        _1603 = _1633;
        _900 = as_type<float>(_1607);
        _1465 = _1663;
    }
    float _1665 = _1601;
    float _1667 = _1603;
    float _1669 = _900;
    float _1671 = _1465;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1675 = _1266 + _1673;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1679 = _1268 + _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1683 = _1270 + _1681;
    float _1685 = _1675 * _1675;
    float _1687 = fma(_1679, _1679, _1685);
    float _1689 = fma(_1683, _1683, _1687);
    float _1691 = rsqrt(_1689);
    float _1693 = sqrt(_1689);
    float _1695 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1697 = _1679 * _1695;
    float _1699 = _1683 * _1695;
    float _1701 = _1697 * _1697;
    float _1703 = _1699 * _1699;
    float _1705 = _1701 + _1703;
    float _1707 = sqrt(_1705);
    bool _1709 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1713 = _1707 + _1711;
    float _1715 = _1691;
    float _1717 = _1667;
    float _1719 = _1713;
    float _1721 = _1665;
    float _1723 = _1675;
    float _1725 = _1669;
    float _1727 = _1705;
    if (_1709)
    {
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1715 = _1729;
    }
    float _1731 = _1715;
    if (_1709)
    {
        float _1733 = rsqrt(_1705);
        _1717 = _1733;
    }
    float _1735 = _1717;
    float _1737 = _1735;
    if (_1709)
    {
        float _1739 = _1713 * _1731;
        _1719 = _1739;
    }
    float _1741 = _1719;
    if (_1709)
    {
        float _1743 = _1741 * 0.15915493667125701904296875;
        _1721 = _1743;
    }
    float _1745 = _1721;
    float _1747 = _1683;
    if (_1709)
    {
        float _1749 = _1745 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        _1747 = _1751;
    }
    float _1753 = _1747;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1757 = precise::max(0.0, _1755);
    float _1759 = _1731;
    float _1761 = _1757;
    if (_1709)
    {
        float _1763 = _1745 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        _1759 = _1765;
    }
    float _1767 = _1759;
    float _1769 = -_1695;
    float _1771 = -_1757;
    float _1773 = fma(_1675, _1769, _1771);
    if (_1709)
    {
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1775;
    }
    float _1777 = _1723;
    float _1779 = _1777;
    float _1781 = _1753;
    if (_1709)
    {
        float _1783 = fma(_1753, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    if (!_1709)
    {
        _1781 = _1697;
    }
    float _1789 = _1781;
    float _1791 = _1789;
    float _1793 = _1767;
    if (_1709)
    {
        float _1795 = _1767 + (-1.0);
        _1761 = _1795;
    }
    float _1797 = _1761;
    float _1799 = _1797;
    if (_1709)
    {
        float _1801 = _1735 * _1785;
        _1202 = _1801;
    }
    float _1803 = _1202;
    if (!_1709)
    {
        _1787 = _1773;
    }
    float _1805 = _1787;
    float _1807 = _1805;
    if (_1709)
    {
        float _1809 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1809;
    }
    float _1811 = _1725;
    if (_1709)
    {
        float _1813 = _1697 * _1803;
        _1791 = _1813;
    }
    float _1815 = _1791;
    if (!_1709)
    {
        _1799 = _1699;
    }
    float _1817 = _1799;
    float _1819 = _1817;
    if (_1709)
    {
        float _1821 = _1699 * _1803;
        _1819 = _1821;
    }
    float _1823 = _1819;
    if (!_1709)
    {
        _1737 = _1701;
    }
    float _1825 = _1737;
    float _1827 = _1825;
    if (_1709)
    {
        float _1829 = fma(_1773, _1767, _1811);
        _1807 = _1829;
    }
    float _1831 = _1807;
    if (_1709)
    {
        float _1833 = _1815 * _1815;
        _1827 = _1833;
    }
    float _1835 = _1827;
    if (!_1709)
    {
        _1793 = _1703;
    }
    float _1837 = _1793;
    float _1839 = _1837;
    if (_1709)
    {
        float _1841 = _1823 * _1823;
        _1839 = _1841;
    }
    float _1843 = _1839;
    float _1845 = fma(_1831, _1831, _1835);
    float _1847 = _1845 + _1843;
    float _1849 = rsqrt(_1847);
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1853 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1851);
    float _1855 = precise::clamp(_1853, 0.0, 1.0);
    float _1857 = -_1855;
    float _1859 = _1857 + 1.0;
    float _1861 = abs(_1859);
    float _1863 = log2(_1861);
    float _1865 = _1849 * _1815;
    float _1867 = _1849 * _1831;
    float _1869 = _1849 * _1823;
    float _1871 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1873 = -_1871;
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1873);
    float _1877 = -_1869;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1875);
    float _1881 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1883 = fma(_1879, -0.5, 0.5);
    float _1885 = fma(_1879, 0.5, 0.5);
    float _1887 = exp2(_1881);
    float _1889 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1885, _1889, -0.212114393711090087890625);
    float _1893 = _1867 + 1.0;
    float _1895 = sqrt(_1883);
    float _1897 = fma(_1885, _1891, 1.570728778839111328125);
    float _1899 = -_1867;
    float _1901 = fma(_1887, _1893, _1899);
    float _1903 = fma(_1901, 0.5, 0.5);
    float _1905 = _1895 * 0.636619746685028076171875;
    float _1907 = -_1897;
    float _1909 = fma(_1905, _1907, 1.0);
    float2 _5761 = float2(_1909, _1903);
    float3 _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).xyz;
    float _1915 = _1913.x;
    float _1917 = _1913.y;
    float _1919 = _1913.z;
    float _1921 = in.m_68.z;
    float _1923 = in.m_68.w;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1927 = _564 + _1925;
    float _1929 = in.m_68.y;
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1933 = _1931 != 0;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1937 = _564 + _1935;
    float _1939 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1943 = _1941 != 0;
    float _1945 = -_604;
    float _1947 = _1945 + 1.0;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1953 = exp2(_1939);
    bool _1955 = _239 > 0.5;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1961 = _1803;
    if (!_1933)
    {
        float _1963 = in.m_68.z;
        _1961 = _1963;
    }
    float _1965 = _1961;
    if (_1933)
    {
        _1046 = _239;
    }
    float _1967 = _1046;
    float _1969 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1971 = -_189;
    int _1973 = _1955 ? as_type<int>(_1971) : as_type<int>(_189);
    float _1975 = 1.0 / _1951;
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1981 = _1923 > 0.5;
    bool _1983 = _1921 > 0.5;
    float _1985 = -_199;
    int _1987 = _1981 ? as_type<int>(_1985) : as_type<int>(_199);
    bool _1989 = _1929 > 0.5;
    float _1991 = 1.0 / _1959;
    float _1993 = _1967;
    float _1995 = _1921;
    if (!_1933)
    {
        _1993 = _1921;
    }
    float _1997 = _1993;
    float _1999 = -_189;
    int _2001 = _1989 ? as_type<int>(_1999) : as_type<int>(_189);
    if (!_1933)
    {
        _1995 = _1929;
    }
    float _2003 = _1995;
    bool _2005 = !_1943;
    float _2007 = _2005 ? _189 : as_type<float>(_2001);
    float _2009 = 1.0 / _1979;
    int _2011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2013 = _2011 != 0;
    float _2015 = -_189;
    int _2017 = _1983 ? as_type<int>(_2015) : as_type<int>(_189);
    float _2019 = _2003;
    if (!_1933)
    {
        _892 = _2003;
    }
    float _2021 = _892;
    float _2023 = _2021;
    if (_1933)
    {
        _2019 = _1929;
    }
    float _2025 = _2019;
    bool _2027 = !_2013;
    float _2029 = _2027 ? _189 : as_type<float>(_2017);
    float _2031 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1969);
    float _2033 = _1965;
    float _2035 = _2025;
    if (!_1933)
    {
        _1727 = _1965;
    }
    float _2037 = _1727;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2031);
    float _2045 = _2037;
    if (_1933)
    {
        _2045 = _2025;
    }
    float _2047 = _2045;
    if (_1933)
    {
        _2033 = _2025;
    }
    float _2049 = _2033;
    float _2051 = -_2043;
    float _2053 = _2051 + 1.0;
    if (_1933)
    {
        _2023 = _239;
    }
    float _2055 = _2023;
    if (!_1933)
    {
        _2035 = _239;
    }
    float _2057 = _2035;
    float _2059 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2067 = _2065 != 0;
    float _2069 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2073 = _2071 != 0;
    bool _2075 = !_2041;
    float _2077 = _2075 ? _189 : as_type<float>(_1973);
    float _2079 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2081 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2083 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2087;
    float _2091 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2081);
    float _2093 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2083);
    float _2095 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2085);
    float _2097 = _2089 * _1975;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2099;
    bool _2103 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2105 = isnan(_564);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2121 = _564 + _2119;
    float _2123 = _2101 * _1991;
    bool _2125 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2127 = isnan(_564);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = -_2113;
    float _2139 = _2137 + 1.0;
    bool _2141 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2143 = isnan(_564);
    bool _2145 = _2141 || _2143;
    bool _2147 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2149 = _2145 || _2147;
    float _2151 = float(_2149);
    float _2153 = _2117 * _2009;
    float _2155 = fma(_2097, _2121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2157 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2159 = isnan(_564);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2135 * _2139;
    float _2171 = -_2135;
    float _2173 = _2171 + 1.0;
    float _2175 = -_2151;
    float _2177 = _2175 + 1.0;
    float _2179 = fma(_2123, _1927, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2181 = _2151 * _2173;
    float _2183 = _2167 * _2177;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2187 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2189 = fma(_2153, _1937, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2191 = _2155 * _2183;
    float _2193 = -_2185;
    float _2195 = fma(_2187, 2.0, _2193);
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2199 = -_2167;
    float _2201 = _2199 + 1.0;
    float _2203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2205 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2197);
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2209 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2191);
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2213 = -_199;
    int _2215 = _1983 ? as_type<int>(_2213) : as_type<int>(_199);
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2219 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2207);
    float _2221 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2225 = fma(_2189, _2181, _2209);
    float _2227 = -_2217;
    float _2229 = fma(_2221, 2.0, _2227);
    float _2231 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2211);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2235 = -_199;
    int _2237 = _1989 ? as_type<int>(_2235) : as_type<int>(_199);
    float _2239 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2241 = !_2063;
    float _2243 = _2241 ? _199 : as_type<float>(_1987);
    float _2245 = fma(_2179, _2169, _2225);
    bool _2247 = !_2067;
    float _2249 = _2247 ? _199 : as_type<float>(_2215);
    float _2251 = fma(_2239, -2.0, _2233);
    bool _2253 = !_2073;
    float _2255 = _2253 ? _199 : as_type<float>(_2237);
    float _2257 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2259 = -_143;
    float _2261 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2195);
    float _2263 = _2007 + 0.5;
    float _2265 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2267 = _2029 + 0.5;
    float _2269 = -_143;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2229);
    float _2273 = fma(_2257, _2263, _2261);
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2277 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2205);
    float _2279 = fma(_2265, _2267, _2271);
    float _2281 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2251);
    float _2283 = fma(_2069, -2.0, _2275);
    float _2285 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2219);
    float _2287 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2231);
    float _2289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2291 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2283);
    float _2293 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2245);
    float _2295 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2297 = _2077 + 0.5;
    float _2299 = _2243 + (-0.5);
    float _2301 = -_2255;
    float _2303 = _2301 + 0.5;
    float _2305 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2295);
    float _2307 = abs(_684);
    float _2309 = log2(_2307);
    float _2311 = _2297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2313 = -_2287;
    float _2315 = _2313 + 1.0;
    float _2317 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2319 = -_2053;
    float _2321 = fma(_2007, _2319, _2273);
    float _2323 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2305);
    float _2325 = _2249 + (-0.5);
    float _2327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2329 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2331 = _684 <= 8000.0;
    bool _2333 = isnan(_684);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(8000.0);
    bool _2339 = _2335 || _2337;
    float _2341 = float(_2339);
    float _2343 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2323);
    float _2345 = -_2277;
    float _2347 = _2345 + 1.0;
    float _2349 = -_2329;
    float _2351 = -_2281;
    float _2353 = fma(_2349, _2299, _2351);
    float _2355 = _2343 + _1340;
    float _2357 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2361 = fma(_2243, _2315, _2353);
    out.gl_Position.x = _1366;
    out.gl_Position.y = _1368;
    out.gl_Position.z = _2343;
    out.gl_Position.w = _1340;
    float _2363 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2365 = _2355 * 0.5;
    float _2367 = _2311 * _2327;
    float _2369 = exp2(_2357);
    float _2371 = -_2285;
    float _2373 = _2371 + 1.0;
    out.m_74.w = _2363;
    float _2375 = -_2373;
    float _2377 = fma(_2029, _2375, _2279);
    float _2379 = _2317 * _2359;
    float _2381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2383 = -_1953;
    float _2385 = _2383 + 1.0;
    if (!_1326)
    {
        _1372 = 1.0;
    }
    float _2387 = _1372;
    float _2389 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_76.x = _2367;
    out.m_76.y = _2379;
    out.m_76.z = _2377;
    out.m_76.w = _2361;
    float _2391 = _2387;
    if (_1326)
    {
        bool _2393 = _1438 >= _1380;
        bool _2395 = isnan(_1438);
        bool _2397 = _2393 || _2395;
        bool _2399 = isnan(_1380);
        bool _2401 = _2397 || _2399;
        float _2403 = float(_2401);
        _2391 = _2403;
    }
    float _2405 = _2391;
    float _2407 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2409 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = _1537 * _1599;
    float _2415 = _2405 * _1671;
    float _2417 = _2407 * _1440;
    float _2419 = -_2407;
    float _2421 = _2419 + 1.0;
    out.m_78.z = _2365;
    out.m_78.w = _1340;
    bool _2423 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2425 = isnan(_1693);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2431 = _2427 || _2429;
    float _2433 = _2381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2435 = fma(_2411, -2.0, 3.0);
    float _2437 = _2411 * _2411;
    float _2439 = -_2433;
    float _2441 = -_2291;
    float _2443 = fma(_2439, _2325, _2441);
    float _2445 = _1451 * _2421;
    float _2447 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2449 = _2437 * _2435;
    float _2451 = fma(_2249, _2347, _2443);
    float _2453 = -_2449;
    float _2455 = _2453 + 1.0;
    float _2457 = _2413;
    if (!_2431)
    {
        _1475 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2459 = _1475;
    out.m_80.x = _2321;
    out.m_80.y = _2451;
    float _2461 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2449);
    float _2463 = _1451 * _2417;
    float _2465 = _2341 * _2461;
    float _2467 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2469 = _1947 * _2467;
    float _2471 = precise::clamp(_2469, 0.0, 1.0);
    float _2473 = -_2471;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2477 = -_2415;
    float _2479 = fma(_2477, _2475, 1.0);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = _2481 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2485 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_82.x = _2483;
    out.m_84.x = _2447;
    out.m_84.y = _2485;
    out.m_84.z = _2389;
    float _2487 = _1919 * _2417;
    float _2489 = fma(_1915, _2463, _1445);
    float _2491 = fma(_1917, _2463, _1447);
    float _2493 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2495 = fma(_1451, _2487, _1449);
    float _2497 = _2459;
    float _2499 = _2459;
    if (!_2431)
    {
        _1477 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2501 = _1477;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2431)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2507 = _1479;
    out.m_86.x = _2489;
    out.m_86.y = _2491;
    out.m_86.z = _2495;
    out.m_86.w = _2445;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2431)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2513 = _1481;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2431)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2519 = _1483;
    float _2521 = _2519;
    float _2523 = _2519;
    if (!_2431)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2525 = _2457;
    bool _2527 = !_2431;
    float _2529 = _2525;
    float _2531 = _2525;
    if (!_2527)
    {
        bool _2533 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2535 = isnan(_1693);
        bool _2537 = _2533 || _2535;
        bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2541 = _2537 || _2539;
        if (!_2541)
        {
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2545 = _1693 + _2543;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2547;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2555 = 1.0 / _2549;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2573 = _2545 * _2555;
            float _2575 = precise::clamp(_2573, 0.0, 1.0);
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2505 = _2583;
            _2523 = _2589;
            _2499 = _2581;
            _2517 = _2587;
            _2511 = _2585;
            _2531 = _2591;
            _2593 = true;
        }
        else
        {
            bool _2595 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2597 = isnan(_1693);
            bool _2599 = _2595 || _2597;
            bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2603 = _2599 || _2601;
            if (!_2603)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2605 = _2497;
            _2499 = _2605;
            if (!_2603)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2607 = _2503;
            _2505 = _2607;
            if (!_2603)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2609 = _2509;
            _2511 = _2609;
            if (!_2603)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2611 = _2515;
            _2517 = _2611;
            if (!_2603)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2613 = _2521;
            _2523 = _2613;
            if (!_2603)
            {
                _2529 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2615 = _2529;
            bool _2617 = !_2603;
            _2531 = _2615;
            if (!_2617)
            {
                bool _2619 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2621 = isnan(_1693);
                bool _2623 = _2619 || _2621;
                bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2627 = _2623 || _2625;
                if (!_2627)
                {
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2631 = _1693 + _2629;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2633;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2641 = 1.0 / _2635;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2659 = _2631 * _2641;
                    float _2661 = precise::clamp(_2659, 0.0, 1.0);
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2667 = fma(_2661, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2669 = fma(_2661, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2671 = fma(_2661, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2673 = fma(_2661, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2675 = fma(_2661, _2653, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2677 = fma(_2661, _2657, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2505 = _2669;
                    _2523 = _2675;
                    _2499 = _2667;
                    _2517 = _2673;
                    _2511 = _2671;
                    _2531 = _2677;
                    _2593 = true;
                }
                else
                {
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2531 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2593 = false;
    float _2679 = _2505;
    float _2681 = _2523;
    float _2683 = _2499;
    float _2685 = _2517;
    float _2687 = _2511;
    float _2689 = _2531;
    float _2691 = fma(_2485, -0.5, 0.5);
    float _2693 = precise::clamp(_2691, 0.0, 1.0);
    float _2695 = -_2679;
    float _2697 = _2695 + _2681;
    float _2699 = _2493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2701 = -_2683;
    float _2703 = _2701 + _2685;
    out.m_88.x = 0.0;
    float _2705 = fma(_2693, _2697, _2679);
    float _2707 = fma(_2693, _2703, _2683);
    out.m_59.x = _2699;
    float _2709 = -_2687;
    float _2711 = _2709 + _2689;
    float _2713 = _2705 * 0.586610972881317138671875;
    bool _2715 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2717 = fma(_2693, _2711, _2687);
    float _2719 = fma(_2707, 0.298911988735198974609375, _2713);
    bool _2721 = _1537 > 0.0;
    bool _2723 = isnan(_1537);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(0.0);
    bool _2729 = _2725 || _2727;
    float _2731 = fma(_2717, 0.114477999508380889892578125, _2719);
    bool _2733 = _1599 <= 0.0;
    bool _2735 = !_2729;
    bool _2737 = _2733 || _2735;
    float _2739 = -_2731;
    float _2741 = _2707 + _2739;
    float _2743 = -_2731;
    float _2745 = _2705 + _2743;
    float _2747 = -_2731;
    float _2749 = _2717 + _2747;
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2755 = fma(_2749, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    bool _2757 = !_2715;
    if (!_2757)
    {
        float _2759 = -_1266;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2763 = -_1268;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2767 = -_1270;
        float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2771 = _2761 * _2761;
        float _2773 = fma(_2765, _2765, _2771);
        float _2775 = fma(_2769, _2769, _2773);
        float _2777 = sqrt(_2775);
        float _2779 = rsqrt(_2775);
        float _2781 = -_2777;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2785 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = _2765 * _2779;
        float _2791 = _2761 * _2779;
        float _2793 = abs(_2787);
        float _2795 = log2(_2793);
        float _2797 = _2769 * _2779;
        float _2799 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2801 = _2485 * _2791;
        float _2803 = -_2791;
        float _2805 = -_2799;
        float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2805);
        float _2809 = fma(_2447, _2789, _2801);
        float _2811 = -_2797;
        float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2807);
        float _2815 = fma(_2389, _2797, _2809);
        float _2817 = precise::clamp(_2815, 0.0, 1.0);
        float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2821 = _2813 + _2819;
        float _2823 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2827 = precise::clamp(_2825, 0.0, 1.0);
        float _2829 = exp2(_2823);
        float _2831 = _2829 * _2827;
        float _2833 = _2817 * _2831;
        float _2835 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2837 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2835;
        out.m_88.y = _2837;
        out.m_88.z = _2839;
    }
    out.m_90.x = _2751;
    out.m_90.y = _2753;
    out.m_90.z = _2755;
    if (!_2737)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2841 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2841;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2593 = false;
    bool _556 = false;
    bool _343 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2898 = as_type<float>(_125);
        out.gl_Position.z = _2898;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_109);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _119;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_161);
        out.gl_Position.z = _2966;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_66.x;
    float _167 = in.m_66.y;
    float _169 = in.m_66.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _209 = _201;
    float _227;
    if (!_207)
    {
        float _211 = in.m_68.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = in.m_68.x;
    float _241 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _237 + _243;
    bool _247 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_237);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -_257;
    float _265 = _263 + 1.0;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = 1.0 / _261;
    float _271 = _241 * _239;
    float _273 = _245 * _269;
    bool _275 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_237);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = trunc(_271);
    int _297 = int(_295);
    float _299 = _285 * _265;
    float _301 = fma(_289, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_293, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = -_285;
    float _307 = _305 + 1.0;
    float _309 = _301 * _299;
    float _311 = _303 * _299;
    float _313 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    int _321 = _297 << 4;
    int _323 = _321 + 1712;
    bool _325 = !_267;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _239 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_109);
        float _347 = 1.0 / _345;
        float _349 = _143 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    uint _354 = uint(int(uint(_323) >> uint(2)));
    uint _356 = uint(int(uint(int(_354)) >> uint(2)));
    int _358 = int(_354) & 3;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[int(_356)][_358];
    int _362 = int(_354) + 1;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    int _366 = _362 & 3;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[int(_364)][_366];
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _378 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _380 = isnan(_351);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    int _390 = _323 + 8;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    uint _394 = uint(int(uint(int(_392)) >> uint(2)));
    int _396 = int(_392) & 3;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[int(_394)][_396];
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _404 = 1.0 / _372;
    bool _406 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_351);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    float _422 = -_388;
    float _424 = _422 + 1.0;
    bool _426 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _428 = isnan(_351);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _442 = _416 * _424;
    float _444 = 1.0 / _376;
    float _446 = -_416;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = _351 + _450;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _456 = _436 * _448;
    float _458 = -_436;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _402;
    float _464 = _420 * _404;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _351 + _466;
    float _470 = fma(_464, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _472;
    float _476 = _440 * _444;
    bool _478 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = isnan(_351);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = _470 * _456;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _351 + _492;
    float _496 = fma(_476, _452, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _498 = -_488;
    float _500 = _498 + 1.0;
    float _502 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _504 = _474 * _462;
    float _506 = _388 * _500;
    float _508 = fma(_496, _442, _502);
    float _510 = fma(_504, _494, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _512 = _360 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _514 = _368 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = fma(_510, _506, _508);
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[118].x, _516);
    float _524 = in.m_70.x;
    float _526 = in.m_70.y;
    float _528 = _398 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _530 = _522 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _518;
    out.m_72.y = _520;
    out.m_72.z = _532;
    out.m_72.w = _530;
    float _534 = _319 * _526;
    float _536 = _317 * _524;
    bool _538 = !_454;
    float _554;
    if (!_538)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _542 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_109);
        float _560 = 1.0 / _558;
        float _562 = _143 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = in.m_56.x;
    float _568 = in.m_56.y;
    float _570 = in.m_56.z;
    float _572 = _568 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[4].x, _572);
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[6].x, _574);
    float _580 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
    float _582 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
    float _584 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _586 = _582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _588 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _590 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _592 = floor(_588);
    float _594 = floor(_590);
    float _596 = -_592;
    float _598 = _588 + _596;
    float _600 = -_594;
    float _602 = _590 + _600;
    float2 _3684 = float2(_598, _602);
    float _604 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3684, float2(0.0), isnan(_3684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3684, float2(0.0), isnan(_3684)), level(0.0)).x;
    float _606 = _568 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _608 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[5].x, _606);
    float _612 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    float _614 = _612 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _616 = _614 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _618 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[11].x, _616);
    float _620 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].z, _618);
    float _622 = _614 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _624 = _620 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _626 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[10].x, _622);
    float _628 = 1.0 / _624;
    float _630 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].z, _626);
    float _632 = _630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _634 = _632 + _624;
    float _636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _638 = _634 * _628;
    float _640 = _638 * 0.5;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _646 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[30].w, _644);
    float _648 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _650 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = _608 * _642;
    float _654 = 1.0 / _646;
    float _656 = _614 + _648;
    float _658 = _650 * _636;
    float _660 = _652 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _662 = _652 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _664 = _656 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _666 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _660);
    float _670 = _656 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _672 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[127].x, _664);
    float _674 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _668);
    float _676 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[126].x, _670);
    float _678 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _662);
    float _680 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[127].z, _672);
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _684 = _654 * _682;
    float _686 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[126].z, _676);
    float _688 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
    float _690 = _680 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _692 = _674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _694 = _684 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _696 = _686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _698 = _684 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _700 = _688 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _702 = !_694;
    int _704 = _702 ? 0 : 1;
    float _706 = trunc(_696);
    int _708 = int(_706);
    float _710 = _586 + _692;
    float _712 = _584 + _700;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _710 + _714;
    int _718 = 2;
    int _720 = as_type<int>(_712);
    int _722 = as_type<int>(_710);
    float _724 = _652;
    float _726 = _696;
    float _728 = _690;
    if (!_694)
    {
        _718 = 1;
    }
    int _730 = _718;
    float _732 = trunc(_690);
    int _734 = int(_732);
    int _736 = _730;
    if (!_698)
    {
        _736 = _704;
    }
    int _738 = _736;
    float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _742 = _712 + _740;
    float _744 = _716 * _716;
    int _746 = _738 << 6;
    float _748 = fma(_742, _742, _744);
    int _750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _752 = _708 + _750;
    int _754 = _752 + 1;
    int _756 = _746 + 48;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    uint _760 = uint(int(uint(int(_758)) >> uint(2)));
    int _762 = int(_758) & 3;
    float _764 = (*spvDescriptorSet0.vp_c15)._m0[int(_760)][_762];
    int _766 = int(_758) + 1;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    int _770 = _766 & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    float _774 = sqrt(_748);
    bool _776 = _754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _778 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _780 = _734 + _778;
    int _782 = _780 + 1;
    int _784 = _746 + 56;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    float _802 = _652 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _804 = _754 | _782;
    float _806 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _802);
    bool _808 = _804 < 0;
    bool _810 = _808 || _776;
    int _812 = _746 + 64;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    float _830 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _806);
    bool _832 = _782 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _834 = _832 || _810;
    bool _836 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _830 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _840 = _746 + 72;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.vp_c15)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.vp_c15)._m0[int(_852)][_854];
    float _858 = _614 + _838;
    int _860 = _746 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    int _878 = _804;
    float _880 = as_type<float>(_782);
    float _882 = as_type<float>(_754);
    int _884 = as_type<int>(_830);
    float _886 = _802;
    float _888 = _748;
    float _890 = as_type<float>(_738);
    float _892 = as_type<float>(_746);
    if (!_834)
    {
        int _894 = _782 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _896 = _894 + _754;
        _878 = _896;
    }
    int _898 = _878;
    float _900 = as_type<float>(_898);
    if (!_836)
    {
        _880 = _712;
    }
    float _902 = _880;
    float _904 = _902;
    if (!_836)
    {
        _882 = _710;
    }
    float _906 = _882;
    float _908 = _906;
    if (!_834)
    {
        int _910 = _898 << 2;
        _884 = _910;
    }
    int _912 = _884;
    int _914 = _746 + 104;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    if (!_834)
    {
        uint _932 = uint(int(uint(_898) >> uint(2)));
        _720 = int(_932);
    }
    int _934 = _720;
    if (!_834)
    {
        int _936 = 12 & _912;
        _722 = _936;
    }
    int _938 = _722;
    if (!_836)
    {
        _886 = _858;
    }
    float _940 = _886;
    bool _942 = !_836;
    float _944 = _940;
    float _946 = _876;
    if (!_942)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _774 + _950;
        float _954 = rsqrt(_748);
        float _956 = _952 * _948;
        float _958 = _858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_858, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_742, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_716, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _944 = _976;
        _904 = _980;
        _908 = _982;
        _888 = _954;
        _724 = _972;
    }
    float _984 = _944;
    float _986 = _904;
    float _988 = _908;
    float _990 = _888;
    float _992 = _724;
    float _994 = _990;
    float _996 = _992;
    float _998 = _986;
    float _1000 = _984;
    float _1002 = _988;
    if (!_834)
    {
        int _1004 = _934 << 4;
        int _1006 = _1004 + _938;
        _994 = as_type<float>(_1006);
    }
    float _1008 = _994;
    float _1010 = -_614;
    float _1012 = _1010 + _984;
    int _1014 = _746 + 80;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    float _1032 = -_584;
    float _1034 = _1032 + _986;
    float _1036 = -_586;
    float _1038 = _1036 + _988;
    float _1040 = _1012 * _1012;
    float _1042 = _656 * _876;
    float _1044 = _1038;
    float _1046 = _1040;
    if (!_834)
    {
        float _1048 = floor(_696);
        _996 = _1048;
    }
    float _1050 = _996;
    float _1052 = _656 * _828;
    float _1054 = fma(_1034, _1034, _1040);
    int _1056 = _746 + 88;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
    int _1062 = int(_1058) & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = int(_1058) + 1;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    int _1070 = _1066 & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    float _1074 = fma(_584, _868, _1042);
    float _1076 = fma(_584, _820, _1052);
    float _1078 = fma(_1038, _1038, _1054);
    float _1080 = fma(_586, _922, _1074);
    float _1082 = _656 * _772;
    float _1084 = sqrt(_1078);
    float _1086 = _1008;
    float _1088 = _1082;
    float _1090 = _1050;
    if (!_834)
    {
        int _1092 = as_type<int>(_1008) + 400;
        uint _1094 = uint(int(uint(_1092) >> uint(2)));
        uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
        int _1098 = int(_1094) & 3;
        float _1100 = (*spvDescriptorSet0.vp_c15)._m0[int(_1096)][_1098];
        _1086 = _1100;
    }
    float _1102 = _1086;
    float _1104 = _1080 + _930;
    float _1106 = fma(_584, _764, _1082);
    bool _1108 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1110 = isnan(0.5);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_586, _792, _1106);
    float _1120 = _922;
    float _1122 = _1102;
    if (!_834)
    {
        float _1124 = floor(_690);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = fma(_586, _848, _1076);
    float _1130 = _1118 + _800;
    float _1132 = _1128 + _856;
    bool _1134 = _1084 > 0.0;
    float _1136 = 1.0 / _1104;
    bool _1138 = !_1134;
    if (!_1138)
    {
        float _1140 = _203 * _203;
        float _1142 = fma(_201, _201, _1140);
        float _1144 = rsqrt(_1078);
        float _1146 = fma(_205, _205, _1142);
        float _1148 = sqrt(_1146);
        float _1150 = _1034 * _1144;
        float _1152 = _1012 * _1144;
        float _1154 = _1038 * _1144;
        bool _1156 = _1148 > 0.0;
        bool _1158 = !_1156;
        _946 = _1150;
        _1044 = _1154;
        if (!_1158)
        {
            float _1160 = rsqrt(_1146);
            float _1162 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1164 = _203 * _1160;
            float _1166 = _201 * _1160;
            float _1168 = _205 * _1160;
            float _1170 = _1152 * _1164;
            float _1172 = fma(_1150, _1166, _1170);
            float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1176 = fma(_1154, _1168, _1172);
            float _1178 = _1176 * _1174;
            float _1180 = fma(_201, _1178, _986);
            float _1182 = fma(_203, _1178, _984);
            float _1184 = fma(_205, _1178, _988);
            _998 = _1180;
            _1000 = _1182;
            _1002 = _1184;
            _1088 = _1174;
        }
    }
    float _1186 = _998;
    float _1188 = _1000;
    float _1190 = _1002;
    float _1192 = _946;
    float _1194 = _1088;
    float _1196 = _1044;
    float _1198 = _1194;
    float _1200 = _1192;
    float _1202 = _1196;
    if (_1116)
    {
        _1198 = _1186;
    }
    float _1204 = _1198;
    float _1206 = _1204;
    if (_1116)
    {
        _1200 = _1188;
    }
    float _1208 = _1200;
    float _1210 = _1208;
    if (_1116)
    {
        _209 = _1190;
    }
    float _1212 = _209;
    float _1214 = _1212;
    if (!_1116)
    {
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1218 = _614 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1222 = _584 + _1220;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1226 = -_614;
        float _1228 = _1226 + _1188;
        float _1230 = _1218 * _1218;
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1234 = _586 + _1232;
        float _1236 = -_584;
        float _1238 = _1236 + _1186;
        float _1240 = -_586;
        float _1242 = _1240 + _1190;
        float _1244 = fma(_1222, _1222, _1230);
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1248 = fma(_1234, _1234, _1244);
        float _1250 = sqrt(_1248);
        float _1252 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1254 = precise::min(_1250, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1256 = _1254 * _1246;
        float _1258 = _1252 * _1256;
        float _1260 = fma(_1228, _1258, _614);
        float _1262 = fma(_1238, _1258, _584);
        float _1264 = fma(_1242, _1258, _586);
        _1210 = _1260;
        _1206 = _1262;
        _1214 = _1264;
    }
    float _1266 = _1210;
    float _1268 = _1206;
    float _1270 = _1214;
    float _1272 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1278 = _1130 * _1136;
    float _1280 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1272);
    float _1282 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1274);
    float _1284 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1276);
    float _1286 = _1132 * _1136;
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1280);
    float _1290 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1282);
    bool _1292 = _1278 >= 0.0;
    float _1294 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1296 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1284);
    float _1298 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1300 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1302 = _1278 <= 1.0;
    bool _1304 = _1302 && _1292;
    float _1306 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1294);
    float _1308 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1312 = _1286 >= 0.0;
    bool _1314 = _1312 && _1304;
    float _1316 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1306);
    float _1318 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1320 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1310);
    float _1322 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1324 = _1286 <= 1.0;
    bool _1326 = _1324 && _1314;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1330 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1320);
    float _1332 = -_1322;
    float _1334 = fma(_1332, _1318, 1.0);
    float _1336 = _656 * _1030;
    float _1338 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1340 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1330);
    float _1342 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1344 = fma(_584, _1022, _1336);
    float _1346 = log2(_1334);
    float _1348 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1338);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1342);
    float _1352 = fma(_586, _1064, _1344);
    if (_1326)
    {
        float _1354 = float(_738);
        _890 = _1354;
    }
    float _1356 = _890;
    float _1358 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1348);
    float _1360 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1362 = _1352 + _1072;
    float _1364 = 1.0 / _1340;
    float _1366 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1368 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1370 = _1356;
    float _1372 = _1368;
    if (!_834)
    {
        float _1374 = -_1050;
        float _1376 = _696 + _1374;
        _726 = _1376;
    }
    float _1378 = _726;
    float _1380 = _1362 * _1136;
    float _1382 = _614;
    float _1384 = _1378;
    if (!_834)
    {
        float _1386 = rint(_1102);
        float _1388 = precise::max(_1386, 0.0);
        uint _1390 = uint(_1388);
        uint _1392 = clamp(_1390, 0u, 65535u);
        _1382 = as_type<float>(_1392);
    }
    float _1394 = _1382;
    float _1396 = _1346 * 0.693147182464599609375;
    float _1398 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1400 = _1342;
    if (_1326)
    {
        float _1402 = rint(_1356);
        float _1404 = precise::max(_1402, 0.0);
        uint _1406 = uint(_1404);
        uint _1408 = clamp(_1406, 0u, 65535u);
        _1400 = as_type<float>(_1408);
    }
    float _1410 = _1400;
    float _1412 = _1366 * _1364;
    if (!_834)
    {
        float _1414 = -_1126;
        float _1416 = _690 + _1414;
        _1122 = _1416;
    }
    float _1418 = _1122;
    float _1420 = _1368 * _1364;
    float _1422 = fma(_1412, 0.5, 0.5);
    float _1424 = fma(_1420, -0.5, 0.5);
    float _1426 = _1418;
    float _1428 = _1394;
    if (!_834)
    {
        float3 _5056 = float3(_1378, _1418, float(as_type<int>(_1394)));
        float3 _5060 = select(_5056, float3(0.0), isnan(_5056));
        float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5060.xy, uint(rint(_5060.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5060.xy, uint(rint(_5060.z)), level(0.0)).x;
        _1426 = _1430;
    }
    float _1432 = _1426;
    float _1434 = _1286;
    if (_1326)
    {
        float3 _5075 = float3(_1278, _1286, float(as_type<int>(_1410)));
        float3 _5077 = select(_5075, float3(0.0), isnan(_5075));
        float _1436 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5077.xy, uint(rint(_5077.z)), _1380, level(0.0));
        _1434 = _1436;
    }
    float _1438 = _1434;
    float3 _5087 = float3(_1422, _1424, _1398);
    float _1440 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5087, float3(0.0), isnan(_5087)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5087, float3(0.0), isnan(_5087)), level(0.0)).x;
    float3 _5096 = float3(_1422, _1424, _1398);
    float4 _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5096, float3(0.0), isnan(_5096)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5096, float3(0.0), isnan(_5096)), level(0.0)).xyzw;
    float _1445 = _1443.x;
    float _1447 = _1443.y;
    float _1449 = _1443.z;
    float _1451 = _1443.w;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1461 = _1457 || _1459;
    if (_834)
    {
        _1090 = 1.0;
    }
    float _1463 = _1090;
    float _1465 = _1463;
    if (_1461)
    {
        _728 = 1.0;
    }
    float _1467 = _728;
    float _1469 = _1467;
    if (_1461)
    {
        _1370 = 1.0;
    }
    float _1471 = _1370;
    float _1473 = _1471;
    float _1475 = _1438;
    float _1477 = _1447;
    float _1479 = _1445;
    float _1481 = _1451;
    float _1483 = _1449;
    if (!_1461)
    {
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1487 = _1485 * 0.15915493667125701904296875;
        float _1489 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1491 = _1487 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1493;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1515 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1513;
        float _1517 = _1505 * _1507;
        float _1519 = 1.0 / _1515;
        float _1521 = 1.0 / _1517;
        float _1523 = _1511 * _1521;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1527 = fma(_684, _1523, _1525);
        float _1529 = _1527 * _1519;
        float _1531 = precise::clamp(_1529, 0.0, 1.0);
        _1428 = _1493;
        _1384 = _1519;
        _1473 = _1531;
    }
    float _1533 = _1428;
    float _1535 = _1384;
    float _1537 = _1473;
    float _1539 = _1533;
    float _1541 = _1535;
    if (!_1461)
    {
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = _1545 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 0.15915493667125701904296875;
        float _1555 = _1545 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = 1.0 / _1551;
        float _1561 = _1553 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = _1557 * _1559;
        float _1567 = _1553 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1563 * _1565;
        float _1573 = 1.0 / _1571;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1577 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1575;
        float _1579 = 1.0 / _1577;
        float _1581 = _1569 * _1573;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1585 = fma(_684, _1581, _1583);
        float _1587 = _1585 * _1579;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        float _1591 = -_1589;
        float _1593 = _1591 + 1.0;
        _1539 = _1553;
        _1541 = _1573;
        _1469 = _1593;
    }
    float _1595 = _1539;
    float _1597 = _1541;
    float _1599 = _1469;
    float _1601 = _1597;
    float _1603 = _1595;
    if (!_834)
    {
        int _1605 = _898 << 4;
        int _1607 = _1605 + 2048;
        uint _1609 = uint(int(uint(_1607) >> uint(2)));
        uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
        int _1613 = int(_1609) & 3;
        float _1615 = (*spvDescriptorSet0.vp_c15)._m0[int(_1611)][_1613];
        int _1617 = int(_1609) + 1;
        uint _1619 = uint(int(uint(_1617) >> uint(2)));
        int _1621 = _1617 & 3;
        float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
        int _1625 = _1607 + 8;
        uint _1627 = uint(int(uint(_1625) >> uint(2)));
        uint _1629 = uint(int(uint(int(_1627)) >> uint(2)));
        int _1631 = int(_1627) & 3;
        float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
        int _1635 = int(_1627) + 1;
        uint _1637 = uint(int(uint(_1635) >> uint(2)));
        int _1639 = _1635 & 3;
        float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
        float _1643 = _656 * _1623;
        float _1645 = fma(_584, _1615, _1643);
        float _1647 = fma(_586, _1633, _1645);
        float _1649 = _1647 + _1641;
        float _1651 = precise::clamp(_1649, 0.0, 1.0);
        float _1653 = -_1651;
        float _1655 = _1653 + _1432;
        float _1657 = fma(_1655, 500.0, 1.5);
        float _1659 = exp2(_1657);
        float _1661 = 0.0 + _1659;
        float _1663 = precise::clamp(_1661, 0.0, 1.0);
        _1601 = _1641;
        _1603 = _1633;
        _900 = as_type<float>(_1607);
        _1465 = _1663;
    }
    float _1665 = _1601;
    float _1667 = _1603;
    float _1669 = _900;
    float _1671 = _1465;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1675 = _1266 + _1673;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1679 = _1268 + _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1683 = _1270 + _1681;
    float _1685 = _1675 * _1675;
    float _1687 = fma(_1679, _1679, _1685);
    float _1689 = fma(_1683, _1683, _1687);
    float _1691 = rsqrt(_1689);
    float _1693 = sqrt(_1689);
    float _1695 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1697 = _1679 * _1695;
    float _1699 = _1683 * _1695;
    float _1701 = _1697 * _1697;
    float _1703 = _1699 * _1699;
    float _1705 = _1701 + _1703;
    float _1707 = sqrt(_1705);
    bool _1709 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1713 = _1707 + _1711;
    float _1715 = _1691;
    float _1717 = _1667;
    float _1719 = _1713;
    float _1721 = _1665;
    float _1723 = _1675;
    float _1725 = _1669;
    float _1727 = _1705;
    if (_1709)
    {
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1715 = _1729;
    }
    float _1731 = _1715;
    if (_1709)
    {
        float _1733 = rsqrt(_1705);
        _1717 = _1733;
    }
    float _1735 = _1717;
    float _1737 = _1735;
    if (_1709)
    {
        float _1739 = _1713 * _1731;
        _1719 = _1739;
    }
    float _1741 = _1719;
    if (_1709)
    {
        float _1743 = _1741 * 0.15915493667125701904296875;
        _1721 = _1743;
    }
    float _1745 = _1721;
    float _1747 = _1683;
    if (_1709)
    {
        float _1749 = _1745 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        _1747 = _1751;
    }
    float _1753 = _1747;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1757 = precise::max(0.0, _1755);
    float _1759 = _1731;
    float _1761 = _1757;
    if (_1709)
    {
        float _1763 = _1745 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        _1759 = _1765;
    }
    float _1767 = _1759;
    float _1769 = -_1695;
    float _1771 = -_1757;
    float _1773 = fma(_1675, _1769, _1771);
    if (_1709)
    {
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1775;
    }
    float _1777 = _1723;
    float _1779 = _1777;
    float _1781 = _1753;
    if (_1709)
    {
        float _1783 = fma(_1753, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    if (!_1709)
    {
        _1781 = _1697;
    }
    float _1789 = _1781;
    float _1791 = _1789;
    float _1793 = _1767;
    if (_1709)
    {
        float _1795 = _1767 + (-1.0);
        _1761 = _1795;
    }
    float _1797 = _1761;
    float _1799 = _1797;
    if (_1709)
    {
        float _1801 = _1735 * _1785;
        _1202 = _1801;
    }
    float _1803 = _1202;
    if (!_1709)
    {
        _1787 = _1773;
    }
    float _1805 = _1787;
    float _1807 = _1805;
    if (_1709)
    {
        float _1809 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1809;
    }
    float _1811 = _1725;
    if (_1709)
    {
        float _1813 = _1697 * _1803;
        _1791 = _1813;
    }
    float _1815 = _1791;
    if (!_1709)
    {
        _1799 = _1699;
    }
    float _1817 = _1799;
    float _1819 = _1817;
    if (_1709)
    {
        float _1821 = _1699 * _1803;
        _1819 = _1821;
    }
    float _1823 = _1819;
    if (!_1709)
    {
        _1737 = _1701;
    }
    float _1825 = _1737;
    float _1827 = _1825;
    if (_1709)
    {
        float _1829 = fma(_1773, _1767, _1811);
        _1807 = _1829;
    }
    float _1831 = _1807;
    if (_1709)
    {
        float _1833 = _1815 * _1815;
        _1827 = _1833;
    }
    float _1835 = _1827;
    if (!_1709)
    {
        _1793 = _1703;
    }
    float _1837 = _1793;
    float _1839 = _1837;
    if (_1709)
    {
        float _1841 = _1823 * _1823;
        _1839 = _1841;
    }
    float _1843 = _1839;
    float _1845 = fma(_1831, _1831, _1835);
    float _1847 = _1845 + _1843;
    float _1849 = rsqrt(_1847);
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1853 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1851);
    float _1855 = precise::clamp(_1853, 0.0, 1.0);
    float _1857 = -_1855;
    float _1859 = _1857 + 1.0;
    float _1861 = abs(_1859);
    float _1863 = log2(_1861);
    float _1865 = _1849 * _1815;
    float _1867 = _1849 * _1831;
    float _1869 = _1849 * _1823;
    float _1871 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1873 = -_1871;
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1873);
    float _1877 = -_1869;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1875);
    float _1881 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1883 = fma(_1879, -0.5, 0.5);
    float _1885 = fma(_1879, 0.5, 0.5);
    float _1887 = exp2(_1881);
    float _1889 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1885, _1889, -0.212114393711090087890625);
    float _1893 = _1867 + 1.0;
    float _1895 = sqrt(_1883);
    float _1897 = fma(_1885, _1891, 1.570728778839111328125);
    float _1899 = -_1867;
    float _1901 = fma(_1887, _1893, _1899);
    float _1903 = fma(_1901, 0.5, 0.5);
    float _1905 = _1895 * 0.636619746685028076171875;
    float _1907 = -_1897;
    float _1909 = fma(_1905, _1907, 1.0);
    float2 _5761 = float2(_1909, _1903);
    float3 _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).xyz;
    float _1915 = _1913.x;
    float _1917 = _1913.y;
    float _1919 = _1913.z;
    float _1921 = in.m_68.z;
    float _1923 = in.m_68.w;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1927 = _564 + _1925;
    float _1929 = in.m_68.y;
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1933 = _1931 != 0;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1937 = _564 + _1935;
    float _1939 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1943 = _1941 != 0;
    float _1945 = -_604;
    float _1947 = _1945 + 1.0;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1953 = exp2(_1939);
    bool _1955 = _239 > 0.5;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1961 = _1803;
    if (!_1933)
    {
        float _1963 = in.m_68.z;
        _1961 = _1963;
    }
    float _1965 = _1961;
    if (_1933)
    {
        _1046 = _239;
    }
    float _1967 = _1046;
    float _1969 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1971 = -_189;
    int _1973 = _1955 ? as_type<int>(_1971) : as_type<int>(_189);
    float _1975 = 1.0 / _1951;
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1981 = _1923 > 0.5;
    bool _1983 = _1921 > 0.5;
    float _1985 = -_199;
    int _1987 = _1981 ? as_type<int>(_1985) : as_type<int>(_199);
    bool _1989 = _1929 > 0.5;
    float _1991 = 1.0 / _1959;
    float _1993 = _1967;
    float _1995 = _1921;
    if (!_1933)
    {
        _1993 = _1921;
    }
    float _1997 = _1993;
    float _1999 = -_189;
    int _2001 = _1989 ? as_type<int>(_1999) : as_type<int>(_189);
    if (!_1933)
    {
        _1995 = _1929;
    }
    float _2003 = _1995;
    bool _2005 = !_1943;
    float _2007 = _2005 ? _189 : as_type<float>(_2001);
    float _2009 = 1.0 / _1979;
    int _2011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2013 = _2011 != 0;
    float _2015 = -_189;
    int _2017 = _1983 ? as_type<int>(_2015) : as_type<int>(_189);
    float _2019 = _2003;
    if (!_1933)
    {
        _892 = _2003;
    }
    float _2021 = _892;
    float _2023 = _2021;
    if (_1933)
    {
        _2019 = _1929;
    }
    float _2025 = _2019;
    bool _2027 = !_2013;
    float _2029 = _2027 ? _189 : as_type<float>(_2017);
    float _2031 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1969);
    float _2033 = _1965;
    float _2035 = _2025;
    if (!_1933)
    {
        _1727 = _1965;
    }
    float _2037 = _1727;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2031);
    float _2045 = _2037;
    if (_1933)
    {
        _2045 = _2025;
    }
    float _2047 = _2045;
    if (_1933)
    {
        _2033 = _2025;
    }
    float _2049 = _2033;
    float _2051 = -_2043;
    float _2053 = _2051 + 1.0;
    if (_1933)
    {
        _2023 = _239;
    }
    float _2055 = _2023;
    if (!_1933)
    {
        _2035 = _239;
    }
    float _2057 = _2035;
    float _2059 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2067 = _2065 != 0;
    float _2069 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2073 = _2071 != 0;
    bool _2075 = !_2041;
    float _2077 = _2075 ? _189 : as_type<float>(_1973);
    float _2079 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2081 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2083 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2087;
    float _2091 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2081);
    float _2093 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2083);
    float _2095 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2085);
    float _2097 = _2089 * _1975;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2099;
    bool _2103 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2105 = isnan(_564);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2121 = _564 + _2119;
    float _2123 = _2101 * _1991;
    bool _2125 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2127 = isnan(_564);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = -_2113;
    float _2139 = _2137 + 1.0;
    bool _2141 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2143 = isnan(_564);
    bool _2145 = _2141 || _2143;
    bool _2147 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2149 = _2145 || _2147;
    float _2151 = float(_2149);
    float _2153 = _2117 * _2009;
    float _2155 = fma(_2097, _2121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2157 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2159 = isnan(_564);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2135 * _2139;
    float _2171 = -_2135;
    float _2173 = _2171 + 1.0;
    float _2175 = -_2151;
    float _2177 = _2175 + 1.0;
    float _2179 = fma(_2123, _1927, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2181 = _2151 * _2173;
    float _2183 = _2167 * _2177;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2187 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2189 = fma(_2153, _1937, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2191 = _2155 * _2183;
    float _2193 = -_2185;
    float _2195 = fma(_2187, 2.0, _2193);
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2199 = -_2167;
    float _2201 = _2199 + 1.0;
    float _2203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2205 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2197);
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2209 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2191);
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2213 = -_199;
    int _2215 = _1983 ? as_type<int>(_2213) : as_type<int>(_199);
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2219 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2207);
    float _2221 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2225 = fma(_2189, _2181, _2209);
    float _2227 = -_2217;
    float _2229 = fma(_2221, 2.0, _2227);
    float _2231 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2211);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2235 = -_199;
    int _2237 = _1989 ? as_type<int>(_2235) : as_type<int>(_199);
    float _2239 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2241 = !_2063;
    float _2243 = _2241 ? _199 : as_type<float>(_1987);
    float _2245 = fma(_2179, _2169, _2225);
    bool _2247 = !_2067;
    float _2249 = _2247 ? _199 : as_type<float>(_2215);
    float _2251 = fma(_2239, -2.0, _2233);
    bool _2253 = !_2073;
    float _2255 = _2253 ? _199 : as_type<float>(_2237);
    float _2257 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2259 = -_143;
    float _2261 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2195);
    float _2263 = _2007 + 0.5;
    float _2265 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2267 = _2029 + 0.5;
    float _2269 = -_143;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2229);
    float _2273 = fma(_2257, _2263, _2261);
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2277 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2205);
    float _2279 = fma(_2265, _2267, _2271);
    float _2281 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2251);
    float _2283 = fma(_2069, -2.0, _2275);
    float _2285 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2219);
    float _2287 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2231);
    float _2289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2291 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2283);
    float _2293 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2245);
    float _2295 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2297 = _2077 + 0.5;
    float _2299 = _2243 + (-0.5);
    float _2301 = -_2255;
    float _2303 = _2301 + 0.5;
    float _2305 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2295);
    float _2307 = abs(_684);
    float _2309 = log2(_2307);
    float _2311 = _2297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2313 = -_2287;
    float _2315 = _2313 + 1.0;
    float _2317 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2319 = -_2053;
    float _2321 = fma(_2007, _2319, _2273);
    float _2323 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2305);
    float _2325 = _2249 + (-0.5);
    float _2327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2329 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2331 = _684 <= 8000.0;
    bool _2333 = isnan(_684);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(8000.0);
    bool _2339 = _2335 || _2337;
    float _2341 = float(_2339);
    float _2343 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2323);
    float _2345 = -_2277;
    float _2347 = _2345 + 1.0;
    float _2349 = -_2329;
    float _2351 = -_2281;
    float _2353 = fma(_2349, _2299, _2351);
    float _2355 = _2343 + _1340;
    float _2357 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2361 = fma(_2243, _2315, _2353);
    out.gl_Position.x = _1366;
    out.gl_Position.y = _1368;
    out.gl_Position.z = _2343;
    out.gl_Position.w = _1340;
    float _2363 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2365 = _2355 * 0.5;
    float _2367 = _2311 * _2327;
    float _2369 = exp2(_2357);
    float _2371 = -_2285;
    float _2373 = _2371 + 1.0;
    out.m_74.w = _2363;
    float _2375 = -_2373;
    float _2377 = fma(_2029, _2375, _2279);
    float _2379 = _2317 * _2359;
    float _2381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2383 = -_1953;
    float _2385 = _2383 + 1.0;
    if (!_1326)
    {
        _1372 = 1.0;
    }
    float _2387 = _1372;
    float _2389 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_76.x = _2367;
    out.m_76.y = _2379;
    out.m_76.z = _2377;
    out.m_76.w = _2361;
    float _2391 = _2387;
    if (_1326)
    {
        bool _2393 = _1438 >= _1380;
        bool _2395 = isnan(_1438);
        bool _2397 = _2393 || _2395;
        bool _2399 = isnan(_1380);
        bool _2401 = _2397 || _2399;
        float _2403 = float(_2401);
        _2391 = _2403;
    }
    float _2405 = _2391;
    float _2407 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2409 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = _1537 * _1599;
    float _2415 = _2405 * _1671;
    float _2417 = _2407 * _1440;
    float _2419 = -_2407;
    float _2421 = _2419 + 1.0;
    out.m_78.z = _2365;
    out.m_78.w = _1340;
    bool _2423 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2425 = isnan(_1693);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2431 = _2427 || _2429;
    float _2433 = _2381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2435 = fma(_2411, -2.0, 3.0);
    float _2437 = _2411 * _2411;
    float _2439 = -_2433;
    float _2441 = -_2291;
    float _2443 = fma(_2439, _2325, _2441);
    float _2445 = _1451 * _2421;
    float _2447 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2449 = _2437 * _2435;
    float _2451 = fma(_2249, _2347, _2443);
    float _2453 = -_2449;
    float _2455 = _2453 + 1.0;
    float _2457 = _2413;
    if (!_2431)
    {
        _1475 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2459 = _1475;
    out.m_80.x = _2321;
    out.m_80.y = _2451;
    float _2461 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2449);
    float _2463 = _1451 * _2417;
    float _2465 = _2341 * _2461;
    float _2467 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2469 = _1947 * _2467;
    float _2471 = precise::clamp(_2469, 0.0, 1.0);
    float _2473 = -_2471;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2477 = -_2415;
    float _2479 = fma(_2477, _2475, 1.0);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = _2481 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2485 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_82.x = _2483;
    out.m_84.x = _2447;
    out.m_84.y = _2485;
    out.m_84.z = _2389;
    float _2487 = _1919 * _2417;
    float _2489 = fma(_1915, _2463, _1445);
    float _2491 = fma(_1917, _2463, _1447);
    float _2493 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2495 = fma(_1451, _2487, _1449);
    float _2497 = _2459;
    float _2499 = _2459;
    if (!_2431)
    {
        _1477 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2501 = _1477;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2431)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2507 = _1479;
    out.m_86.x = _2489;
    out.m_86.y = _2491;
    out.m_86.z = _2495;
    out.m_86.w = _2445;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2431)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2513 = _1481;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2431)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2519 = _1483;
    float _2521 = _2519;
    float _2523 = _2519;
    if (!_2431)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2525 = _2457;
    bool _2527 = !_2431;
    float _2529 = _2525;
    float _2531 = _2525;
    if (!_2527)
    {
        bool _2533 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2535 = isnan(_1693);
        bool _2537 = _2533 || _2535;
        bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2541 = _2537 || _2539;
        if (!_2541)
        {
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2545 = _1693 + _2543;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2547;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2555 = 1.0 / _2549;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2573 = _2545 * _2555;
            float _2575 = precise::clamp(_2573, 0.0, 1.0);
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2505 = _2583;
            _2523 = _2589;
            _2499 = _2581;
            _2517 = _2587;
            _2511 = _2585;
            _2531 = _2591;
            _2593 = true;
        }
        else
        {
            bool _2595 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2597 = isnan(_1693);
            bool _2599 = _2595 || _2597;
            bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2603 = _2599 || _2601;
            if (!_2603)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2605 = _2497;
            _2499 = _2605;
            if (!_2603)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2607 = _2503;
            _2505 = _2607;
            if (!_2603)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2609 = _2509;
            _2511 = _2609;
            if (!_2603)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2611 = _2515;
            _2517 = _2611;
            if (!_2603)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2613 = _2521;
            _2523 = _2613;
            if (!_2603)
            {
                _2529 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2615 = _2529;
            bool _2617 = !_2603;
            _2531 = _2615;
            if (!_2617)
            {
                bool _2619 = _1693 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2621 = isnan(_1693);
                bool _2623 = _2619 || _2621;
                bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2627 = _2623 || _2625;
                if (!_2627)
                {
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2631 = _1693 + _2629;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2633;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2641 = 1.0 / _2635;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2659 = _2631 * _2641;
                    float _2661 = precise::clamp(_2659, 0.0, 1.0);
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2667 = fma(_2661, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2669 = fma(_2661, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2671 = fma(_2661, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2673 = fma(_2661, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2675 = fma(_2661, _2653, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2677 = fma(_2661, _2657, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2505 = _2669;
                    _2523 = _2675;
                    _2499 = _2667;
                    _2517 = _2673;
                    _2511 = _2671;
                    _2531 = _2677;
                    _2593 = true;
                }
                else
                {
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2531 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2593 = false;
    float _2679 = _2505;
    float _2681 = _2523;
    float _2683 = _2499;
    float _2685 = _2517;
    float _2687 = _2511;
    float _2689 = _2531;
    float _2691 = fma(_2485, -0.5, 0.5);
    float _2693 = precise::clamp(_2691, 0.0, 1.0);
    float _2695 = -_2679;
    float _2697 = _2695 + _2681;
    float _2699 = _2493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2701 = -_2683;
    float _2703 = _2701 + _2685;
    out.m_88.x = 0.0;
    float _2705 = fma(_2693, _2697, _2679);
    float _2707 = fma(_2693, _2703, _2683);
    out.m_59.x = _2699;
    float _2709 = -_2687;
    float _2711 = _2709 + _2689;
    float _2713 = _2705 * 0.586610972881317138671875;
    bool _2715 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2717 = fma(_2693, _2711, _2687);
    float _2719 = fma(_2707, 0.298911988735198974609375, _2713);
    bool _2721 = _1537 > 0.0;
    bool _2723 = isnan(_1537);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(0.0);
    bool _2729 = _2725 || _2727;
    float _2731 = fma(_2717, 0.114477999508380889892578125, _2719);
    bool _2733 = _1599 <= 0.0;
    bool _2735 = !_2729;
    bool _2737 = _2733 || _2735;
    float _2739 = -_2731;
    float _2741 = _2707 + _2739;
    float _2743 = -_2731;
    float _2745 = _2705 + _2743;
    float _2747 = -_2731;
    float _2749 = _2717 + _2747;
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2755 = fma(_2749, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    bool _2757 = !_2715;
    if (!_2757)
    {
        float _2759 = -_1266;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2763 = -_1268;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2767 = -_1270;
        float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2771 = _2761 * _2761;
        float _2773 = fma(_2765, _2765, _2771);
        float _2775 = fma(_2769, _2769, _2773);
        float _2777 = sqrt(_2775);
        float _2779 = rsqrt(_2775);
        float _2781 = -_2777;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2785 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = _2765 * _2779;
        float _2791 = _2761 * _2779;
        float _2793 = abs(_2787);
        float _2795 = log2(_2793);
        float _2797 = _2769 * _2779;
        float _2799 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2801 = _2485 * _2791;
        float _2803 = -_2791;
        float _2805 = -_2799;
        float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2805);
        float _2809 = fma(_2447, _2789, _2801);
        float _2811 = -_2797;
        float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2807);
        float _2815 = fma(_2389, _2797, _2809);
        float _2817 = precise::clamp(_2815, 0.0, 1.0);
        float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2821 = _2813 + _2819;
        float _2823 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2827 = precise::clamp(_2825, 0.0, 1.0);
        float _2829 = exp2(_2823);
        float _2831 = _2829 * _2827;
        float _2833 = _2817 * _2831;
        float _2835 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2837 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2835;
        out.m_88.y = _2837;
        out.m_88.z = _2839;
    }
    out.m_90.x = _2751;
    out.m_90.y = _2753;
    out.m_90.z = _2755;
    if (!_2737)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2841 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2841;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

