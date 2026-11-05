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
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2535 = false;
    bool _564 = false;
    bool _351 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2834 = as_type<float>(_129);
        out.gl_Position.z = _2834;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2902 = as_type<float>(_165);
        out.gl_Position.z = _2902;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_66.x;
    float _171 = in.m_66.y;
    float _173 = in.m_66.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _205;
    float _215 = _207;
    float _217 = _209;
    float _235;
    if (!_211)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_113);
        float _241 = 1.0 / _239;
        float _243 = _147 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = in.m_68.x;
    float _249 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _245 + _251;
    bool _255 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_245);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -_265;
    float _273 = _271 + 1.0;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _269;
    float _279 = _249 * _247;
    float _281 = _253 * _277;
    bool _283 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_245);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = trunc(_279);
    int _305 = int(_303);
    float _307 = _293 * _273;
    float _309 = fma(_297, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = fma(_301, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -_293;
    float _315 = _313 + 1.0;
    float _317 = _309 * _307;
    float _319 = _311 * _307;
    float _321 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    int _329 = _305 << 4;
    int _331 = _329 + 1712;
    bool _333 = !_275;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _337 = _247 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    uint _362 = uint(int(uint(_331) >> uint(2)));
    uint _364 = uint(int(uint(int(_362)) >> uint(2)));
    int _366 = int(_362) & 3;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[int(_364)][_366];
    int _370 = int(_362) + 1;
    uint _372 = uint(int(uint(_370) >> uint(2)));
    int _374 = _370 & 3;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[int(_372)][_374];
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _386 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _388 = isnan(_359);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    int _398 = _331 + 8;
    uint _400 = uint(int(uint(_398) >> uint(2)));
    uint _402 = uint(int(uint(int(_400)) >> uint(2)));
    int _404 = int(_400) & 3;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[int(_402)][_404];
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _412 = 1.0 / _380;
    bool _414 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = isnan(_359);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    float _430 = -_396;
    float _432 = _430 + 1.0;
    bool _434 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_359);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = _424 * _432;
    float _452 = 1.0 / _384;
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _359 + _458;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _464 = _444 * _456;
    float _466 = -_444;
    float _468 = _466 + 1.0;
    float _470 = 1.0 / _410;
    float _472 = _428 * _412;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _359 + _474;
    float _478 = fma(_472, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _482 = _359 + _480;
    float _484 = _448 * _452;
    bool _486 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = isnan(_359);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _498;
    float _502 = _478 * _464;
    float _504 = fma(_484, _482, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[115].x, _502);
    float _512 = _500 * _470;
    float _514 = _396 * _508;
    float _516 = fma(_504, _450, _510);
    float _518 = fma(_512, _460, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _520 = _368 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _524 = fma(_518, _514, _516);
    float _526 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _528 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[118].x, _524);
    float _530 = _522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _406 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _534 = in.m_70.x;
    float _536 = in.m_70.y;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _526;
    out.m_72.y = _530;
    out.m_72.z = _540;
    out.m_72.w = _538;
    float _542 = _327 * _536;
    float _544 = _325 * _534;
    bool _546 = !_462;
    float _562;
    if (!_546)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _550 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_113);
        float _568 = 1.0 / _566;
        float _570 = _147 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = in.m_56.x;
    float _576 = in.m_56.y;
    float _578 = in.m_56.z;
    float _580 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _582 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _580);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _582);
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _584);
    float _590 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _586);
    float _592 = _588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _594 = _590 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _596 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _598 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _600 = floor(_596);
    float _602 = floor(_598);
    float _604 = -_600;
    float _606 = _596 + _604;
    float _608 = -_602;
    float _610 = _598 + _608;
    float2 _3622 = float2(_606, _610);
    float _612 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3622, float2(0.0), isnan(_3622)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3622, float2(0.0), isnan(_3622)), level(0.0)).x;
    float _614 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _616 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _614);
    float _620 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _618);
    float _622 = _620 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _626 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _624);
    float _628 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[11].z, _626);
    float _630 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _632 = _628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _634 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _630);
    float _636 = 1.0 / _632;
    float _638 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[10].z, _634);
    float _640 = _638 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _642 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _644 = _640 + _632;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _648 = _642 * _646;
    float _650 = _644 * _636;
    float _652 = _650 * 0.5;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _658 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[30].w, _656);
    float _660 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _662 = _616 * _654;
    float _664 = 1.0 / _658;
    float _666 = _622 + _660;
    float _668 = _662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _670 = _662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _672 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _674 = _666 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[26].x, _668);
    float _678 = _666 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _680 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[127].x, _674);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _676);
    float _684 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[126].x, _678);
    float _686 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[127].z, _680);
    float _688 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _664 * _690;
    float _694 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[126].z, _684);
    float _696 = _686 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _688);
    float _700 = _682 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _702 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = _694 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _706 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _708 = trunc(_696);
    int _710 = int(_708);
    bool _712 = !_702;
    int _714 = _712 ? 0 : 1;
    float _716 = _698 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _718 = _594 + _700;
    float _720 = _592 + _716;
    float _722 = trunc(_704);
    int _724 = int(_722);
    int _726 = 2;
    float _728 = _720;
    float _730 = _704;
    if (!_702)
    {
        _726 = 1;
    }
    int _732 = _726;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _736 = _720 + _734;
    int _738 = _732;
    if (!_706)
    {
        _738 = _714;
    }
    int _740 = _738;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _744 = _718 + _742;
    int _746 = _740 << 6;
    float _748 = _744 * _744;
    int _750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _752 = _710 + _750;
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
    float _774 = fma(_736, _736, _748);
    int _776 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _778 = _724 + _776;
    int _780 = _778 + 1;
    float _782 = sqrt(_774);
    int _784 = _746 + 56;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    bool _802 = _780 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _804 = _780 | _754;
    bool _806 = _804 < 0;
    bool _808 = _806 || _802;
    int _810 = _746 + 64;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    uint _814 = uint(int(uint(int(_812)) >> uint(2)));
    int _816 = int(_812) & 3;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[int(_814)][_816];
    int _820 = int(_812) + 1;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    int _824 = _820 & 3;
    float _826 = (*spvDescriptorSet0.vp_c15)._m0[int(_822)][_824];
    float _828 = _662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _830 = _754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _832 = _830 || _808;
    float _834 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[25].x, _828);
    bool _836 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _838 = _746 + 72;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c15)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    float _856 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _834);
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _860 = _746 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    int _878 = as_type<int>(_834);
    float _880 = as_type<float>(_780);
    float _882 = as_type<float>(_754);
    float _884 = _828;
    float _886 = _782;
    float _888 = as_type<float>(_740);
    if (!_832)
    {
        int _890 = _754 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _892 = _890 + _780;
        _878 = _892;
    }
    int _894 = _878;
    float _896 = _622 + _858;
    if (!_836)
    {
        _880 = _718;
    }
    float _898 = _880;
    int _900 = 0;
    float _902 = _898;
    if (!_832)
    {
        int _904 = _894 << 2;
        _900 = _904;
    }
    int _906 = _900;
    int _908 = _746 + 104;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    uint _912 = uint(int(uint(int(_910)) >> uint(2)));
    int _914 = int(_910) & 3;
    float _916 = (*spvDescriptorSet0.vp_c15)._m0[int(_912)][_914];
    int _918 = int(_910) + 1;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    int _922 = _918 & 3;
    float _924 = (*spvDescriptorSet0.vp_c15)._m0[int(_920)][_922];
    int _926 = 0;
    int _928 = _906;
    if (!_832)
    {
        uint _930 = uint(int(uint(_894) >> uint(2)));
        _926 = int(_930);
    }
    int _932 = _926;
    if (!_832)
    {
        int _934 = 12 & _906;
        _928 = _934;
    }
    int _936 = _928;
    if (!_836)
    {
        _882 = _896;
    }
    float _938 = _882;
    bool _940 = !_836;
    float _942 = _938;
    float _944 = _818;
    if (!_940)
    {
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _950 = _782 + _948;
        float _952 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = rsqrt(_774);
        float _956 = _950 * _946;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _958 * 6.283185482025146484375;
        float _962 = cos(_960);
        float _964 = _958 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 + (-1.0);
        float _970 = fma(_966, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _972 = _968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _954 * _970;
        float _976 = fma(_896, _962, _972);
        float _978 = fma(_736, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _980 = fma(_744, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _942 = _976;
        _728 = _978;
        _902 = _980;
        _884 = _968;
        _886 = _958;
    }
    float _982 = _942;
    float _984 = _728;
    float _986 = _902;
    float _988 = _884;
    float _990 = _886;
    float _992 = _988;
    float _994 = _990;
    float _996 = _984;
    float _998 = _982;
    float _1000 = _986;
    if (!_832)
    {
        int _1002 = _932 << 4;
        int _1004 = _1002 + _936;
        _992 = as_type<float>(_1004);
    }
    float _1006 = _992;
    float _1008 = -_622;
    float _1010 = _1008 + _982;
    int _1012 = _746 + 80;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    float _1030 = -_592;
    float _1032 = _1030 + _984;
    float _1034 = -_594;
    float _1036 = _1034 + _986;
    float _1038 = _1010 * _1010;
    float _1040 = _666 * _876;
    float _1042 = _1010;
    float _1044 = _1040;
    if (!_832)
    {
        float _1046 = floor(_696);
        _994 = _1046;
    }
    float _1048 = _994;
    float _1050 = _666 * _826;
    float _1052 = fma(_1032, _1032, _1038);
    int _1054 = _746 + 88;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c15)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    float _1072 = fma(_592, _868, _1040);
    float _1074 = fma(_592, _818, _1050);
    float _1076 = fma(_1036, _1036, _1052);
    float _1078 = fma(_594, _916, _1072);
    float _1080 = _666 * _772;
    float _1082 = sqrt(_1076);
    float _1084 = _1006;
    float _1086 = _1074;
    float _1088 = _1048;
    if (!_832)
    {
        int _1090 = as_type<int>(_1006) + 400;
        uint _1092 = uint(int(uint(_1090) >> uint(2)));
        uint _1094 = uint(int(uint(int(_1092)) >> uint(2)));
        int _1096 = int(_1092) & 3;
        float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = _1078 + _924;
    float _1104 = fma(_592, _764, _1080);
    float _1106 = fma(_594, _846, _1074);
    bool _1108 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1110 = isnan(0.5);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_594, _792, _1104);
    float _1120 = _1038;
    if (!_832)
    {
        float _1122 = floor(_704);
        _1120 = _1122;
    }
    float _1124 = _1120;
    float _1126 = _1106 + _854;
    float _1128 = _1118 + _800;
    bool _1130 = _1082 > 0.0;
    float _1132 = 1.0 / _1102;
    bool _1134 = !_1130;
    float _1136 = _1082;
    if (!_1134)
    {
        float _1138 = _207 * _207;
        float _1140 = rsqrt(_1076);
        float _1142 = fma(_205, _205, _1138);
        float _1144 = fma(_209, _209, _1142);
        float _1146 = sqrt(_1144);
        float _1148 = _1032 * _1140;
        float _1150 = _1010 * _1140;
        float _1152 = _1036 * _1140;
        bool _1154 = _1146 > 0.0;
        bool _1156 = !_1154;
        _1086 = _1152;
        if (!_1156)
        {
            float _1158 = rsqrt(_1144);
            float _1160 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1162 = _207 * _1158;
            float _1164 = _205 * _1158;
            float _1166 = _1150 * _1162;
            float _1168 = _209 * _1158;
            float _1170 = fma(_1148, _1164, _1166);
            float _1172 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1174 = fma(_1152, _1168, _1170);
            float _1176 = _1174 * _1172;
            float _1178 = fma(_205, _1176, _984);
            float _1180 = fma(_207, _1176, _982);
            float _1182 = fma(_209, _1176, _986);
            _996 = _1178;
            _998 = _1180;
            _1000 = _1182;
            _944 = _1172;
        }
    }
    float _1184 = _996;
    float _1186 = _998;
    float _1188 = _1000;
    float _1190 = _944;
    float _1192 = _1086;
    float _1194 = _1186;
    float _1196 = _1190;
    float _1198 = _1192;
    if (_1116)
    {
        _213 = _1184;
    }
    float _1200 = _213;
    float _1202 = _1200;
    if (_1116)
    {
        _215 = _1186;
    }
    float _1204 = _215;
    float _1206 = _1204;
    if (_1116)
    {
        _217 = _1188;
    }
    float _1208 = _217;
    float _1210 = _1208;
    if (!_1116)
    {
        float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1214 = _622 + _1212;
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1218 = _592 + _1216;
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1222 = -_622;
        float _1224 = _1222 + _1186;
        float _1226 = _1214 * _1214;
        float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1230 = _594 + _1228;
        float _1232 = -_592;
        float _1234 = _1232 + _1184;
        float _1236 = -_594;
        float _1238 = _1236 + _1188;
        float _1240 = fma(_1218, _1218, _1226);
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1244 = fma(_1230, _1230, _1240);
        float _1246 = sqrt(_1244);
        float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1250 = precise::min(_1246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1252 = _1250 * _1242;
        float _1254 = _1248 * _1252;
        float _1256 = fma(_1224, _1254, _622);
        float _1258 = fma(_1234, _1254, _592);
        float _1260 = fma(_1238, _1254, _594);
        _1206 = _1256;
        _1202 = _1258;
        _1210 = _1260;
        _1194 = _1224;
    }
    float _1262 = _1206;
    float _1264 = _1202;
    float _1266 = _1210;
    float _1268 = _1194;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1272 = _1128 * _1132;
    float _1274 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1278 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1270);
    float _1280 = _1126 * _1132;
    float _1282 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    bool _1284 = _1272 >= 0.0;
    float _1286 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1278);
    float _1288 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1276);
    float _1290 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1292 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1282);
    float _1294 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1296 = _1272 <= 1.0;
    bool _1298 = _1296 && _1284;
    float _1300 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1288);
    float _1302 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1290);
    float _1304 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1308 = _1280 >= 0.0;
    bool _1310 = _1308 && _1298;
    float _1312 = _1302;
    float _1314 = _1268;
    if (!_832)
    {
        float _1316 = rint(_1100);
        float _1318 = precise::max(_1316, 0.0);
        uint _1320 = uint(_1318);
        uint _1322 = clamp(_1320, 0u, 65535u);
        _1196 = as_type<float>(_1322);
    }
    float _1324 = _1196;
    float _1326 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1328 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1306);
    bool _1330 = _1280 <= 1.0;
    bool _1332 = _1330 && _1310;
    float _1334 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_832)
    {
        float _1338 = -_1048;
        float _1340 = _696 + _1338;
        _1088 = _1340;
    }
    float _1342 = _1088;
    if (!_832)
    {
        float _1344 = -_1124;
        float _1346 = _704 + _1344;
        _1198 = _1346;
    }
    float _1348 = _1198;
    float _1350 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1354 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1328);
    float _1356 = _666 * _1028;
    float _1358 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = -_1352;
    float _1362 = fma(_1360, _1334, 1.0);
    float _1364 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1354);
    float _1366 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1332)
    {
        float _1368 = float(_740);
        _1312 = _1368;
    }
    float _1370 = _1312;
    float _1372 = fma(_592, _1020, _1356);
    float _1374 = 1.0 / _1364;
    float _1376 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1378 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1380 = fma(_594, _1062, _1372);
    float _1382 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1384 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1378);
    float _1386 = _1380 + _1070;
    float _1388 = log2(_1362);
    float _1390 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1382);
    float _1392 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1384);
    float _1394 = _1386 * _1132;
    float _1396 = _1370;
    float _1398 = _1392;
    if (_1332)
    {
        float _1400 = rint(_1370);
        float _1402 = precise::max(_1400, 0.0);
        uint _1404 = uint(_1402);
        uint _1406 = clamp(_1404, 0u, 65535u);
        _1396 = as_type<float>(_1406);
    }
    float _1408 = _1396;
    float _1410 = _1390 * _1374;
    float _1412 = _1392 * _1374;
    float _1414 = fma(_1410, 0.5, 0.5);
    float _1416 = fma(_1412, -0.5, 0.5);
    float _1418 = _1388 * 0.693147182464599609375;
    float _1420 = _1342;
    if (!_832)
    {
        float3 _4972 = float3(_1348, _1342, float(as_type<int>(_1324)));
        float3 _4976 = select(_4972, float3(0.0), isnan(_4972));
        float _1422 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4976.xy, uint(rint(_4976.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4976.xy, uint(rint(_4976.z)), level(0.0)).x;
        _1420 = _1422;
    }
    float _1424 = _1420;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1428 = _1124;
    float _1430 = _1408;
    if (_1332)
    {
        float3 _4996 = float3(_1272, _1280, float(as_type<int>(_1408)));
        float3 _4998 = select(_4996, float3(0.0), isnan(_4996));
        float _1432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4998.xy, uint(rint(_4998.z)), _1394, level(0.0));
        _1428 = _1432;
    }
    float _1434 = _1428;
    float3 _5008 = float3(_1414, _1416, _1426);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5008, float3(0.0), isnan(_5008)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5008, float3(0.0), isnan(_5008)), level(0.0)).x;
    float3 _5017 = float3(_1414, _1416, _1426);
    float4 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5017, float3(0.0), isnan(_5017)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5017, float3(0.0), isnan(_5017)), level(0.0)).xyzw;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = _1439.w;
    bool _1449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1451 = isnan(0.5);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1457 = _1453 || _1455;
    if (_832)
    {
        _888 = 1.0;
    }
    float _1459 = _888;
    float _1461 = _1459;
    if (_1457)
    {
        _730 = 1.0;
    }
    float _1463 = _730;
    float _1465 = _1463;
    float _1467 = _1447;
    float _1469 = _1445;
    float _1471 = _1443;
    float _1473 = _1441;
    if (!_1457)
    {
        float _1475 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1481 = _1477 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1479 * 0.15915493667125701904296875;
        float _1487 = _1477 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = 1.0 / _1483;
        float _1493 = _1485 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = _1485 * 6.283185482025146484375;
        float _1501 = sin(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = 1.0 / _1503;
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1507;
        float _1511 = 1.0 / _1509;
        float _1513 = _1501 * _1505;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1517 = fma(_692, _1513, _1515);
        float _1519 = _1517 * _1511;
        float _1521 = precise::clamp(_1519, 0.0, 1.0);
        float _1523 = -_1521;
        float _1525 = _1523 + 1.0;
        _1430 = _1477;
        _1465 = _1525;
    }
    float _1527 = _1430;
    float _1529 = _1465;
    float _1531 = _1527;
    if (!_832)
    {
        int _1533 = _894 << 4;
        int _1535 = _1533 + 2048;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
        int _1541 = int(_1537) & 3;
        float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
        int _1545 = int(_1537) + 1;
        uint _1547 = uint(int(uint(_1545) >> uint(2)));
        int _1549 = _1545 & 3;
        float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
        int _1553 = _1535 + 8;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
        int _1559 = int(_1555) & 3;
        float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
        int _1563 = int(_1555) + 1;
        uint _1565 = uint(int(uint(_1563) >> uint(2)));
        int _1567 = _1563 & 3;
        float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
        float _1571 = _666 * _1551;
        float _1573 = fma(_592, _1543, _1571);
        float _1575 = fma(_594, _1561, _1573);
        float _1577 = _1575 + _1569;
        float _1579 = precise::clamp(_1577, 0.0, 1.0);
        float _1581 = -_1579;
        float _1583 = _1581 + _1424;
        float _1585 = fma(_1583, 500.0, 1.5);
        float _1587 = exp2(_1585);
        float _1589 = 0.0 + _1587;
        float _1591 = precise::clamp(_1589, 0.0, 1.0);
        _1461 = _1591;
    }
    float _1593 = _1461;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1597 = _1262 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1601 = _1264 + _1599;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1266 + _1603;
    float _1607 = _1597 * _1597;
    float _1609 = fma(_1601, _1601, _1607);
    float _1611 = fma(_1605, _1605, _1609);
    float _1613 = rsqrt(_1611);
    float _1615 = sqrt(_1611);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1619 = _1601 * _1617;
    float _1621 = _1605 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 + _1625;
    float _1629 = sqrt(_1627);
    bool _1631 = _1629 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = _1629 + _1633;
    float _1637 = _1609;
    float _1639 = _1613;
    float _1641 = _1635;
    float _1643 = _1597;
    float _1645 = _1627;
    if (_1631)
    {
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1637 = _1647;
    }
    float _1649 = _1637;
    if (_1631)
    {
        float _1651 = rsqrt(_1627);
        _1639 = _1651;
    }
    float _1653 = _1639;
    float _1655 = _1653;
    if (_1631)
    {
        float _1657 = _1635 * _1649;
        _1641 = _1657;
    }
    float _1659 = _1641;
    if (_1631)
    {
        float _1661 = _1659 * 0.15915493667125701904296875;
        _1531 = _1661;
    }
    float _1663 = _1531;
    float _1665 = _1605;
    float _1667 = _1663;
    if (_1631)
    {
        float _1669 = _1663 * 6.283185482025146484375;
        float _1671 = sin(_1669);
        _1665 = _1671;
    }
    float _1673 = _1665;
    float _1675 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1677 = precise::max(0.0, _1675);
    float _1679 = _1649;
    float _1681 = _1677;
    if (_1631)
    {
        float _1683 = _1663 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        _1679 = _1685;
    }
    float _1687 = _1679;
    float _1689 = -_1617;
    float _1691 = -_1677;
    float _1693 = fma(_1597, _1689, _1691);
    if (_1631)
    {
        float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1695;
    }
    float _1697 = _1643;
    float _1699 = _1697;
    float _1701 = _1673;
    if (_1631)
    {
        float _1703 = fma(_1673, _1697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = _1705;
    if (!_1631)
    {
        _1701 = _1619;
    }
    float _1709 = _1701;
    float _1711 = _1709;
    float _1713 = _1687;
    if (_1631)
    {
        float _1715 = _1687 + (-1.0);
        _1681 = _1715;
    }
    float _1717 = _1681;
    float _1719 = _1717;
    if (_1631)
    {
        float _1721 = _1653 * _1705;
        _1042 = _1721;
    }
    float _1723 = _1042;
    if (!_1631)
    {
        _1707 = _1693;
    }
    float _1725 = _1707;
    float _1727 = _1725;
    if (_1631)
    {
        float _1729 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1729;
    }
    float _1731 = _1667;
    if (_1631)
    {
        float _1733 = _1619 * _1723;
        _1711 = _1733;
    }
    float _1735 = _1711;
    if (!_1631)
    {
        _1719 = _1621;
    }
    float _1737 = _1719;
    float _1739 = _1737;
    if (_1631)
    {
        float _1741 = _1621 * _1723;
        _1739 = _1741;
    }
    float _1743 = _1739;
    if (!_1631)
    {
        _1655 = _1623;
    }
    float _1745 = _1655;
    float _1747 = _1745;
    if (_1631)
    {
        float _1749 = fma(_1693, _1687, _1731);
        _1727 = _1749;
    }
    float _1751 = _1727;
    if (_1631)
    {
        float _1753 = _1735 * _1735;
        _1747 = _1753;
    }
    float _1755 = _1747;
    if (!_1631)
    {
        _1713 = _1625;
    }
    float _1757 = _1713;
    float _1759 = _1757;
    if (_1631)
    {
        float _1761 = _1743 * _1743;
        _1759 = _1761;
    }
    float _1763 = _1759;
    float _1765 = fma(_1751, _1751, _1755);
    float _1767 = _1765 + _1763;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1771 = fma(_1615, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1769);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = rsqrt(_1767);
    float _1777 = -_1773;
    float _1779 = _1777 + 1.0;
    float _1781 = abs(_1779);
    float _1783 = log2(_1781);
    float _1785 = _1775 * _1735;
    float _1787 = _1775 * _1751;
    float _1789 = _1775 * _1743;
    float _1791 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1793 = -_1791;
    float _1795 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1793);
    float _1797 = -_1789;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1795);
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1803 = fma(_1799, -0.5, 0.5);
    float _1805 = fma(_1799, 0.5, 0.5);
    float _1807 = exp2(_1801);
    float _1809 = fma(_1805, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1811 = fma(_1805, _1809, -0.212114393711090087890625);
    float _1813 = _1787 + 1.0;
    float _1815 = sqrt(_1803);
    float _1817 = fma(_1805, _1811, 1.570728778839111328125);
    float _1819 = -_1787;
    float _1821 = fma(_1807, _1813, _1819);
    float _1823 = _1815 * 0.636619746685028076171875;
    float _1825 = fma(_1821, 0.5, 0.5);
    float _1827 = -_1817;
    float _1829 = fma(_1823, _1827, 1.0);
    float2 _5593 = float2(_1829, _1825);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5593, float2(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5593, float2(0.0), isnan(_5593)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = in.m_68.z;
    float _1843 = in.m_68.w;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1847 = _572 + _1845;
    float _1849 = in.m_68.y;
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1853 = _1851 != 0;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1857 = _572 + _1855;
    float _1859 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1861 = -_612;
    float _1863 = _1861 + 1.0;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _1865 = _247 > 0.5;
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1869 = _1867 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1871 = _1623;
    if (!_1853)
    {
        float _1873 = in.m_68.z;
        _1871 = _1873;
    }
    float _1875 = _1871;
    if (_1853)
    {
        _1044 = _247;
    }
    float _1877 = _1044;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1883 = 1.0 / _1869;
    bool _1885 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1887 = isnan(_572);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    bool _1897 = _1843 > 0.5;
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1899;
    bool _1903 = _1841 > 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1909 = _1877;
    if (!_1853)
    {
        _1909 = _1841;
    }
    float _1911 = _1909;
    float _1913 = 1.0 / _1881;
    float _1915 = -_1895;
    float _1917 = _1915 + 1.0;
    float _1919 = -_203;
    int _1921 = _1897 ? as_type<int>(_1919) : as_type<int>(_203);
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1927 = _1849 > 0.5;
    float _1929 = exp2(_1859);
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1933 = _1931 != 0;
    float _1935 = -_193;
    int _1937 = _1927 ? as_type<int>(_1935) : as_type<int>(_193);
    bool _1939 = !_1933;
    float _1941 = _1939 ? _193 : as_type<float>(_1937);
    float _1943 = 1.0 / _1925;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1947 = _1945 != 0;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1951 = -_193;
    int _1953 = _1903 ? as_type<int>(_1951) : as_type<int>(_193);
    float _1955 = _1907 * _1913;
    if (!_1853)
    {
        _1645 = _1849;
    }
    float _1957 = _1645;
    float _1959 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1949);
    bool _1961 = !_1947;
    float _1963 = _1961 ? _193 : as_type<float>(_1953);
    float _1965 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1969 = _1967 != 0;
    float _1971 = fma(_1955, _1857, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1973 = -_193;
    int _1975 = _1865 ? as_type<int>(_1973) : as_type<int>(_193);
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1979 = _1957;
    if (!_1853)
    {
        _1136 = _1957;
    }
    float _1981 = _1136;
    float _1983 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1959);
    float _1985 = _1981;
    if (_1853)
    {
        _1979 = _1849;
    }
    float _1987 = _1979;
    float _1989 = _1901 * _1943;
    bool _1991 = !_1969;
    float _1993 = _1991 ? _193 : as_type<float>(_1975);
    float _1995 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1997 = _1875;
    float _1999 = _1987;
    if (!_1853)
    {
        _1314 = _1875;
    }
    float _2001 = _1314;
    float _2003 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2005 = _2001;
    if (_1853)
    {
        _2005 = _1987;
    }
    float _2007 = _2005;
    float _2009 = fma(_1989, _1847, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1853)
    {
        _1997 = _1987;
    }
    float _2011 = _1997;
    float _2013 = _1993 + 0.5;
    if (_1853)
    {
        _1985 = _247;
    }
    float _2015 = _1985;
    float _2017 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1853)
    {
        _1999 = _247;
    }
    float _2019 = _1999;
    float _2021 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2025 = _2023 != 0;
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2029 = _2027 != 0;
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2021);
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2035 = _2033 != 0;
    float _2037 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2003);
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2039;
    bool _2043 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2045 = isnan(_572);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1977);
    bool _2057 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2059 = isnan(_572);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = _2041 * _1883;
    float _2071 = fma(_1965, _1965, 1.0);
    float _2073 = -_2053;
    float _2075 = _2073 + 1.0;
    bool _2077 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2079 = isnan(_572);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2085 = _2081 || _2083;
    float _2087 = float(_2085);
    float _2089 = -_2067;
    float _2091 = _2089 + 1.0;
    bool _2093 = !_2025;
    float _2095 = _2093 ? _203 : as_type<float>(_1921);
    float _2097 = _1895 * _2075;
    float _2099 = rsqrt(_2071);
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2103 = _572 + _2101;
    float _2105 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2107 = _2087 * _1917;
    float _2109 = fma(_2069, _2103, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2111 = _2009 * _2107;
    float _2113 = -_2087;
    float _2115 = _2113 + 1.0;
    float _2117 = _2053 * _2091;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2121 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2111);
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2125 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2127 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2119);
    float _2129 = _1965 * _2099;
    float _2131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2133 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2123);
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2137 = _2129 * _2135;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2141 = _2129 * _2139;
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2145 = _2129 * _2143;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2149 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2137);
    float _2151 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2141);
    float _2153 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2145);
    float _2155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2157 = fma(_1971, _2097, _2121);
    float _2159 = -_2147;
    float _2161 = fma(_2105, 2.0, _2159);
    out.m_76.x = _2149;
    out.m_76.y = _2151;
    out.m_76.z = _2153;
    float _2163 = fma(_2109, _2117, _2157);
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2167 = -_147;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2161);
    float _2171 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2127);
    float _2173 = -_2165;
    float _2175 = fma(_2125, 2.0, _2173);
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2179 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2133);
    float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2183 = -_147;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2175);
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2189 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2191 = _1963 + 0.5;
    float _2193 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2177);
    float _2195 = fma(_2017, -2.0, _2187);
    float _2197 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2199 = _1941 + 0.5;
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2203 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2195);
    float _2205 = -_203;
    int _2207 = _1903 ? as_type<int>(_2205) : as_type<int>(_203);
    float _2209 = fma(_2197, _2199, _2169);
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2213 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2215 = fma(_2189, _2191, _2185);
    float _2217 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2193);
    float _2219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2221 = fma(_2213, -2.0, _2211);
    float _2223 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2225 = !_2029;
    float _2227 = _2225 ? _203 : as_type<float>(_2207);
    float _2229 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2163);
    float _2231 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2221);
    float _2233 = -_203;
    int _2235 = _1927 ? as_type<int>(_2233) : as_type<int>(_203);
    float _2237 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2223);
    float _2239 = abs(_692);
    float _2241 = log2(_2239);
    float _2243 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2245 = _2095 + (-0.5);
    bool _2247 = !_2035;
    float _2249 = _2247 ? _203 : as_type<float>(_2235);
    float _2251 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2253 = _2227 + (-0.5);
    float _2255 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2237);
    float _2257 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2261 = -_2243;
    float _2263 = -_2203;
    float _2265 = fma(_2261, _2245, _2263);
    float _2267 = -_2251;
    float _2269 = -_2231;
    float _2271 = fma(_2267, _2253, _2269);
    float _2273 = -_1983;
    float _2275 = _2273 + 1.0;
    float _2277 = -_2249;
    float _2279 = _2277 + 0.5;
    float _2281 = -_2171;
    float _2283 = _2281 + 1.0;
    float _2285 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    float _2287 = _2257 * _2219;
    float _2289 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2291 = -_2275;
    float _2293 = fma(_1941, _2291, _2209);
    float _2295 = -_2179;
    float _2297 = _2295 + 1.0;
    float _2299 = -_2217;
    float _2301 = _2299 + 1.0;
    float _2303 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2305 = fma(_2227, _2283, _2271);
    float _2307 = exp2(_2289);
    float _2309 = _2285 + _1364;
    float _2311 = -_2297;
    float _2313 = fma(_1963, _2311, _2215);
    float _2315 = _2303 * _2259;
    float _2317 = fma(_2095, _2301, _2265);
    float _2319 = _2309 * 0.5;
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1364;
    bool _2321 = _692 <= 8000.0;
    bool _2323 = isnan(_692);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan(8000.0);
    bool _2329 = _2325 || _2327;
    float _2331 = float(_2329);
    float _2333 = _2229 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _2287;
    out.m_78.y = _2315;
    out.m_78.z = _2313;
    out.m_78.w = _2317;
    float _2335 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    out.m_80.w = _2333;
    out.m_82.x = _2293;
    out.m_82.y = _2305;
    float _2339 = -_1929;
    float _2341 = _2339 + 1.0;
    if (!_1332)
    {
        _1398 = 1.0;
    }
    float _2343 = _1398;
    float _2345 = _2343;
    float _2347 = _1835;
    if (_1332)
    {
        bool _2349 = _1434 >= _1394;
        bool _2351 = isnan(_1434);
        bool _2353 = _2349 || _2351;
        bool _2355 = isnan(_1394);
        bool _2357 = _2353 || _2355;
        float _2359 = float(_2357);
        _2345 = _2359;
    }
    float _2361 = _2345;
    float _2363 = fma(_2337, -2.0, 3.0);
    float _2365 = _2337 * _2337;
    out.m_84.z = _2319;
    out.m_84.w = _1364;
    bool _2367 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2369 = isnan(_1615);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2375 = _2371 || _2373;
    float _2377 = _2361 * _1593;
    float _2379 = _2365 * _2363;
    float _2381 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2383 = -_2379;
    float _2385 = _2383 + 1.0;
    float _2387 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2379);
    float _2389 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2391 = _2331 * _2387;
    float _2393 = _2389 * _1436;
    float _2395 = -_2389;
    float _2397 = _2395 + 1.0;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2401 = _1447 * _2393;
    float _2403 = _1447 * _2397;
    float _2405 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2407 = _1863 * _2399;
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = -_2409;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2415 = _2409;
    if (!_2375)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2417 = _2415;
    float _2419 = -_2377;
    float _2421 = fma(_2419, _2413, 1.0);
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = _1839 * _2393;
    float _2427 = fma(_1837, _2401, _1443);
    float _2429 = fma(_1835, _2401, _1441);
    float _2431 = _2423 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2433 = fma(_1447, _2425, _1445);
    float _2435 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2437 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2439 = _2417;
    float _2441 = _2417;
    if (!_2375)
    {
        _2347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2443 = _2347;
    out.m_86.x = _2431;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2375)
    {
        _1467 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2449 = _1467;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2375)
    {
        _1469 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2455 = _1469;
    out.m_88.x = _2429;
    out.m_88.y = _2427;
    out.m_88.z = _2433;
    out.m_88.w = _2403;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2375)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2461 = _1471;
    float _2463 = _2461;
    float _2465 = _2461;
    if (!_2375)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2467 = _1473;
    out.m_90.x = _2405;
    out.m_90.y = _2435;
    out.m_90.z = _2437;
    bool _2469 = !_2375;
    float _2471 = _2467;
    float _2473 = _2467;
    if (!_2469)
    {
        bool _2475 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2477 = isnan(_1615);
        bool _2479 = _2475 || _2477;
        bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2483 = _2479 || _2481;
        if (!_2483)
        {
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2487 = _1615 + _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2491 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2489;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2497 = 1.0 / _2491;
            float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2515 = _2487 * _2497;
            float _2517 = precise::clamp(_2515, 0.0, 1.0);
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2523 = fma(_2517, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2525 = fma(_2517, _2521, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2527 = fma(_2517, _2501, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2529 = fma(_2517, _2505, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2531 = fma(_2517, _2509, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2533 = fma(_2517, _2513, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2453 = _2527;
            _2473 = _2531;
            _2447 = _2523;
            _2465 = _2529;
            _2459 = _2525;
            _2441 = _2533;
            _2535 = true;
        }
        else
        {
            bool _2537 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2539 = isnan(_1615);
            bool _2541 = _2537 || _2539;
            bool _2543 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2545 = _2541 || _2543;
            if (!_2545)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2547 = _2445;
            _2447 = _2547;
            if (!_2545)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2549 = _2451;
            _2453 = _2549;
            if (!_2545)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2551 = _2457;
            _2459 = _2551;
            if (!_2545)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2553 = _2463;
            _2465 = _2553;
            if (!_2545)
            {
                _2471 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2555 = _2471;
            _2473 = _2555;
            if (!_2545)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2557 = _2439;
            bool _2559 = !_2545;
            _2441 = _2557;
            if (!_2559)
            {
                bool _2561 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2563 = isnan(_1615);
                bool _2565 = _2561 || _2563;
                bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2569 = _2565 || _2567;
                if (!_2569)
                {
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2573 = _1615 + _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2577 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2575;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2583 = 1.0 / _2577;
                    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2593 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2601 = _2573 * _2583;
                    float _2603 = precise::clamp(_2601, 0.0, 1.0);
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2609 = fma(_2603, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2611 = fma(_2603, _2607, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2613 = fma(_2603, _2587, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2615 = fma(_2603, _2591, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2617 = fma(_2603, _2595, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2619 = fma(_2603, _2599, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2453 = _2613;
                    _2473 = _2617;
                    _2447 = _2609;
                    _2465 = _2615;
                    _2459 = _2611;
                    _2441 = _2619;
                    _2535 = true;
                }
                else
                {
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2473 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2535 = false;
    float _2621 = _2453;
    float _2623 = _2473;
    float _2625 = _2447;
    float _2627 = _2465;
    float _2629 = _2459;
    float _2631 = _2441;
    float _2633 = fma(_2435, -0.5, 0.5);
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    float _2637 = -_2621;
    float _2639 = _2637 + _2623;
    float _2641 = _2381 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2643 = -_2625;
    float _2645 = _2643 + _2627;
    out.m_92.x = 0.0;
    float _2647 = fma(_2635, _2639, _2621);
    float _2649 = fma(_2635, _2645, _2625);
    out.m_59.x = _2641;
    float _2651 = -_2629;
    float _2653 = _2651 + _2631;
    float _2655 = _2647 * 0.586610972881317138671875;
    bool _2657 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2659 = fma(_2635, _2653, _2629);
    float _2661 = fma(_2649, 0.298911988735198974609375, _2655);
    bool _2663 = _1529 > 0.0;
    bool _2665 = isnan(_1529);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(0.0);
    bool _2671 = _2667 || _2669;
    float _2673 = fma(_2659, 0.114477999508380889892578125, _2661);
    float _2675 = -_2673;
    float _2677 = _2649 + _2675;
    float _2679 = -_2673;
    float _2681 = _2647 + _2679;
    float _2683 = -_2673;
    float _2685 = _2659 + _2683;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    float _2689 = fma(_2681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    bool _2693 = !_2657;
    if (!_2693)
    {
        float _2695 = -_1262;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2699 = -_1264;
        float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2703 = -_1266;
        float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2707 = _2697 * _2697;
        float _2709 = fma(_2701, _2701, _2707);
        float _2711 = fma(_2705, _2705, _2709);
        float _2713 = sqrt(_2711);
        float _2715 = rsqrt(_2711);
        float _2717 = -_2713;
        float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2721 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = _2701 * _2715;
        float _2727 = _2697 * _2715;
        float _2729 = abs(_2723);
        float _2731 = log2(_2729);
        float _2733 = _2705 * _2715;
        float _2735 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2737 = _2435 * _2727;
        float _2739 = -_2727;
        float _2741 = -_2735;
        float _2743 = fma(_2739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2741);
        float _2745 = fma(_2405, _2725, _2737);
        float _2747 = -_2733;
        float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2743);
        float _2751 = fma(_2437, _2733, _2745);
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2757 = _2749 + _2755;
        float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = exp2(_2759);
        float _2767 = _2765 * _2763;
        float _2769 = _2753 * _2767;
        float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2771;
        out.m_92.y = _2773;
        out.m_92.z = _2775;
    }
    out.m_94.x = _2687;
    out.m_94.y = _2689;
    out.m_94.z = _2691;
    if (_2671)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2777 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2777;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2535 = false;
    bool _564 = false;
    bool _351 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2834 = as_type<float>(_129);
        out.gl_Position.z = _2834;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2902 = as_type<float>(_165);
        out.gl_Position.z = _2902;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_66.x;
    float _171 = in.m_66.y;
    float _173 = in.m_66.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _205;
    float _215 = _207;
    float _217 = _209;
    float _235;
    if (!_211)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_113);
        float _241 = 1.0 / _239;
        float _243 = _147 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = in.m_68.x;
    float _249 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _245 + _251;
    bool _255 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_245);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -_265;
    float _273 = _271 + 1.0;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _269;
    float _279 = _249 * _247;
    float _281 = _253 * _277;
    bool _283 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_245);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = trunc(_279);
    int _305 = int(_303);
    float _307 = _293 * _273;
    float _309 = fma(_297, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = fma(_301, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -_293;
    float _315 = _313 + 1.0;
    float _317 = _309 * _307;
    float _319 = _311 * _307;
    float _321 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    int _329 = _305 << 4;
    int _331 = _329 + 1712;
    bool _333 = !_275;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _337 = _247 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    uint _362 = uint(int(uint(_331) >> uint(2)));
    uint _364 = uint(int(uint(int(_362)) >> uint(2)));
    int _366 = int(_362) & 3;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[int(_364)][_366];
    int _370 = int(_362) + 1;
    uint _372 = uint(int(uint(_370) >> uint(2)));
    int _374 = _370 & 3;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[int(_372)][_374];
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _386 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _388 = isnan(_359);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    int _398 = _331 + 8;
    uint _400 = uint(int(uint(_398) >> uint(2)));
    uint _402 = uint(int(uint(int(_400)) >> uint(2)));
    int _404 = int(_400) & 3;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[int(_402)][_404];
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _412 = 1.0 / _380;
    bool _414 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = isnan(_359);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    float _430 = -_396;
    float _432 = _430 + 1.0;
    bool _434 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_359);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = _424 * _432;
    float _452 = 1.0 / _384;
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _359 + _458;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _464 = _444 * _456;
    float _466 = -_444;
    float _468 = _466 + 1.0;
    float _470 = 1.0 / _410;
    float _472 = _428 * _412;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _359 + _474;
    float _478 = fma(_472, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _482 = _359 + _480;
    float _484 = _448 * _452;
    bool _486 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = isnan(_359);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _498;
    float _502 = _478 * _464;
    float _504 = fma(_484, _482, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[115].x, _502);
    float _512 = _500 * _470;
    float _514 = _396 * _508;
    float _516 = fma(_504, _450, _510);
    float _518 = fma(_512, _460, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _520 = _368 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _524 = fma(_518, _514, _516);
    float _526 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _528 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[118].x, _524);
    float _530 = _522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _406 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _534 = in.m_70.x;
    float _536 = in.m_70.y;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _526;
    out.m_72.y = _530;
    out.m_72.z = _540;
    out.m_72.w = _538;
    float _542 = _327 * _536;
    float _544 = _325 * _534;
    bool _546 = !_462;
    float _562;
    if (!_546)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _550 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_113);
        float _568 = 1.0 / _566;
        float _570 = _147 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = in.m_56.x;
    float _576 = in.m_56.y;
    float _578 = in.m_56.z;
    float _580 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _582 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _580);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _582);
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _584);
    float _590 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _586);
    float _592 = _588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _594 = _590 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _596 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _598 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _600 = floor(_596);
    float _602 = floor(_598);
    float _604 = -_600;
    float _606 = _596 + _604;
    float _608 = -_602;
    float _610 = _598 + _608;
    float2 _3622 = float2(_606, _610);
    float _612 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3622, float2(0.0), isnan(_3622)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3622, float2(0.0), isnan(_3622)), level(0.0)).x;
    float _614 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _616 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _614);
    float _620 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _618);
    float _622 = _620 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _626 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _624);
    float _628 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[11].z, _626);
    float _630 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _632 = _628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _634 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _630);
    float _636 = 1.0 / _632;
    float _638 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[10].z, _634);
    float _640 = _638 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _642 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _644 = _640 + _632;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _648 = _642 * _646;
    float _650 = _644 * _636;
    float _652 = _650 * 0.5;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _658 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[30].w, _656);
    float _660 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _662 = _616 * _654;
    float _664 = 1.0 / _658;
    float _666 = _622 + _660;
    float _668 = _662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _670 = _662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _672 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _674 = _666 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[26].x, _668);
    float _678 = _666 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _680 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[127].x, _674);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _676);
    float _684 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[126].x, _678);
    float _686 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[127].z, _680);
    float _688 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _664 * _690;
    float _694 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[126].z, _684);
    float _696 = _686 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _688);
    float _700 = _682 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _702 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = _694 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _706 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _708 = trunc(_696);
    int _710 = int(_708);
    bool _712 = !_702;
    int _714 = _712 ? 0 : 1;
    float _716 = _698 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _718 = _594 + _700;
    float _720 = _592 + _716;
    float _722 = trunc(_704);
    int _724 = int(_722);
    int _726 = 2;
    float _728 = _720;
    float _730 = _704;
    if (!_702)
    {
        _726 = 1;
    }
    int _732 = _726;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _736 = _720 + _734;
    int _738 = _732;
    if (!_706)
    {
        _738 = _714;
    }
    int _740 = _738;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _744 = _718 + _742;
    int _746 = _740 << 6;
    float _748 = _744 * _744;
    int _750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _752 = _710 + _750;
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
    float _774 = fma(_736, _736, _748);
    int _776 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _778 = _724 + _776;
    int _780 = _778 + 1;
    float _782 = sqrt(_774);
    int _784 = _746 + 56;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    bool _802 = _780 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _804 = _780 | _754;
    bool _806 = _804 < 0;
    bool _808 = _806 || _802;
    int _810 = _746 + 64;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    uint _814 = uint(int(uint(int(_812)) >> uint(2)));
    int _816 = int(_812) & 3;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[int(_814)][_816];
    int _820 = int(_812) + 1;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    int _824 = _820 & 3;
    float _826 = (*spvDescriptorSet0.vp_c15)._m0[int(_822)][_824];
    float _828 = _662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _830 = _754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _832 = _830 || _808;
    float _834 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[25].x, _828);
    bool _836 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _838 = _746 + 72;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c15)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    float _856 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _834);
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _860 = _746 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    int _878 = as_type<int>(_834);
    float _880 = as_type<float>(_780);
    float _882 = as_type<float>(_754);
    float _884 = _828;
    float _886 = _782;
    float _888 = as_type<float>(_740);
    if (!_832)
    {
        int _890 = _754 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _892 = _890 + _780;
        _878 = _892;
    }
    int _894 = _878;
    float _896 = _622 + _858;
    if (!_836)
    {
        _880 = _718;
    }
    float _898 = _880;
    int _900 = 0;
    float _902 = _898;
    if (!_832)
    {
        int _904 = _894 << 2;
        _900 = _904;
    }
    int _906 = _900;
    int _908 = _746 + 104;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    uint _912 = uint(int(uint(int(_910)) >> uint(2)));
    int _914 = int(_910) & 3;
    float _916 = (*spvDescriptorSet0.vp_c15)._m0[int(_912)][_914];
    int _918 = int(_910) + 1;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    int _922 = _918 & 3;
    float _924 = (*spvDescriptorSet0.vp_c15)._m0[int(_920)][_922];
    int _926 = 0;
    int _928 = _906;
    if (!_832)
    {
        uint _930 = uint(int(uint(_894) >> uint(2)));
        _926 = int(_930);
    }
    int _932 = _926;
    if (!_832)
    {
        int _934 = 12 & _906;
        _928 = _934;
    }
    int _936 = _928;
    if (!_836)
    {
        _882 = _896;
    }
    float _938 = _882;
    bool _940 = !_836;
    float _942 = _938;
    float _944 = _818;
    if (!_940)
    {
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _950 = _782 + _948;
        float _952 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = rsqrt(_774);
        float _956 = _950 * _946;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _958 * 6.283185482025146484375;
        float _962 = cos(_960);
        float _964 = _958 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 + (-1.0);
        float _970 = fma(_966, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _972 = _968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _954 * _970;
        float _976 = fma(_896, _962, _972);
        float _978 = fma(_736, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _980 = fma(_744, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _942 = _976;
        _728 = _978;
        _902 = _980;
        _884 = _968;
        _886 = _958;
    }
    float _982 = _942;
    float _984 = _728;
    float _986 = _902;
    float _988 = _884;
    float _990 = _886;
    float _992 = _988;
    float _994 = _990;
    float _996 = _984;
    float _998 = _982;
    float _1000 = _986;
    if (!_832)
    {
        int _1002 = _932 << 4;
        int _1004 = _1002 + _936;
        _992 = as_type<float>(_1004);
    }
    float _1006 = _992;
    float _1008 = -_622;
    float _1010 = _1008 + _982;
    int _1012 = _746 + 80;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    float _1030 = -_592;
    float _1032 = _1030 + _984;
    float _1034 = -_594;
    float _1036 = _1034 + _986;
    float _1038 = _1010 * _1010;
    float _1040 = _666 * _876;
    float _1042 = _1010;
    float _1044 = _1040;
    if (!_832)
    {
        float _1046 = floor(_696);
        _994 = _1046;
    }
    float _1048 = _994;
    float _1050 = _666 * _826;
    float _1052 = fma(_1032, _1032, _1038);
    int _1054 = _746 + 88;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c15)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    float _1072 = fma(_592, _868, _1040);
    float _1074 = fma(_592, _818, _1050);
    float _1076 = fma(_1036, _1036, _1052);
    float _1078 = fma(_594, _916, _1072);
    float _1080 = _666 * _772;
    float _1082 = sqrt(_1076);
    float _1084 = _1006;
    float _1086 = _1074;
    float _1088 = _1048;
    if (!_832)
    {
        int _1090 = as_type<int>(_1006) + 400;
        uint _1092 = uint(int(uint(_1090) >> uint(2)));
        uint _1094 = uint(int(uint(int(_1092)) >> uint(2)));
        int _1096 = int(_1092) & 3;
        float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = _1078 + _924;
    float _1104 = fma(_592, _764, _1080);
    float _1106 = fma(_594, _846, _1074);
    bool _1108 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1110 = isnan(0.5);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_594, _792, _1104);
    float _1120 = _1038;
    if (!_832)
    {
        float _1122 = floor(_704);
        _1120 = _1122;
    }
    float _1124 = _1120;
    float _1126 = _1106 + _854;
    float _1128 = _1118 + _800;
    bool _1130 = _1082 > 0.0;
    float _1132 = 1.0 / _1102;
    bool _1134 = !_1130;
    float _1136 = _1082;
    if (!_1134)
    {
        float _1138 = _207 * _207;
        float _1140 = rsqrt(_1076);
        float _1142 = fma(_205, _205, _1138);
        float _1144 = fma(_209, _209, _1142);
        float _1146 = sqrt(_1144);
        float _1148 = _1032 * _1140;
        float _1150 = _1010 * _1140;
        float _1152 = _1036 * _1140;
        bool _1154 = _1146 > 0.0;
        bool _1156 = !_1154;
        _1086 = _1152;
        if (!_1156)
        {
            float _1158 = rsqrt(_1144);
            float _1160 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1162 = _207 * _1158;
            float _1164 = _205 * _1158;
            float _1166 = _1150 * _1162;
            float _1168 = _209 * _1158;
            float _1170 = fma(_1148, _1164, _1166);
            float _1172 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1174 = fma(_1152, _1168, _1170);
            float _1176 = _1174 * _1172;
            float _1178 = fma(_205, _1176, _984);
            float _1180 = fma(_207, _1176, _982);
            float _1182 = fma(_209, _1176, _986);
            _996 = _1178;
            _998 = _1180;
            _1000 = _1182;
            _944 = _1172;
        }
    }
    float _1184 = _996;
    float _1186 = _998;
    float _1188 = _1000;
    float _1190 = _944;
    float _1192 = _1086;
    float _1194 = _1186;
    float _1196 = _1190;
    float _1198 = _1192;
    if (_1116)
    {
        _213 = _1184;
    }
    float _1200 = _213;
    float _1202 = _1200;
    if (_1116)
    {
        _215 = _1186;
    }
    float _1204 = _215;
    float _1206 = _1204;
    if (_1116)
    {
        _217 = _1188;
    }
    float _1208 = _217;
    float _1210 = _1208;
    if (!_1116)
    {
        float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1214 = _622 + _1212;
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1218 = _592 + _1216;
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1222 = -_622;
        float _1224 = _1222 + _1186;
        float _1226 = _1214 * _1214;
        float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1230 = _594 + _1228;
        float _1232 = -_592;
        float _1234 = _1232 + _1184;
        float _1236 = -_594;
        float _1238 = _1236 + _1188;
        float _1240 = fma(_1218, _1218, _1226);
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1244 = fma(_1230, _1230, _1240);
        float _1246 = sqrt(_1244);
        float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1250 = precise::min(_1246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1252 = _1250 * _1242;
        float _1254 = _1248 * _1252;
        float _1256 = fma(_1224, _1254, _622);
        float _1258 = fma(_1234, _1254, _592);
        float _1260 = fma(_1238, _1254, _594);
        _1206 = _1256;
        _1202 = _1258;
        _1210 = _1260;
        _1194 = _1224;
    }
    float _1262 = _1206;
    float _1264 = _1202;
    float _1266 = _1210;
    float _1268 = _1194;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1272 = _1128 * _1132;
    float _1274 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1278 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1270);
    float _1280 = _1126 * _1132;
    float _1282 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    bool _1284 = _1272 >= 0.0;
    float _1286 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1278);
    float _1288 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1276);
    float _1290 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1292 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1282);
    float _1294 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1296 = _1272 <= 1.0;
    bool _1298 = _1296 && _1284;
    float _1300 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1288);
    float _1302 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1290);
    float _1304 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1308 = _1280 >= 0.0;
    bool _1310 = _1308 && _1298;
    float _1312 = _1302;
    float _1314 = _1268;
    if (!_832)
    {
        float _1316 = rint(_1100);
        float _1318 = precise::max(_1316, 0.0);
        uint _1320 = uint(_1318);
        uint _1322 = clamp(_1320, 0u, 65535u);
        _1196 = as_type<float>(_1322);
    }
    float _1324 = _1196;
    float _1326 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1328 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1306);
    bool _1330 = _1280 <= 1.0;
    bool _1332 = _1330 && _1310;
    float _1334 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_832)
    {
        float _1338 = -_1048;
        float _1340 = _696 + _1338;
        _1088 = _1340;
    }
    float _1342 = _1088;
    if (!_832)
    {
        float _1344 = -_1124;
        float _1346 = _704 + _1344;
        _1198 = _1346;
    }
    float _1348 = _1198;
    float _1350 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1354 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1328);
    float _1356 = _666 * _1028;
    float _1358 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = -_1352;
    float _1362 = fma(_1360, _1334, 1.0);
    float _1364 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1354);
    float _1366 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1332)
    {
        float _1368 = float(_740);
        _1312 = _1368;
    }
    float _1370 = _1312;
    float _1372 = fma(_592, _1020, _1356);
    float _1374 = 1.0 / _1364;
    float _1376 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1378 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1380 = fma(_594, _1062, _1372);
    float _1382 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1384 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1378);
    float _1386 = _1380 + _1070;
    float _1388 = log2(_1362);
    float _1390 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1382);
    float _1392 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1384);
    float _1394 = _1386 * _1132;
    float _1396 = _1370;
    float _1398 = _1392;
    if (_1332)
    {
        float _1400 = rint(_1370);
        float _1402 = precise::max(_1400, 0.0);
        uint _1404 = uint(_1402);
        uint _1406 = clamp(_1404, 0u, 65535u);
        _1396 = as_type<float>(_1406);
    }
    float _1408 = _1396;
    float _1410 = _1390 * _1374;
    float _1412 = _1392 * _1374;
    float _1414 = fma(_1410, 0.5, 0.5);
    float _1416 = fma(_1412, -0.5, 0.5);
    float _1418 = _1388 * 0.693147182464599609375;
    float _1420 = _1342;
    if (!_832)
    {
        float3 _4972 = float3(_1348, _1342, float(as_type<int>(_1324)));
        float3 _4976 = select(_4972, float3(0.0), isnan(_4972));
        float _1422 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4976.xy, uint(rint(_4976.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4976.xy, uint(rint(_4976.z)), level(0.0)).x;
        _1420 = _1422;
    }
    float _1424 = _1420;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1428 = _1124;
    float _1430 = _1408;
    if (_1332)
    {
        float3 _4996 = float3(_1272, _1280, float(as_type<int>(_1408)));
        float3 _4998 = select(_4996, float3(0.0), isnan(_4996));
        float _1432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4998.xy, uint(rint(_4998.z)), _1394, level(0.0));
        _1428 = _1432;
    }
    float _1434 = _1428;
    float3 _5008 = float3(_1414, _1416, _1426);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5008, float3(0.0), isnan(_5008)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5008, float3(0.0), isnan(_5008)), level(0.0)).x;
    float3 _5017 = float3(_1414, _1416, _1426);
    float4 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5017, float3(0.0), isnan(_5017)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5017, float3(0.0), isnan(_5017)), level(0.0)).xyzw;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = _1439.w;
    bool _1449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1451 = isnan(0.5);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1457 = _1453 || _1455;
    if (_832)
    {
        _888 = 1.0;
    }
    float _1459 = _888;
    float _1461 = _1459;
    if (_1457)
    {
        _730 = 1.0;
    }
    float _1463 = _730;
    float _1465 = _1463;
    float _1467 = _1447;
    float _1469 = _1445;
    float _1471 = _1443;
    float _1473 = _1441;
    if (!_1457)
    {
        float _1475 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1481 = _1477 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1479 * 0.15915493667125701904296875;
        float _1487 = _1477 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = 1.0 / _1483;
        float _1493 = _1485 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = _1485 * 6.283185482025146484375;
        float _1501 = sin(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = 1.0 / _1503;
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1507;
        float _1511 = 1.0 / _1509;
        float _1513 = _1501 * _1505;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1517 = fma(_692, _1513, _1515);
        float _1519 = _1517 * _1511;
        float _1521 = precise::clamp(_1519, 0.0, 1.0);
        float _1523 = -_1521;
        float _1525 = _1523 + 1.0;
        _1430 = _1477;
        _1465 = _1525;
    }
    float _1527 = _1430;
    float _1529 = _1465;
    float _1531 = _1527;
    if (!_832)
    {
        int _1533 = _894 << 4;
        int _1535 = _1533 + 2048;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
        int _1541 = int(_1537) & 3;
        float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
        int _1545 = int(_1537) + 1;
        uint _1547 = uint(int(uint(_1545) >> uint(2)));
        int _1549 = _1545 & 3;
        float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
        int _1553 = _1535 + 8;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
        int _1559 = int(_1555) & 3;
        float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
        int _1563 = int(_1555) + 1;
        uint _1565 = uint(int(uint(_1563) >> uint(2)));
        int _1567 = _1563 & 3;
        float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
        float _1571 = _666 * _1551;
        float _1573 = fma(_592, _1543, _1571);
        float _1575 = fma(_594, _1561, _1573);
        float _1577 = _1575 + _1569;
        float _1579 = precise::clamp(_1577, 0.0, 1.0);
        float _1581 = -_1579;
        float _1583 = _1581 + _1424;
        float _1585 = fma(_1583, 500.0, 1.5);
        float _1587 = exp2(_1585);
        float _1589 = 0.0 + _1587;
        float _1591 = precise::clamp(_1589, 0.0, 1.0);
        _1461 = _1591;
    }
    float _1593 = _1461;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1597 = _1262 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1601 = _1264 + _1599;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1266 + _1603;
    float _1607 = _1597 * _1597;
    float _1609 = fma(_1601, _1601, _1607);
    float _1611 = fma(_1605, _1605, _1609);
    float _1613 = rsqrt(_1611);
    float _1615 = sqrt(_1611);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1619 = _1601 * _1617;
    float _1621 = _1605 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 + _1625;
    float _1629 = sqrt(_1627);
    bool _1631 = _1629 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = _1629 + _1633;
    float _1637 = _1609;
    float _1639 = _1613;
    float _1641 = _1635;
    float _1643 = _1597;
    float _1645 = _1627;
    if (_1631)
    {
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1637 = _1647;
    }
    float _1649 = _1637;
    if (_1631)
    {
        float _1651 = rsqrt(_1627);
        _1639 = _1651;
    }
    float _1653 = _1639;
    float _1655 = _1653;
    if (_1631)
    {
        float _1657 = _1635 * _1649;
        _1641 = _1657;
    }
    float _1659 = _1641;
    if (_1631)
    {
        float _1661 = _1659 * 0.15915493667125701904296875;
        _1531 = _1661;
    }
    float _1663 = _1531;
    float _1665 = _1605;
    float _1667 = _1663;
    if (_1631)
    {
        float _1669 = _1663 * 6.283185482025146484375;
        float _1671 = sin(_1669);
        _1665 = _1671;
    }
    float _1673 = _1665;
    float _1675 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1677 = precise::max(0.0, _1675);
    float _1679 = _1649;
    float _1681 = _1677;
    if (_1631)
    {
        float _1683 = _1663 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        _1679 = _1685;
    }
    float _1687 = _1679;
    float _1689 = -_1617;
    float _1691 = -_1677;
    float _1693 = fma(_1597, _1689, _1691);
    if (_1631)
    {
        float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1695;
    }
    float _1697 = _1643;
    float _1699 = _1697;
    float _1701 = _1673;
    if (_1631)
    {
        float _1703 = fma(_1673, _1697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = _1705;
    if (!_1631)
    {
        _1701 = _1619;
    }
    float _1709 = _1701;
    float _1711 = _1709;
    float _1713 = _1687;
    if (_1631)
    {
        float _1715 = _1687 + (-1.0);
        _1681 = _1715;
    }
    float _1717 = _1681;
    float _1719 = _1717;
    if (_1631)
    {
        float _1721 = _1653 * _1705;
        _1042 = _1721;
    }
    float _1723 = _1042;
    if (!_1631)
    {
        _1707 = _1693;
    }
    float _1725 = _1707;
    float _1727 = _1725;
    if (_1631)
    {
        float _1729 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1729;
    }
    float _1731 = _1667;
    if (_1631)
    {
        float _1733 = _1619 * _1723;
        _1711 = _1733;
    }
    float _1735 = _1711;
    if (!_1631)
    {
        _1719 = _1621;
    }
    float _1737 = _1719;
    float _1739 = _1737;
    if (_1631)
    {
        float _1741 = _1621 * _1723;
        _1739 = _1741;
    }
    float _1743 = _1739;
    if (!_1631)
    {
        _1655 = _1623;
    }
    float _1745 = _1655;
    float _1747 = _1745;
    if (_1631)
    {
        float _1749 = fma(_1693, _1687, _1731);
        _1727 = _1749;
    }
    float _1751 = _1727;
    if (_1631)
    {
        float _1753 = _1735 * _1735;
        _1747 = _1753;
    }
    float _1755 = _1747;
    if (!_1631)
    {
        _1713 = _1625;
    }
    float _1757 = _1713;
    float _1759 = _1757;
    if (_1631)
    {
        float _1761 = _1743 * _1743;
        _1759 = _1761;
    }
    float _1763 = _1759;
    float _1765 = fma(_1751, _1751, _1755);
    float _1767 = _1765 + _1763;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1771 = fma(_1615, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1769);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = rsqrt(_1767);
    float _1777 = -_1773;
    float _1779 = _1777 + 1.0;
    float _1781 = abs(_1779);
    float _1783 = log2(_1781);
    float _1785 = _1775 * _1735;
    float _1787 = _1775 * _1751;
    float _1789 = _1775 * _1743;
    float _1791 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1793 = -_1791;
    float _1795 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1793);
    float _1797 = -_1789;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1795);
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1803 = fma(_1799, -0.5, 0.5);
    float _1805 = fma(_1799, 0.5, 0.5);
    float _1807 = exp2(_1801);
    float _1809 = fma(_1805, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1811 = fma(_1805, _1809, -0.212114393711090087890625);
    float _1813 = _1787 + 1.0;
    float _1815 = sqrt(_1803);
    float _1817 = fma(_1805, _1811, 1.570728778839111328125);
    float _1819 = -_1787;
    float _1821 = fma(_1807, _1813, _1819);
    float _1823 = _1815 * 0.636619746685028076171875;
    float _1825 = fma(_1821, 0.5, 0.5);
    float _1827 = -_1817;
    float _1829 = fma(_1823, _1827, 1.0);
    float2 _5593 = float2(_1829, _1825);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5593, float2(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5593, float2(0.0), isnan(_5593)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = in.m_68.z;
    float _1843 = in.m_68.w;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1847 = _572 + _1845;
    float _1849 = in.m_68.y;
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1853 = _1851 != 0;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1857 = _572 + _1855;
    float _1859 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1861 = -_612;
    float _1863 = _1861 + 1.0;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _1865 = _247 > 0.5;
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1869 = _1867 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1871 = _1623;
    if (!_1853)
    {
        float _1873 = in.m_68.z;
        _1871 = _1873;
    }
    float _1875 = _1871;
    if (_1853)
    {
        _1044 = _247;
    }
    float _1877 = _1044;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1883 = 1.0 / _1869;
    bool _1885 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1887 = isnan(_572);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    bool _1897 = _1843 > 0.5;
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1899;
    bool _1903 = _1841 > 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1909 = _1877;
    if (!_1853)
    {
        _1909 = _1841;
    }
    float _1911 = _1909;
    float _1913 = 1.0 / _1881;
    float _1915 = -_1895;
    float _1917 = _1915 + 1.0;
    float _1919 = -_203;
    int _1921 = _1897 ? as_type<int>(_1919) : as_type<int>(_203);
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1927 = _1849 > 0.5;
    float _1929 = exp2(_1859);
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1933 = _1931 != 0;
    float _1935 = -_193;
    int _1937 = _1927 ? as_type<int>(_1935) : as_type<int>(_193);
    bool _1939 = !_1933;
    float _1941 = _1939 ? _193 : as_type<float>(_1937);
    float _1943 = 1.0 / _1925;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1947 = _1945 != 0;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1951 = -_193;
    int _1953 = _1903 ? as_type<int>(_1951) : as_type<int>(_193);
    float _1955 = _1907 * _1913;
    if (!_1853)
    {
        _1645 = _1849;
    }
    float _1957 = _1645;
    float _1959 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1949);
    bool _1961 = !_1947;
    float _1963 = _1961 ? _193 : as_type<float>(_1953);
    float _1965 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1969 = _1967 != 0;
    float _1971 = fma(_1955, _1857, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1973 = -_193;
    int _1975 = _1865 ? as_type<int>(_1973) : as_type<int>(_193);
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1979 = _1957;
    if (!_1853)
    {
        _1136 = _1957;
    }
    float _1981 = _1136;
    float _1983 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1959);
    float _1985 = _1981;
    if (_1853)
    {
        _1979 = _1849;
    }
    float _1987 = _1979;
    float _1989 = _1901 * _1943;
    bool _1991 = !_1969;
    float _1993 = _1991 ? _193 : as_type<float>(_1975);
    float _1995 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1997 = _1875;
    float _1999 = _1987;
    if (!_1853)
    {
        _1314 = _1875;
    }
    float _2001 = _1314;
    float _2003 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2005 = _2001;
    if (_1853)
    {
        _2005 = _1987;
    }
    float _2007 = _2005;
    float _2009 = fma(_1989, _1847, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1853)
    {
        _1997 = _1987;
    }
    float _2011 = _1997;
    float _2013 = _1993 + 0.5;
    if (_1853)
    {
        _1985 = _247;
    }
    float _2015 = _1985;
    float _2017 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1853)
    {
        _1999 = _247;
    }
    float _2019 = _1999;
    float _2021 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2025 = _2023 != 0;
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2029 = _2027 != 0;
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2021);
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2035 = _2033 != 0;
    float _2037 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2003);
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2039;
    bool _2043 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2045 = isnan(_572);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1977);
    bool _2057 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2059 = isnan(_572);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = _2041 * _1883;
    float _2071 = fma(_1965, _1965, 1.0);
    float _2073 = -_2053;
    float _2075 = _2073 + 1.0;
    bool _2077 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2079 = isnan(_572);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2085 = _2081 || _2083;
    float _2087 = float(_2085);
    float _2089 = -_2067;
    float _2091 = _2089 + 1.0;
    bool _2093 = !_2025;
    float _2095 = _2093 ? _203 : as_type<float>(_1921);
    float _2097 = _1895 * _2075;
    float _2099 = rsqrt(_2071);
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2103 = _572 + _2101;
    float _2105 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2107 = _2087 * _1917;
    float _2109 = fma(_2069, _2103, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2111 = _2009 * _2107;
    float _2113 = -_2087;
    float _2115 = _2113 + 1.0;
    float _2117 = _2053 * _2091;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2121 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2111);
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2125 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2127 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2119);
    float _2129 = _1965 * _2099;
    float _2131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2133 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2123);
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2137 = _2129 * _2135;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2141 = _2129 * _2139;
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2145 = _2129 * _2143;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2149 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2137);
    float _2151 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2141);
    float _2153 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2145);
    float _2155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2157 = fma(_1971, _2097, _2121);
    float _2159 = -_2147;
    float _2161 = fma(_2105, 2.0, _2159);
    out.m_76.x = _2149;
    out.m_76.y = _2151;
    out.m_76.z = _2153;
    float _2163 = fma(_2109, _2117, _2157);
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2167 = -_147;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2161);
    float _2171 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2127);
    float _2173 = -_2165;
    float _2175 = fma(_2125, 2.0, _2173);
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2179 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2133);
    float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2183 = -_147;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2175);
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2189 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2191 = _1963 + 0.5;
    float _2193 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2177);
    float _2195 = fma(_2017, -2.0, _2187);
    float _2197 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2199 = _1941 + 0.5;
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2203 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2195);
    float _2205 = -_203;
    int _2207 = _1903 ? as_type<int>(_2205) : as_type<int>(_203);
    float _2209 = fma(_2197, _2199, _2169);
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2213 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2215 = fma(_2189, _2191, _2185);
    float _2217 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2193);
    float _2219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2221 = fma(_2213, -2.0, _2211);
    float _2223 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2225 = !_2029;
    float _2227 = _2225 ? _203 : as_type<float>(_2207);
    float _2229 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2163);
    float _2231 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2221);
    float _2233 = -_203;
    int _2235 = _1927 ? as_type<int>(_2233) : as_type<int>(_203);
    float _2237 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2223);
    float _2239 = abs(_692);
    float _2241 = log2(_2239);
    float _2243 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2245 = _2095 + (-0.5);
    bool _2247 = !_2035;
    float _2249 = _2247 ? _203 : as_type<float>(_2235);
    float _2251 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2253 = _2227 + (-0.5);
    float _2255 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2237);
    float _2257 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2261 = -_2243;
    float _2263 = -_2203;
    float _2265 = fma(_2261, _2245, _2263);
    float _2267 = -_2251;
    float _2269 = -_2231;
    float _2271 = fma(_2267, _2253, _2269);
    float _2273 = -_1983;
    float _2275 = _2273 + 1.0;
    float _2277 = -_2249;
    float _2279 = _2277 + 0.5;
    float _2281 = -_2171;
    float _2283 = _2281 + 1.0;
    float _2285 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    float _2287 = _2257 * _2219;
    float _2289 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2291 = -_2275;
    float _2293 = fma(_1941, _2291, _2209);
    float _2295 = -_2179;
    float _2297 = _2295 + 1.0;
    float _2299 = -_2217;
    float _2301 = _2299 + 1.0;
    float _2303 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2305 = fma(_2227, _2283, _2271);
    float _2307 = exp2(_2289);
    float _2309 = _2285 + _1364;
    float _2311 = -_2297;
    float _2313 = fma(_1963, _2311, _2215);
    float _2315 = _2303 * _2259;
    float _2317 = fma(_2095, _2301, _2265);
    float _2319 = _2309 * 0.5;
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1364;
    bool _2321 = _692 <= 8000.0;
    bool _2323 = isnan(_692);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan(8000.0);
    bool _2329 = _2325 || _2327;
    float _2331 = float(_2329);
    float _2333 = _2229 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _2287;
    out.m_78.y = _2315;
    out.m_78.z = _2313;
    out.m_78.w = _2317;
    float _2335 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    out.m_80.w = _2333;
    out.m_82.x = _2293;
    out.m_82.y = _2305;
    float _2339 = -_1929;
    float _2341 = _2339 + 1.0;
    if (!_1332)
    {
        _1398 = 1.0;
    }
    float _2343 = _1398;
    float _2345 = _2343;
    float _2347 = _1835;
    if (_1332)
    {
        bool _2349 = _1434 >= _1394;
        bool _2351 = isnan(_1434);
        bool _2353 = _2349 || _2351;
        bool _2355 = isnan(_1394);
        bool _2357 = _2353 || _2355;
        float _2359 = float(_2357);
        _2345 = _2359;
    }
    float _2361 = _2345;
    float _2363 = fma(_2337, -2.0, 3.0);
    float _2365 = _2337 * _2337;
    out.m_84.z = _2319;
    out.m_84.w = _1364;
    bool _2367 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2369 = isnan(_1615);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2375 = _2371 || _2373;
    float _2377 = _2361 * _1593;
    float _2379 = _2365 * _2363;
    float _2381 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2383 = -_2379;
    float _2385 = _2383 + 1.0;
    float _2387 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2379);
    float _2389 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2391 = _2331 * _2387;
    float _2393 = _2389 * _1436;
    float _2395 = -_2389;
    float _2397 = _2395 + 1.0;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2401 = _1447 * _2393;
    float _2403 = _1447 * _2397;
    float _2405 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2407 = _1863 * _2399;
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = -_2409;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2415 = _2409;
    if (!_2375)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2417 = _2415;
    float _2419 = -_2377;
    float _2421 = fma(_2419, _2413, 1.0);
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = _1839 * _2393;
    float _2427 = fma(_1837, _2401, _1443);
    float _2429 = fma(_1835, _2401, _1441);
    float _2431 = _2423 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2433 = fma(_1447, _2425, _1445);
    float _2435 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2437 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2439 = _2417;
    float _2441 = _2417;
    if (!_2375)
    {
        _2347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2443 = _2347;
    out.m_86.x = _2431;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2375)
    {
        _1467 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2449 = _1467;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2375)
    {
        _1469 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2455 = _1469;
    out.m_88.x = _2429;
    out.m_88.y = _2427;
    out.m_88.z = _2433;
    out.m_88.w = _2403;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2375)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2461 = _1471;
    float _2463 = _2461;
    float _2465 = _2461;
    if (!_2375)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2467 = _1473;
    out.m_90.x = _2405;
    out.m_90.y = _2435;
    out.m_90.z = _2437;
    bool _2469 = !_2375;
    float _2471 = _2467;
    float _2473 = _2467;
    if (!_2469)
    {
        bool _2475 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2477 = isnan(_1615);
        bool _2479 = _2475 || _2477;
        bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2483 = _2479 || _2481;
        if (!_2483)
        {
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2487 = _1615 + _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2491 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2489;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2497 = 1.0 / _2491;
            float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2515 = _2487 * _2497;
            float _2517 = precise::clamp(_2515, 0.0, 1.0);
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2523 = fma(_2517, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2525 = fma(_2517, _2521, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2527 = fma(_2517, _2501, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2529 = fma(_2517, _2505, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2531 = fma(_2517, _2509, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2533 = fma(_2517, _2513, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2453 = _2527;
            _2473 = _2531;
            _2447 = _2523;
            _2465 = _2529;
            _2459 = _2525;
            _2441 = _2533;
            _2535 = true;
        }
        else
        {
            bool _2537 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2539 = isnan(_1615);
            bool _2541 = _2537 || _2539;
            bool _2543 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2545 = _2541 || _2543;
            if (!_2545)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2547 = _2445;
            _2447 = _2547;
            if (!_2545)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2549 = _2451;
            _2453 = _2549;
            if (!_2545)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2551 = _2457;
            _2459 = _2551;
            if (!_2545)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2553 = _2463;
            _2465 = _2553;
            if (!_2545)
            {
                _2471 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2555 = _2471;
            _2473 = _2555;
            if (!_2545)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2557 = _2439;
            bool _2559 = !_2545;
            _2441 = _2557;
            if (!_2559)
            {
                bool _2561 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2563 = isnan(_1615);
                bool _2565 = _2561 || _2563;
                bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2569 = _2565 || _2567;
                if (!_2569)
                {
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2573 = _1615 + _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2577 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2575;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2583 = 1.0 / _2577;
                    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2593 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2601 = _2573 * _2583;
                    float _2603 = precise::clamp(_2601, 0.0, 1.0);
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2609 = fma(_2603, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2611 = fma(_2603, _2607, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2613 = fma(_2603, _2587, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2615 = fma(_2603, _2591, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2617 = fma(_2603, _2595, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2619 = fma(_2603, _2599, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2453 = _2613;
                    _2473 = _2617;
                    _2447 = _2609;
                    _2465 = _2615;
                    _2459 = _2611;
                    _2441 = _2619;
                    _2535 = true;
                }
                else
                {
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2473 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2535 = false;
    float _2621 = _2453;
    float _2623 = _2473;
    float _2625 = _2447;
    float _2627 = _2465;
    float _2629 = _2459;
    float _2631 = _2441;
    float _2633 = fma(_2435, -0.5, 0.5);
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    float _2637 = -_2621;
    float _2639 = _2637 + _2623;
    float _2641 = _2381 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2643 = -_2625;
    float _2645 = _2643 + _2627;
    out.m_92.x = 0.0;
    float _2647 = fma(_2635, _2639, _2621);
    float _2649 = fma(_2635, _2645, _2625);
    out.m_59.x = _2641;
    float _2651 = -_2629;
    float _2653 = _2651 + _2631;
    float _2655 = _2647 * 0.586610972881317138671875;
    bool _2657 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2659 = fma(_2635, _2653, _2629);
    float _2661 = fma(_2649, 0.298911988735198974609375, _2655);
    bool _2663 = _1529 > 0.0;
    bool _2665 = isnan(_1529);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(0.0);
    bool _2671 = _2667 || _2669;
    float _2673 = fma(_2659, 0.114477999508380889892578125, _2661);
    float _2675 = -_2673;
    float _2677 = _2649 + _2675;
    float _2679 = -_2673;
    float _2681 = _2647 + _2679;
    float _2683 = -_2673;
    float _2685 = _2659 + _2683;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    float _2689 = fma(_2681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    bool _2693 = !_2657;
    if (!_2693)
    {
        float _2695 = -_1262;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2699 = -_1264;
        float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2703 = -_1266;
        float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2707 = _2697 * _2697;
        float _2709 = fma(_2701, _2701, _2707);
        float _2711 = fma(_2705, _2705, _2709);
        float _2713 = sqrt(_2711);
        float _2715 = rsqrt(_2711);
        float _2717 = -_2713;
        float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2721 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = _2701 * _2715;
        float _2727 = _2697 * _2715;
        float _2729 = abs(_2723);
        float _2731 = log2(_2729);
        float _2733 = _2705 * _2715;
        float _2735 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2737 = _2435 * _2727;
        float _2739 = -_2727;
        float _2741 = -_2735;
        float _2743 = fma(_2739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2741);
        float _2745 = fma(_2405, _2725, _2737);
        float _2747 = -_2733;
        float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2743);
        float _2751 = fma(_2437, _2733, _2745);
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2757 = _2749 + _2755;
        float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = exp2(_2759);
        float _2767 = _2765 * _2763;
        float _2769 = _2753 * _2767;
        float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2771;
        out.m_92.y = _2773;
        out.m_92.z = _2775;
    }
    out.m_94.x = _2687;
    out.m_94.y = _2689;
    out.m_94.z = _2691;
    if (_2671)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2777 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2777;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2535 = false;
    bool _564 = false;
    bool _351 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2834 = as_type<float>(_129);
        out.gl_Position.z = _2834;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2902 = as_type<float>(_165);
        out.gl_Position.z = _2902;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_66.x;
    float _171 = in.m_66.y;
    float _173 = in.m_66.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _205;
    float _215 = _207;
    float _217 = _209;
    float _235;
    if (!_211)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_113);
        float _241 = 1.0 / _239;
        float _243 = _147 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = in.m_68.x;
    float _249 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _245 + _251;
    bool _255 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_245);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -_265;
    float _273 = _271 + 1.0;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _269;
    float _279 = _249 * _247;
    float _281 = _253 * _277;
    bool _283 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_245);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = trunc(_279);
    int _305 = int(_303);
    float _307 = _293 * _273;
    float _309 = fma(_297, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = fma(_301, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -_293;
    float _315 = _313 + 1.0;
    float _317 = _309 * _307;
    float _319 = _311 * _307;
    float _321 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    int _329 = _305 << 4;
    int _331 = _329 + 1712;
    bool _333 = !_275;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _337 = _247 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    uint _362 = uint(int(uint(_331) >> uint(2)));
    uint _364 = uint(int(uint(int(_362)) >> uint(2)));
    int _366 = int(_362) & 3;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[int(_364)][_366];
    int _370 = int(_362) + 1;
    uint _372 = uint(int(uint(_370) >> uint(2)));
    int _374 = _370 & 3;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[int(_372)][_374];
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _386 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _388 = isnan(_359);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    int _398 = _331 + 8;
    uint _400 = uint(int(uint(_398) >> uint(2)));
    uint _402 = uint(int(uint(int(_400)) >> uint(2)));
    int _404 = int(_400) & 3;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[int(_402)][_404];
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _412 = 1.0 / _380;
    bool _414 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = isnan(_359);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    float _430 = -_396;
    float _432 = _430 + 1.0;
    bool _434 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_359);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = _424 * _432;
    float _452 = 1.0 / _384;
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _359 + _458;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _464 = _444 * _456;
    float _466 = -_444;
    float _468 = _466 + 1.0;
    float _470 = 1.0 / _410;
    float _472 = _428 * _412;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _359 + _474;
    float _478 = fma(_472, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _482 = _359 + _480;
    float _484 = _448 * _452;
    bool _486 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = isnan(_359);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _498;
    float _502 = _478 * _464;
    float _504 = fma(_484, _482, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[115].x, _502);
    float _512 = _500 * _470;
    float _514 = _396 * _508;
    float _516 = fma(_504, _450, _510);
    float _518 = fma(_512, _460, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _520 = _368 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _524 = fma(_518, _514, _516);
    float _526 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _528 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[118].x, _524);
    float _530 = _522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _406 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _534 = in.m_70.x;
    float _536 = in.m_70.y;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _526;
    out.m_72.y = _530;
    out.m_72.z = _540;
    out.m_72.w = _538;
    float _542 = _327 * _536;
    float _544 = _325 * _534;
    bool _546 = !_462;
    float _562;
    if (!_546)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _550 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_113);
        float _568 = 1.0 / _566;
        float _570 = _147 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = in.m_56.x;
    float _576 = in.m_56.y;
    float _578 = in.m_56.z;
    float _580 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _582 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _580);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _582);
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _584);
    float _590 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _586);
    float _592 = _588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _594 = _590 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _596 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _598 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _600 = floor(_596);
    float _602 = floor(_598);
    float _604 = -_600;
    float _606 = _596 + _604;
    float _608 = -_602;
    float _610 = _598 + _608;
    float2 _3622 = float2(_606, _610);
    float _612 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3622, float2(0.0), isnan(_3622)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3622, float2(0.0), isnan(_3622)), level(0.0)).x;
    float _614 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _616 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _614);
    float _620 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _618);
    float _622 = _620 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _626 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _624);
    float _628 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[11].z, _626);
    float _630 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _632 = _628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _634 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _630);
    float _636 = 1.0 / _632;
    float _638 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[10].z, _634);
    float _640 = _638 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _642 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _644 = _640 + _632;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _648 = _642 * _646;
    float _650 = _644 * _636;
    float _652 = _650 * 0.5;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _658 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[30].w, _656);
    float _660 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _662 = _616 * _654;
    float _664 = 1.0 / _658;
    float _666 = _622 + _660;
    float _668 = _662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _670 = _662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _672 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _674 = _666 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[26].x, _668);
    float _678 = _666 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _680 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[127].x, _674);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _676);
    float _684 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[126].x, _678);
    float _686 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[127].z, _680);
    float _688 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _664 * _690;
    float _694 = fma(_594, (*spvDescriptorSet0.vp_c15)._m0[126].z, _684);
    float _696 = _686 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _688);
    float _700 = _682 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _702 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = _694 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _706 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _708 = trunc(_696);
    int _710 = int(_708);
    bool _712 = !_702;
    int _714 = _712 ? 0 : 1;
    float _716 = _698 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _718 = _594 + _700;
    float _720 = _592 + _716;
    float _722 = trunc(_704);
    int _724 = int(_722);
    int _726 = 2;
    float _728 = _720;
    float _730 = _704;
    if (!_702)
    {
        _726 = 1;
    }
    int _732 = _726;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _736 = _720 + _734;
    int _738 = _732;
    if (!_706)
    {
        _738 = _714;
    }
    int _740 = _738;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _744 = _718 + _742;
    int _746 = _740 << 6;
    float _748 = _744 * _744;
    int _750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _752 = _710 + _750;
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
    float _774 = fma(_736, _736, _748);
    int _776 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _778 = _724 + _776;
    int _780 = _778 + 1;
    float _782 = sqrt(_774);
    int _784 = _746 + 56;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    bool _802 = _780 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _804 = _780 | _754;
    bool _806 = _804 < 0;
    bool _808 = _806 || _802;
    int _810 = _746 + 64;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    uint _814 = uint(int(uint(int(_812)) >> uint(2)));
    int _816 = int(_812) & 3;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[int(_814)][_816];
    int _820 = int(_812) + 1;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    int _824 = _820 & 3;
    float _826 = (*spvDescriptorSet0.vp_c15)._m0[int(_822)][_824];
    float _828 = _662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _830 = _754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _832 = _830 || _808;
    float _834 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[25].x, _828);
    bool _836 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _838 = _746 + 72;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c15)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    float _856 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _834);
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _860 = _746 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    int _878 = as_type<int>(_834);
    float _880 = as_type<float>(_780);
    float _882 = as_type<float>(_754);
    float _884 = _828;
    float _886 = _782;
    float _888 = as_type<float>(_740);
    if (!_832)
    {
        int _890 = _754 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _892 = _890 + _780;
        _878 = _892;
    }
    int _894 = _878;
    float _896 = _622 + _858;
    if (!_836)
    {
        _880 = _718;
    }
    float _898 = _880;
    int _900 = 0;
    float _902 = _898;
    if (!_832)
    {
        int _904 = _894 << 2;
        _900 = _904;
    }
    int _906 = _900;
    int _908 = _746 + 104;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    uint _912 = uint(int(uint(int(_910)) >> uint(2)));
    int _914 = int(_910) & 3;
    float _916 = (*spvDescriptorSet0.vp_c15)._m0[int(_912)][_914];
    int _918 = int(_910) + 1;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    int _922 = _918 & 3;
    float _924 = (*spvDescriptorSet0.vp_c15)._m0[int(_920)][_922];
    int _926 = 0;
    int _928 = _906;
    if (!_832)
    {
        uint _930 = uint(int(uint(_894) >> uint(2)));
        _926 = int(_930);
    }
    int _932 = _926;
    if (!_832)
    {
        int _934 = 12 & _906;
        _928 = _934;
    }
    int _936 = _928;
    if (!_836)
    {
        _882 = _896;
    }
    float _938 = _882;
    bool _940 = !_836;
    float _942 = _938;
    float _944 = _818;
    if (!_940)
    {
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _950 = _782 + _948;
        float _952 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = rsqrt(_774);
        float _956 = _950 * _946;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _958 * 6.283185482025146484375;
        float _962 = cos(_960);
        float _964 = _958 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 + (-1.0);
        float _970 = fma(_966, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _972 = _968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _954 * _970;
        float _976 = fma(_896, _962, _972);
        float _978 = fma(_736, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _980 = fma(_744, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _942 = _976;
        _728 = _978;
        _902 = _980;
        _884 = _968;
        _886 = _958;
    }
    float _982 = _942;
    float _984 = _728;
    float _986 = _902;
    float _988 = _884;
    float _990 = _886;
    float _992 = _988;
    float _994 = _990;
    float _996 = _984;
    float _998 = _982;
    float _1000 = _986;
    if (!_832)
    {
        int _1002 = _932 << 4;
        int _1004 = _1002 + _936;
        _992 = as_type<float>(_1004);
    }
    float _1006 = _992;
    float _1008 = -_622;
    float _1010 = _1008 + _982;
    int _1012 = _746 + 80;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    float _1030 = -_592;
    float _1032 = _1030 + _984;
    float _1034 = -_594;
    float _1036 = _1034 + _986;
    float _1038 = _1010 * _1010;
    float _1040 = _666 * _876;
    float _1042 = _1010;
    float _1044 = _1040;
    if (!_832)
    {
        float _1046 = floor(_696);
        _994 = _1046;
    }
    float _1048 = _994;
    float _1050 = _666 * _826;
    float _1052 = fma(_1032, _1032, _1038);
    int _1054 = _746 + 88;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c15)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    float _1072 = fma(_592, _868, _1040);
    float _1074 = fma(_592, _818, _1050);
    float _1076 = fma(_1036, _1036, _1052);
    float _1078 = fma(_594, _916, _1072);
    float _1080 = _666 * _772;
    float _1082 = sqrt(_1076);
    float _1084 = _1006;
    float _1086 = _1074;
    float _1088 = _1048;
    if (!_832)
    {
        int _1090 = as_type<int>(_1006) + 400;
        uint _1092 = uint(int(uint(_1090) >> uint(2)));
        uint _1094 = uint(int(uint(int(_1092)) >> uint(2)));
        int _1096 = int(_1092) & 3;
        float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = _1078 + _924;
    float _1104 = fma(_592, _764, _1080);
    float _1106 = fma(_594, _846, _1074);
    bool _1108 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1110 = isnan(0.5);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_594, _792, _1104);
    float _1120 = _1038;
    if (!_832)
    {
        float _1122 = floor(_704);
        _1120 = _1122;
    }
    float _1124 = _1120;
    float _1126 = _1106 + _854;
    float _1128 = _1118 + _800;
    bool _1130 = _1082 > 0.0;
    float _1132 = 1.0 / _1102;
    bool _1134 = !_1130;
    float _1136 = _1082;
    if (!_1134)
    {
        float _1138 = _207 * _207;
        float _1140 = rsqrt(_1076);
        float _1142 = fma(_205, _205, _1138);
        float _1144 = fma(_209, _209, _1142);
        float _1146 = sqrt(_1144);
        float _1148 = _1032 * _1140;
        float _1150 = _1010 * _1140;
        float _1152 = _1036 * _1140;
        bool _1154 = _1146 > 0.0;
        bool _1156 = !_1154;
        _1086 = _1152;
        if (!_1156)
        {
            float _1158 = rsqrt(_1144);
            float _1160 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1162 = _207 * _1158;
            float _1164 = _205 * _1158;
            float _1166 = _1150 * _1162;
            float _1168 = _209 * _1158;
            float _1170 = fma(_1148, _1164, _1166);
            float _1172 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1174 = fma(_1152, _1168, _1170);
            float _1176 = _1174 * _1172;
            float _1178 = fma(_205, _1176, _984);
            float _1180 = fma(_207, _1176, _982);
            float _1182 = fma(_209, _1176, _986);
            _996 = _1178;
            _998 = _1180;
            _1000 = _1182;
            _944 = _1172;
        }
    }
    float _1184 = _996;
    float _1186 = _998;
    float _1188 = _1000;
    float _1190 = _944;
    float _1192 = _1086;
    float _1194 = _1186;
    float _1196 = _1190;
    float _1198 = _1192;
    if (_1116)
    {
        _213 = _1184;
    }
    float _1200 = _213;
    float _1202 = _1200;
    if (_1116)
    {
        _215 = _1186;
    }
    float _1204 = _215;
    float _1206 = _1204;
    if (_1116)
    {
        _217 = _1188;
    }
    float _1208 = _217;
    float _1210 = _1208;
    if (!_1116)
    {
        float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1214 = _622 + _1212;
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1218 = _592 + _1216;
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1222 = -_622;
        float _1224 = _1222 + _1186;
        float _1226 = _1214 * _1214;
        float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1230 = _594 + _1228;
        float _1232 = -_592;
        float _1234 = _1232 + _1184;
        float _1236 = -_594;
        float _1238 = _1236 + _1188;
        float _1240 = fma(_1218, _1218, _1226);
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1244 = fma(_1230, _1230, _1240);
        float _1246 = sqrt(_1244);
        float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1250 = precise::min(_1246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1252 = _1250 * _1242;
        float _1254 = _1248 * _1252;
        float _1256 = fma(_1224, _1254, _622);
        float _1258 = fma(_1234, _1254, _592);
        float _1260 = fma(_1238, _1254, _594);
        _1206 = _1256;
        _1202 = _1258;
        _1210 = _1260;
        _1194 = _1224;
    }
    float _1262 = _1206;
    float _1264 = _1202;
    float _1266 = _1210;
    float _1268 = _1194;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1272 = _1128 * _1132;
    float _1274 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1278 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1270);
    float _1280 = _1126 * _1132;
    float _1282 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    bool _1284 = _1272 >= 0.0;
    float _1286 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1278);
    float _1288 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1276);
    float _1290 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1292 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1282);
    float _1294 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1296 = _1272 <= 1.0;
    bool _1298 = _1296 && _1284;
    float _1300 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1288);
    float _1302 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1290);
    float _1304 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1308 = _1280 >= 0.0;
    bool _1310 = _1308 && _1298;
    float _1312 = _1302;
    float _1314 = _1268;
    if (!_832)
    {
        float _1316 = rint(_1100);
        float _1318 = precise::max(_1316, 0.0);
        uint _1320 = uint(_1318);
        uint _1322 = clamp(_1320, 0u, 65535u);
        _1196 = as_type<float>(_1322);
    }
    float _1324 = _1196;
    float _1326 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1328 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1306);
    bool _1330 = _1280 <= 1.0;
    bool _1332 = _1330 && _1310;
    float _1334 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_832)
    {
        float _1338 = -_1048;
        float _1340 = _696 + _1338;
        _1088 = _1340;
    }
    float _1342 = _1088;
    if (!_832)
    {
        float _1344 = -_1124;
        float _1346 = _704 + _1344;
        _1198 = _1346;
    }
    float _1348 = _1198;
    float _1350 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1354 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1328);
    float _1356 = _666 * _1028;
    float _1358 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = -_1352;
    float _1362 = fma(_1360, _1334, 1.0);
    float _1364 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1354);
    float _1366 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1332)
    {
        float _1368 = float(_740);
        _1312 = _1368;
    }
    float _1370 = _1312;
    float _1372 = fma(_592, _1020, _1356);
    float _1374 = 1.0 / _1364;
    float _1376 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1378 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1380 = fma(_594, _1062, _1372);
    float _1382 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1384 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1378);
    float _1386 = _1380 + _1070;
    float _1388 = log2(_1362);
    float _1390 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1382);
    float _1392 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1384);
    float _1394 = _1386 * _1132;
    float _1396 = _1370;
    float _1398 = _1392;
    if (_1332)
    {
        float _1400 = rint(_1370);
        float _1402 = precise::max(_1400, 0.0);
        uint _1404 = uint(_1402);
        uint _1406 = clamp(_1404, 0u, 65535u);
        _1396 = as_type<float>(_1406);
    }
    float _1408 = _1396;
    float _1410 = _1390 * _1374;
    float _1412 = _1392 * _1374;
    float _1414 = fma(_1410, 0.5, 0.5);
    float _1416 = fma(_1412, -0.5, 0.5);
    float _1418 = _1388 * 0.693147182464599609375;
    float _1420 = _1342;
    if (!_832)
    {
        float3 _4972 = float3(_1348, _1342, float(as_type<int>(_1324)));
        float3 _4976 = select(_4972, float3(0.0), isnan(_4972));
        float _1422 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4976.xy, uint(rint(_4976.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4976.xy, uint(rint(_4976.z)), level(0.0)).x;
        _1420 = _1422;
    }
    float _1424 = _1420;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1428 = _1124;
    float _1430 = _1408;
    if (_1332)
    {
        float3 _4996 = float3(_1272, _1280, float(as_type<int>(_1408)));
        float3 _4998 = select(_4996, float3(0.0), isnan(_4996));
        float _1432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4998.xy, uint(rint(_4998.z)), _1394, level(0.0));
        _1428 = _1432;
    }
    float _1434 = _1428;
    float3 _5008 = float3(_1414, _1416, _1426);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5008, float3(0.0), isnan(_5008)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5008, float3(0.0), isnan(_5008)), level(0.0)).x;
    float3 _5017 = float3(_1414, _1416, _1426);
    float4 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5017, float3(0.0), isnan(_5017)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5017, float3(0.0), isnan(_5017)), level(0.0)).xyzw;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = _1439.w;
    bool _1449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1451 = isnan(0.5);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1457 = _1453 || _1455;
    if (_832)
    {
        _888 = 1.0;
    }
    float _1459 = _888;
    float _1461 = _1459;
    if (_1457)
    {
        _730 = 1.0;
    }
    float _1463 = _730;
    float _1465 = _1463;
    float _1467 = _1447;
    float _1469 = _1445;
    float _1471 = _1443;
    float _1473 = _1441;
    if (!_1457)
    {
        float _1475 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1481 = _1477 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1479 * 0.15915493667125701904296875;
        float _1487 = _1477 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = 1.0 / _1483;
        float _1493 = _1485 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = _1485 * 6.283185482025146484375;
        float _1501 = sin(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = 1.0 / _1503;
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1507;
        float _1511 = 1.0 / _1509;
        float _1513 = _1501 * _1505;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1517 = fma(_692, _1513, _1515);
        float _1519 = _1517 * _1511;
        float _1521 = precise::clamp(_1519, 0.0, 1.0);
        float _1523 = -_1521;
        float _1525 = _1523 + 1.0;
        _1430 = _1477;
        _1465 = _1525;
    }
    float _1527 = _1430;
    float _1529 = _1465;
    float _1531 = _1527;
    if (!_832)
    {
        int _1533 = _894 << 4;
        int _1535 = _1533 + 2048;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
        int _1541 = int(_1537) & 3;
        float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
        int _1545 = int(_1537) + 1;
        uint _1547 = uint(int(uint(_1545) >> uint(2)));
        int _1549 = _1545 & 3;
        float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
        int _1553 = _1535 + 8;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
        int _1559 = int(_1555) & 3;
        float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
        int _1563 = int(_1555) + 1;
        uint _1565 = uint(int(uint(_1563) >> uint(2)));
        int _1567 = _1563 & 3;
        float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
        float _1571 = _666 * _1551;
        float _1573 = fma(_592, _1543, _1571);
        float _1575 = fma(_594, _1561, _1573);
        float _1577 = _1575 + _1569;
        float _1579 = precise::clamp(_1577, 0.0, 1.0);
        float _1581 = -_1579;
        float _1583 = _1581 + _1424;
        float _1585 = fma(_1583, 500.0, 1.5);
        float _1587 = exp2(_1585);
        float _1589 = 0.0 + _1587;
        float _1591 = precise::clamp(_1589, 0.0, 1.0);
        _1461 = _1591;
    }
    float _1593 = _1461;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1597 = _1262 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1601 = _1264 + _1599;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1266 + _1603;
    float _1607 = _1597 * _1597;
    float _1609 = fma(_1601, _1601, _1607);
    float _1611 = fma(_1605, _1605, _1609);
    float _1613 = rsqrt(_1611);
    float _1615 = sqrt(_1611);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1619 = _1601 * _1617;
    float _1621 = _1605 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 + _1625;
    float _1629 = sqrt(_1627);
    bool _1631 = _1629 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = _1629 + _1633;
    float _1637 = _1609;
    float _1639 = _1613;
    float _1641 = _1635;
    float _1643 = _1597;
    float _1645 = _1627;
    if (_1631)
    {
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1637 = _1647;
    }
    float _1649 = _1637;
    if (_1631)
    {
        float _1651 = rsqrt(_1627);
        _1639 = _1651;
    }
    float _1653 = _1639;
    float _1655 = _1653;
    if (_1631)
    {
        float _1657 = _1635 * _1649;
        _1641 = _1657;
    }
    float _1659 = _1641;
    if (_1631)
    {
        float _1661 = _1659 * 0.15915493667125701904296875;
        _1531 = _1661;
    }
    float _1663 = _1531;
    float _1665 = _1605;
    float _1667 = _1663;
    if (_1631)
    {
        float _1669 = _1663 * 6.283185482025146484375;
        float _1671 = sin(_1669);
        _1665 = _1671;
    }
    float _1673 = _1665;
    float _1675 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1677 = precise::max(0.0, _1675);
    float _1679 = _1649;
    float _1681 = _1677;
    if (_1631)
    {
        float _1683 = _1663 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        _1679 = _1685;
    }
    float _1687 = _1679;
    float _1689 = -_1617;
    float _1691 = -_1677;
    float _1693 = fma(_1597, _1689, _1691);
    if (_1631)
    {
        float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1695;
    }
    float _1697 = _1643;
    float _1699 = _1697;
    float _1701 = _1673;
    if (_1631)
    {
        float _1703 = fma(_1673, _1697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = _1705;
    if (!_1631)
    {
        _1701 = _1619;
    }
    float _1709 = _1701;
    float _1711 = _1709;
    float _1713 = _1687;
    if (_1631)
    {
        float _1715 = _1687 + (-1.0);
        _1681 = _1715;
    }
    float _1717 = _1681;
    float _1719 = _1717;
    if (_1631)
    {
        float _1721 = _1653 * _1705;
        _1042 = _1721;
    }
    float _1723 = _1042;
    if (!_1631)
    {
        _1707 = _1693;
    }
    float _1725 = _1707;
    float _1727 = _1725;
    if (_1631)
    {
        float _1729 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1729;
    }
    float _1731 = _1667;
    if (_1631)
    {
        float _1733 = _1619 * _1723;
        _1711 = _1733;
    }
    float _1735 = _1711;
    if (!_1631)
    {
        _1719 = _1621;
    }
    float _1737 = _1719;
    float _1739 = _1737;
    if (_1631)
    {
        float _1741 = _1621 * _1723;
        _1739 = _1741;
    }
    float _1743 = _1739;
    if (!_1631)
    {
        _1655 = _1623;
    }
    float _1745 = _1655;
    float _1747 = _1745;
    if (_1631)
    {
        float _1749 = fma(_1693, _1687, _1731);
        _1727 = _1749;
    }
    float _1751 = _1727;
    if (_1631)
    {
        float _1753 = _1735 * _1735;
        _1747 = _1753;
    }
    float _1755 = _1747;
    if (!_1631)
    {
        _1713 = _1625;
    }
    float _1757 = _1713;
    float _1759 = _1757;
    if (_1631)
    {
        float _1761 = _1743 * _1743;
        _1759 = _1761;
    }
    float _1763 = _1759;
    float _1765 = fma(_1751, _1751, _1755);
    float _1767 = _1765 + _1763;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1771 = fma(_1615, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1769);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = rsqrt(_1767);
    float _1777 = -_1773;
    float _1779 = _1777 + 1.0;
    float _1781 = abs(_1779);
    float _1783 = log2(_1781);
    float _1785 = _1775 * _1735;
    float _1787 = _1775 * _1751;
    float _1789 = _1775 * _1743;
    float _1791 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1793 = -_1791;
    float _1795 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1793);
    float _1797 = -_1789;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1795);
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1803 = fma(_1799, -0.5, 0.5);
    float _1805 = fma(_1799, 0.5, 0.5);
    float _1807 = exp2(_1801);
    float _1809 = fma(_1805, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1811 = fma(_1805, _1809, -0.212114393711090087890625);
    float _1813 = _1787 + 1.0;
    float _1815 = sqrt(_1803);
    float _1817 = fma(_1805, _1811, 1.570728778839111328125);
    float _1819 = -_1787;
    float _1821 = fma(_1807, _1813, _1819);
    float _1823 = _1815 * 0.636619746685028076171875;
    float _1825 = fma(_1821, 0.5, 0.5);
    float _1827 = -_1817;
    float _1829 = fma(_1823, _1827, 1.0);
    float2 _5593 = float2(_1829, _1825);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5593, float2(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5593, float2(0.0), isnan(_5593)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = in.m_68.z;
    float _1843 = in.m_68.w;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1847 = _572 + _1845;
    float _1849 = in.m_68.y;
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1853 = _1851 != 0;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1857 = _572 + _1855;
    float _1859 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1861 = -_612;
    float _1863 = _1861 + 1.0;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _1865 = _247 > 0.5;
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1869 = _1867 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1871 = _1623;
    if (!_1853)
    {
        float _1873 = in.m_68.z;
        _1871 = _1873;
    }
    float _1875 = _1871;
    if (_1853)
    {
        _1044 = _247;
    }
    float _1877 = _1044;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1883 = 1.0 / _1869;
    bool _1885 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1887 = isnan(_572);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    bool _1897 = _1843 > 0.5;
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1899;
    bool _1903 = _1841 > 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1909 = _1877;
    if (!_1853)
    {
        _1909 = _1841;
    }
    float _1911 = _1909;
    float _1913 = 1.0 / _1881;
    float _1915 = -_1895;
    float _1917 = _1915 + 1.0;
    float _1919 = -_203;
    int _1921 = _1897 ? as_type<int>(_1919) : as_type<int>(_203);
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1927 = _1849 > 0.5;
    float _1929 = exp2(_1859);
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1933 = _1931 != 0;
    float _1935 = -_193;
    int _1937 = _1927 ? as_type<int>(_1935) : as_type<int>(_193);
    bool _1939 = !_1933;
    float _1941 = _1939 ? _193 : as_type<float>(_1937);
    float _1943 = 1.0 / _1925;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1947 = _1945 != 0;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1951 = -_193;
    int _1953 = _1903 ? as_type<int>(_1951) : as_type<int>(_193);
    float _1955 = _1907 * _1913;
    if (!_1853)
    {
        _1645 = _1849;
    }
    float _1957 = _1645;
    float _1959 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1949);
    bool _1961 = !_1947;
    float _1963 = _1961 ? _193 : as_type<float>(_1953);
    float _1965 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1969 = _1967 != 0;
    float _1971 = fma(_1955, _1857, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1973 = -_193;
    int _1975 = _1865 ? as_type<int>(_1973) : as_type<int>(_193);
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1979 = _1957;
    if (!_1853)
    {
        _1136 = _1957;
    }
    float _1981 = _1136;
    float _1983 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1959);
    float _1985 = _1981;
    if (_1853)
    {
        _1979 = _1849;
    }
    float _1987 = _1979;
    float _1989 = _1901 * _1943;
    bool _1991 = !_1969;
    float _1993 = _1991 ? _193 : as_type<float>(_1975);
    float _1995 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1997 = _1875;
    float _1999 = _1987;
    if (!_1853)
    {
        _1314 = _1875;
    }
    float _2001 = _1314;
    float _2003 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2005 = _2001;
    if (_1853)
    {
        _2005 = _1987;
    }
    float _2007 = _2005;
    float _2009 = fma(_1989, _1847, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1853)
    {
        _1997 = _1987;
    }
    float _2011 = _1997;
    float _2013 = _1993 + 0.5;
    if (_1853)
    {
        _1985 = _247;
    }
    float _2015 = _1985;
    float _2017 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1853)
    {
        _1999 = _247;
    }
    float _2019 = _1999;
    float _2021 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2025 = _2023 != 0;
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2029 = _2027 != 0;
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2021);
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2035 = _2033 != 0;
    float _2037 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2003);
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2039;
    bool _2043 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2045 = isnan(_572);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1977);
    bool _2057 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2059 = isnan(_572);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = _2041 * _1883;
    float _2071 = fma(_1965, _1965, 1.0);
    float _2073 = -_2053;
    float _2075 = _2073 + 1.0;
    bool _2077 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2079 = isnan(_572);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2085 = _2081 || _2083;
    float _2087 = float(_2085);
    float _2089 = -_2067;
    float _2091 = _2089 + 1.0;
    bool _2093 = !_2025;
    float _2095 = _2093 ? _203 : as_type<float>(_1921);
    float _2097 = _1895 * _2075;
    float _2099 = rsqrt(_2071);
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2103 = _572 + _2101;
    float _2105 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2107 = _2087 * _1917;
    float _2109 = fma(_2069, _2103, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2111 = _2009 * _2107;
    float _2113 = -_2087;
    float _2115 = _2113 + 1.0;
    float _2117 = _2053 * _2091;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2121 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2111);
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2125 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2127 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2119);
    float _2129 = _1965 * _2099;
    float _2131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2133 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2123);
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2137 = _2129 * _2135;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2141 = _2129 * _2139;
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2145 = _2129 * _2143;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2149 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2137);
    float _2151 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2141);
    float _2153 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2145);
    float _2155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2157 = fma(_1971, _2097, _2121);
    float _2159 = -_2147;
    float _2161 = fma(_2105, 2.0, _2159);
    out.m_76.x = _2149;
    out.m_76.y = _2151;
    out.m_76.z = _2153;
    float _2163 = fma(_2109, _2117, _2157);
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2167 = -_147;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2161);
    float _2171 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2127);
    float _2173 = -_2165;
    float _2175 = fma(_2125, 2.0, _2173);
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2179 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2133);
    float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2183 = -_147;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2175);
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2189 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2191 = _1963 + 0.5;
    float _2193 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2177);
    float _2195 = fma(_2017, -2.0, _2187);
    float _2197 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2199 = _1941 + 0.5;
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2203 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2195);
    float _2205 = -_203;
    int _2207 = _1903 ? as_type<int>(_2205) : as_type<int>(_203);
    float _2209 = fma(_2197, _2199, _2169);
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2213 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2215 = fma(_2189, _2191, _2185);
    float _2217 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2193);
    float _2219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2221 = fma(_2213, -2.0, _2211);
    float _2223 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2225 = !_2029;
    float _2227 = _2225 ? _203 : as_type<float>(_2207);
    float _2229 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2163);
    float _2231 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2221);
    float _2233 = -_203;
    int _2235 = _1927 ? as_type<int>(_2233) : as_type<int>(_203);
    float _2237 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2223);
    float _2239 = abs(_692);
    float _2241 = log2(_2239);
    float _2243 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2245 = _2095 + (-0.5);
    bool _2247 = !_2035;
    float _2249 = _2247 ? _203 : as_type<float>(_2235);
    float _2251 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2253 = _2227 + (-0.5);
    float _2255 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2237);
    float _2257 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2261 = -_2243;
    float _2263 = -_2203;
    float _2265 = fma(_2261, _2245, _2263);
    float _2267 = -_2251;
    float _2269 = -_2231;
    float _2271 = fma(_2267, _2253, _2269);
    float _2273 = -_1983;
    float _2275 = _2273 + 1.0;
    float _2277 = -_2249;
    float _2279 = _2277 + 0.5;
    float _2281 = -_2171;
    float _2283 = _2281 + 1.0;
    float _2285 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    float _2287 = _2257 * _2219;
    float _2289 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2291 = -_2275;
    float _2293 = fma(_1941, _2291, _2209);
    float _2295 = -_2179;
    float _2297 = _2295 + 1.0;
    float _2299 = -_2217;
    float _2301 = _2299 + 1.0;
    float _2303 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2305 = fma(_2227, _2283, _2271);
    float _2307 = exp2(_2289);
    float _2309 = _2285 + _1364;
    float _2311 = -_2297;
    float _2313 = fma(_1963, _2311, _2215);
    float _2315 = _2303 * _2259;
    float _2317 = fma(_2095, _2301, _2265);
    float _2319 = _2309 * 0.5;
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1364;
    bool _2321 = _692 <= 8000.0;
    bool _2323 = isnan(_692);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan(8000.0);
    bool _2329 = _2325 || _2327;
    float _2331 = float(_2329);
    float _2333 = _2229 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _2287;
    out.m_78.y = _2315;
    out.m_78.z = _2313;
    out.m_78.w = _2317;
    float _2335 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    out.m_80.w = _2333;
    out.m_82.x = _2293;
    out.m_82.y = _2305;
    float _2339 = -_1929;
    float _2341 = _2339 + 1.0;
    if (!_1332)
    {
        _1398 = 1.0;
    }
    float _2343 = _1398;
    float _2345 = _2343;
    float _2347 = _1835;
    if (_1332)
    {
        bool _2349 = _1434 >= _1394;
        bool _2351 = isnan(_1434);
        bool _2353 = _2349 || _2351;
        bool _2355 = isnan(_1394);
        bool _2357 = _2353 || _2355;
        float _2359 = float(_2357);
        _2345 = _2359;
    }
    float _2361 = _2345;
    float _2363 = fma(_2337, -2.0, 3.0);
    float _2365 = _2337 * _2337;
    out.m_84.z = _2319;
    out.m_84.w = _1364;
    bool _2367 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2369 = isnan(_1615);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2375 = _2371 || _2373;
    float _2377 = _2361 * _1593;
    float _2379 = _2365 * _2363;
    float _2381 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2383 = -_2379;
    float _2385 = _2383 + 1.0;
    float _2387 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2379);
    float _2389 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2391 = _2331 * _2387;
    float _2393 = _2389 * _1436;
    float _2395 = -_2389;
    float _2397 = _2395 + 1.0;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2401 = _1447 * _2393;
    float _2403 = _1447 * _2397;
    float _2405 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2407 = _1863 * _2399;
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = -_2409;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2415 = _2409;
    if (!_2375)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2417 = _2415;
    float _2419 = -_2377;
    float _2421 = fma(_2419, _2413, 1.0);
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = _1839 * _2393;
    float _2427 = fma(_1837, _2401, _1443);
    float _2429 = fma(_1835, _2401, _1441);
    float _2431 = _2423 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2433 = fma(_1447, _2425, _1445);
    float _2435 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2437 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2439 = _2417;
    float _2441 = _2417;
    if (!_2375)
    {
        _2347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2443 = _2347;
    out.m_86.x = _2431;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2375)
    {
        _1467 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2449 = _1467;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2375)
    {
        _1469 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2455 = _1469;
    out.m_88.x = _2429;
    out.m_88.y = _2427;
    out.m_88.z = _2433;
    out.m_88.w = _2403;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2375)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2461 = _1471;
    float _2463 = _2461;
    float _2465 = _2461;
    if (!_2375)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2467 = _1473;
    out.m_90.x = _2405;
    out.m_90.y = _2435;
    out.m_90.z = _2437;
    bool _2469 = !_2375;
    float _2471 = _2467;
    float _2473 = _2467;
    if (!_2469)
    {
        bool _2475 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2477 = isnan(_1615);
        bool _2479 = _2475 || _2477;
        bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2483 = _2479 || _2481;
        if (!_2483)
        {
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2487 = _1615 + _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2491 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2489;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2497 = 1.0 / _2491;
            float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2515 = _2487 * _2497;
            float _2517 = precise::clamp(_2515, 0.0, 1.0);
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2523 = fma(_2517, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2525 = fma(_2517, _2521, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2527 = fma(_2517, _2501, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2529 = fma(_2517, _2505, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2531 = fma(_2517, _2509, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2533 = fma(_2517, _2513, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2453 = _2527;
            _2473 = _2531;
            _2447 = _2523;
            _2465 = _2529;
            _2459 = _2525;
            _2441 = _2533;
            _2535 = true;
        }
        else
        {
            bool _2537 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2539 = isnan(_1615);
            bool _2541 = _2537 || _2539;
            bool _2543 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2545 = _2541 || _2543;
            if (!_2545)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2547 = _2445;
            _2447 = _2547;
            if (!_2545)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2549 = _2451;
            _2453 = _2549;
            if (!_2545)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2551 = _2457;
            _2459 = _2551;
            if (!_2545)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2553 = _2463;
            _2465 = _2553;
            if (!_2545)
            {
                _2471 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2555 = _2471;
            _2473 = _2555;
            if (!_2545)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2557 = _2439;
            bool _2559 = !_2545;
            _2441 = _2557;
            if (!_2559)
            {
                bool _2561 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2563 = isnan(_1615);
                bool _2565 = _2561 || _2563;
                bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2569 = _2565 || _2567;
                if (!_2569)
                {
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2573 = _1615 + _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2577 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2575;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2583 = 1.0 / _2577;
                    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2593 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2601 = _2573 * _2583;
                    float _2603 = precise::clamp(_2601, 0.0, 1.0);
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2609 = fma(_2603, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2611 = fma(_2603, _2607, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2613 = fma(_2603, _2587, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2615 = fma(_2603, _2591, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2617 = fma(_2603, _2595, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2619 = fma(_2603, _2599, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2453 = _2613;
                    _2473 = _2617;
                    _2447 = _2609;
                    _2465 = _2615;
                    _2459 = _2611;
                    _2441 = _2619;
                    _2535 = true;
                }
                else
                {
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2473 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2535 = false;
    float _2621 = _2453;
    float _2623 = _2473;
    float _2625 = _2447;
    float _2627 = _2465;
    float _2629 = _2459;
    float _2631 = _2441;
    float _2633 = fma(_2435, -0.5, 0.5);
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    float _2637 = -_2621;
    float _2639 = _2637 + _2623;
    float _2641 = _2381 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2643 = -_2625;
    float _2645 = _2643 + _2627;
    out.m_92.x = 0.0;
    float _2647 = fma(_2635, _2639, _2621);
    float _2649 = fma(_2635, _2645, _2625);
    out.m_59.x = _2641;
    float _2651 = -_2629;
    float _2653 = _2651 + _2631;
    float _2655 = _2647 * 0.586610972881317138671875;
    bool _2657 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2659 = fma(_2635, _2653, _2629);
    float _2661 = fma(_2649, 0.298911988735198974609375, _2655);
    bool _2663 = _1529 > 0.0;
    bool _2665 = isnan(_1529);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(0.0);
    bool _2671 = _2667 || _2669;
    float _2673 = fma(_2659, 0.114477999508380889892578125, _2661);
    float _2675 = -_2673;
    float _2677 = _2649 + _2675;
    float _2679 = -_2673;
    float _2681 = _2647 + _2679;
    float _2683 = -_2673;
    float _2685 = _2659 + _2683;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    float _2689 = fma(_2681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2673);
    bool _2693 = !_2657;
    if (!_2693)
    {
        float _2695 = -_1262;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2699 = -_1264;
        float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2703 = -_1266;
        float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2707 = _2697 * _2697;
        float _2709 = fma(_2701, _2701, _2707);
        float _2711 = fma(_2705, _2705, _2709);
        float _2713 = sqrt(_2711);
        float _2715 = rsqrt(_2711);
        float _2717 = -_2713;
        float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2721 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = _2701 * _2715;
        float _2727 = _2697 * _2715;
        float _2729 = abs(_2723);
        float _2731 = log2(_2729);
        float _2733 = _2705 * _2715;
        float _2735 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2737 = _2435 * _2727;
        float _2739 = -_2727;
        float _2741 = -_2735;
        float _2743 = fma(_2739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2741);
        float _2745 = fma(_2405, _2725, _2737);
        float _2747 = -_2733;
        float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2743);
        float _2751 = fma(_2437, _2733, _2745);
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2757 = _2749 + _2755;
        float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = exp2(_2759);
        float _2767 = _2765 * _2763;
        float _2769 = _2753 * _2767;
        float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2771;
        out.m_92.y = _2773;
        out.m_92.z = _2775;
    }
    out.m_94.x = _2687;
    out.m_94.y = _2689;
    out.m_94.z = _2691;
    if (_2671)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2777 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2777;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

