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
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_80 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_76 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3069 = false;
    bool _1714 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = in.m_60.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = _110;
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_65.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_137);
        out.gl_Position.z = _3385;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = float(_115);
    bool _153 = _119 >= _151;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    if (_157)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _127;
    if (_157)
    {
        out.m_65.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _139 = as_type<int>(_161);
    }
    int _163 = _139;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3440 = as_type<float>(_163);
        out.gl_Position.z = _3440;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = 1.0 / _151;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _119 * _165;
    bool _171 = !_167;
    float _173 = _169;
    float _191;
    if (!_171)
    {
        float _175 = in.m_67.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        _191 = _169;
    }
    _193 = false;
    float _195 = _191;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _195 + _197;
    bool _201 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _203 = isnan(_195);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -_211;
    float _219 = _217 + 1.0;
    bool _221 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _223 = isnan(_195);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _233;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _239 = 1.0 / _215;
    float _241 = _231 * _219;
    float _243 = -_231;
    float _245 = _243 + 1.0;
    float _247 = _199 * _239;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _249;
    float _253 = fma(_235, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _255 = fma(_251, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _257 = _253 * _241;
    float _259 = _255 * _241;
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].x, _257);
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].y, _259);
    float _265 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[144].x, _261);
    float _267 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[144].y, _263);
    bool _269 = !_237;
    if (!_269)
    {
        float _271 = in.m_67.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _173 = _285;
    }
    float _287 = _173;
    float _289 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _291 = int(_289);
    float _293 = in.m_67.x;
    float _295 = in.m_67.y;
    float _297 = as_type<float>(int(gl_VertexIndex));
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _301 = int(_299);
    float _303 = in.m_67.z;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _309 = in.m_72.x;
    float _311 = in.m_72.y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _315 = float(_291);
    float _317 = 1.0 / _307;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _321 = float(uint(_301));
    float _323 = 1.0 / _315;
    float _325 = _295 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _327 = fma(_325, -2.0, _313);
    float _329 = 1.0 / _321;
    float _331 = _303 * 2.0;
    float _333 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _327);
    float _335 = _265 * _309;
    float _337 = _267 * _311;
    float _339 = _323 * _119;
    float _341 = _295 * 2.0;
    float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _345 = log2(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    int _351 = as_type<int>(_329) + (-2);
    float _353 = trunc(_339);
    int _355 = int(_353);
    int _357 = ~_301;
    int _359 = _357 + 1;
    float _361 = floor(_341);
    float _363 = float(uint(_355));
    float _365 = floor(_331);
    float _367 = as_type<float>(_351) * _363;
    float _369 = _293 * 2.0;
    float _371 = trunc(_367);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    float _378 = floor(_369);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _384 = _359 * int(_376);
    int _386 = _384 + _355;
    float _388 = 1.0 / _382;
    float _390 = float(uint(_386));
    bool _392 = _378 > 0.0;
    float _394 = as_type<float>(_351) * _390;
    bool _396 = _378 >= 0.0;
    bool _398 = isnan(_378);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _418 = _416 != 0;
    float _420 = trunc(_394);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    bool _426 = _361 > 0.0;
    float _428 = -_319;
    float _430 = fma(_406, 2.0, _428);
    bool _432 = _361 >= 0.0;
    bool _434 = isnan(_361);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = _349 * _388;
    int _444 = _404 ? 0 : 1;
    float _446 = -_119;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _430);
    int _450 = _440 ? 0 : 1;
    bool _452 = !_414;
    int _454 = _452 ? 0 : 1;
    int _456 = ~_450;
    int _458 = _456 + 1;
    int _460 = _458 + 1;
    bool _462 = !_410;
    int _464 = _462 ? 0 : 1;
    int _466 = _460;
    if (!_426)
    {
        int _468 = ~_450;
        int _470 = _468 + 1;
        _466 = _470;
    }
    int _472 = _466;
    int _474 = int(_376) + int(_424);
    int _476 = ~_301;
    int _478 = _476 + 1;
    int _480 = ~_444;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    bool _486 = !_418;
    int _488 = _486 ? 0 : 1;
    int _490 = _478 * _474;
    int _492 = _490 + _355;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _504 = _502 != 0;
    int _506 = _484;
    if (!_392)
    {
        int _508 = ~_444;
        int _510 = _508 + 1;
        _506 = _510;
    }
    int _512 = _506;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _516 = _514 != 0;
    bool _518 = !_516;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _524 = _522 != 0;
    bool _526 = uint(_492) >= uint(_301);
    float _528 = in.m_58.x;
    float _530 = in.m_58.y;
    float _532 = in.m_58.z;
    bool _534 = !_524;
    float _536 = _534 ? 7.345489978790283203125 : 1.0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _544 = _542 != 0;
    bool _546 = !_526;
    int _548 = _546 ? 0 : (-1);
    int _550 = as_type<int>(_297) & 1;
    bool _552 = _550 != 0;
    int _554 = as_type<int>(_297) & 2;
    bool _556 = _554 != 0;
    bool _558 = !_500;
    int _560 = _558 ? 0 : 1;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = !_504;
    int _568 = _566 ? 0 : 1;
    int _570 = ~_474;
    int _572 = _570 + _548;
    int _574 = _572 + 1;
    float _576 = 1.0 / _564;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _580 = _578 != 0;
    int _582 = abs(_454);
    float _584 = _530 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _586 = _530 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _530 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _592 = _590 != 0;
    float _594 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _584);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _602 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = _295 + _293;
    float _610 = _598 * _317;
    float _612 = _606 * _576;
    float _614 = _608 + (-1.0);
    float _616 = float(_301);
    float _618 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[4].z, _600);
    bool _620 = !_496;
    int _622 = _620 ? 0 : 1;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _626 = _345 * _119;
    bool _628 = _365 >= 0.0;
    bool _630 = isnan(_365);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = _616 * _119;
    float _640 = exp2(_626);
    int _642 = _636 ? 0 : 1;
    float _644 = _638 * _165;
    bool _646 = _365 > 0.0;
    float _648 = _295 + _303;
    float _650 = _303 + _293;
    int _652 = ~_642;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _660 = 1.0 + _658;
    float _662 = _648 + (-1.0);
    float _664 = _536 * _293;
    float _666 = _650 + (-1.0);
    float _668 = 1.0 / _660;
    float _670 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _674 = _287 + _672;
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    int _682 = _656;
    if (!_646)
    {
        int _684 = ~_642;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    bool _692 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _700 = _696 || _698;
    float _702 = floor(_664);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _706 = _700 ? _680 : 0.0;
    float _708 = fma(_442, _674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _722 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _724 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].z, _704);
    int _726 = abs(_622);
    float _728 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[78].w, _720);
    float _730 = float(_688);
    float _732 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _734 = trunc(_644);
    int _736 = int(_734);
    float _738 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    float _740 = in.m_74.x;
    float _742 = in.m_74.y;
    float _744 = in.m_74.z;
    float _746 = -_702;
    float _748 = _664 + _746;
    if (_718)
    {
        float _750 = _706 * _668;
        _129 = _750;
    }
    float _752 = _129;
    int _754 = abs(_560);
    float _756 = _748 * _616;
    float _758 = float(_355);
    float _760 = _303 + (-0.5);
    int _762 = abs(_568);
    float _764 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _766 = _758 >= _616;
    bool _768 = isnan(_758);
    bool _770 = _766 || _768;
    bool _772 = isnan(_616);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = trunc(_756);
    int _780 = int(_778);
    float _782 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _784 = float(_512);
    float _786 = _722 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = float(_754);
    float _790 = float(_726);
    float _792 = trunc(_776);
    int _794 = int(_792);
    int _796 = abs(_520);
    float _798 = _788 * _784;
    bool _800 = _301 == 0;
    float _802 = _790 * _730;
    float _804 = float(_472);
    float _806 = _798 * (-2.0);
    float _808 = _802 * (-2.0);
    int _810 = _301 * _574;
    int _812 = _810 + _355;
    float _814 = fma(_670, _806, _670);
    float _816 = float(_762);
    int _818 = _780 * _796;
    int _820 = _818 + _355;
    float _822 = fma(_624, _808, _624);
    float _824 = fma(_806, _742, _742);
    float _826 = fma(_808, _740, _740);
    int _828 = ~_794;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    float _834 = _816 * _804;
    bool _836 = !_800;
    int _838 = _836 ? _812 : (-1);
    bool _840 = !_580;
    int _842 = _840 ? 0 : 1;
    float _844 = _834 * (-2.0);
    bool _846 = _293 > 0.5;
    float _848 = _293 + (-0.5);
    int _850 = _301 + (-1);
    int _852 = _838 * _832;
    int _854 = abs(_464);
    float _856 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _826);
    int _858 = _794 * _850;
    int _860 = _858 + _852;
    int _862 = abs(_488);
    float _864 = fma(_844, _744, _744);
    int _866 = _860 * _582;
    float _868 = _295 + (-0.5);
    int _870 = abs(_842);
    int _872 = _736 * _854;
    int _874 = _872 + _866;
    bool _876 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _878 = isnan(_287);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_676, _844, _676);
    bool _890 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _892 = isnan(_287);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    int _902 = _820 * _862;
    int _904 = _902 + _874;
    float _906 = float(uint(_820));
    float _908 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].y, _824);
    bool _910 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = isnan(_287);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    int _922 = _780 * _870;
    int _924 = _922 + _904;
    float _926 = -_886;
    float _928 = _926 + 1.0;
    float _930 = as_type<float>(_351) * _906;
    bool _932 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _934 = isnan(_287);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = fma(_822, _752, _856);
    float _946 = float(uint(_924));
    float _948 = _900 * _928;
    float _950 = -_900;
    float _952 = _950 + 1.0;
    float _954 = trunc(_930);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].z, _864);
    float _962 = as_type<float>(_351) * _946;
    float _964 = fma(_814, _752, _908);
    float _966 = _920 * _952;
    float _968 = -_920;
    float _970 = _968 + 1.0;
    int _972 = ~_301;
    int _974 = _972 + 1;
    float _976 = _964 * 0.15915493667125701904296875;
    float _978 = trunc(_962);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    float _984 = _942 * _970;
    float _986 = _944 * 0.15915493667125701904296875;
    float _988 = fma(_888, _752, _960);
    float _990 = _708 * _984;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _994 = _287 + _992;
    bool _996 = !_552;
    float _998 = _996 ? (-0.5) : 0.5;
    float _1000 = _986 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    int _1004 = ~_301;
    int _1006 = _1004 + 1;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1010 = _287 + _1008;
    bool _1012 = _295 > 0.5;
    float _1014 = fma(_610, _994, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1016 = -_942;
    float _1018 = _1016 + 1.0;
    int _1020 = _1006 * int(_958);
    int _1022 = _1020 + _820;
    bool _1024 = !_556;
    float _1026 = _1024 ? (-0.5) : 0.5;
    int _1028 = _974 * int(_982);
    int _1030 = _1028 + _924;
    float _1032 = _986 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    float _1036 = float(uint(_1030));
    float _1038 = _976 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = _988 * 0.15915493667125701904296875;
    float _1044 = float(uint(_1022));
    float _1046 = fma(_612, _1010, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1052 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = as_type<float>(_351) * _1044;
    float _1056 = _976 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = fma(_1014, _966, _1048);
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _998);
    float _1064 = fma(_1046, _948, _1060);
    float _1066 = _1052 * _1062;
    float _1068 = _1042 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = as_type<float>(_351) * _1036;
    float _1074 = -_998;
    int _1076 = _846 ? as_type<int>(_1074) : as_type<int>(_998);
    float _1078 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = -_1026;
    int _1082 = _1012 ? as_type<int>(_1080) : as_type<int>(_1026);
    float _1084 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1064);
    bool _1086 = !_540;
    float _1088 = _1086 ? _998 : as_type<float>(_1076);
    float _1090 = trunc(_1072);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    bool _1096 = !_544;
    float _1098 = _1096 ? _1026 : as_type<float>(_1082);
    float _1100 = _1078 * _1050;
    float _1102 = _1088 + 0.5;
    float _1104 = _1002 * _1058;
    float _1106 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].x, _448);
    float _1108 = trunc(_1054);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = _1098 + (-0.5);
    int _1116 = ~_301;
    int _1118 = _1116 + 1;
    float _1120 = _1002 * _1070;
    float _1122 = _1058 * _1070;
    float _1124 = -_1114;
    float _1126 = -_333;
    float _1128 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1126);
    float _1130 = _1002 * _1040;
    float _1132 = _1042 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    int _1136 = int(_982) + int(_1094);
    float _1138 = _1034 * _1058;
    float _1140 = _1034 * _1040;
    float _1142 = _1034 * _1070;
    int _1144 = ~_301;
    int _1146 = _1144 + 1;
    float _1148 = _1040 * _1070;
    int _1150 = int(_958) + int(_1112);
    int _1152 = _1118 * _1136;
    int _1154 = _1152 + _924;
    float _1156 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1158 = _1142 * _1100;
    bool _1160 = uint(_1154) >= uint(_301);
    float _1162 = fma(_1134, _1138, _1130);
    float _1164 = -_1140;
    float _1166 = fma(_1134, _1104, _1164);
    float _1168 = fma(_1134, _1130, _1138);
    float _1170 = -_1104;
    float _1172 = fma(_1134, _1140, _1170);
    float _1174 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1178 = -_1134;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1156);
    float _1182 = -_1100;
    float _1184 = _1134 * _1182;
    float _1186 = -_1134;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1190 = -_1134;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1176);
    bool _1194 = !_1160;
    int _1196 = _1194 ? 0 : (-1);
    int _1198 = _1146 * _1150;
    int _1200 = _1198 + _820;
    float _1202 = _1120 * _1100;
    float _1204 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1188);
    int _1206 = ~_1136;
    int _1208 = _1206 + _1196;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1122, _1066, _1184);
    bool _1214 = uint(_1200) >= uint(_301);
    float _1216 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1218 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    int _1220 = _301 * _1210;
    int _1222 = _1220 + _924;
    float _1224 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1162, _1066, _1158);
    float _1228 = fma(_1166, _1066, _1202);
    float _1230 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1232 = !_800;
    int _1234 = _1232 ? _1222 : (-1);
    float _1236 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1238 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1240 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1242 = _1234 >> 31;
    float _1244 = fma(_1148, _1230, _1212);
    float _1246 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1238);
    float _1248 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1240);
    int _1250 = _1242 & 3;
    float _1252 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1254 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1256 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1258 = _1234 + _1250;
    float _1260 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1252);
    float _1262 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1264 = fma(_1172, _1230, _1226);
    int _1266 = _1258 >> 2;
    float _1268 = fma(_1168, _1230, _1228);
    float _1270 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1254);
    float _1272 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1256);
    int _1274 = _1266 << 4;
    int _1276 = _1274 + 368;
    float _1278 = _1262 * _1216;
    float _1280 = _1262 * _1204;
    float _1282 = _1262 * _1218;
    float _1284 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1236);
    float _1286 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1288 = uint(int(uint(_1276) >> uint(2)));
    uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
    int _1292 = int(_1288) & 3;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[int(_1290)][_1292];
    int _1296 = int(_1288) + 1;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    int _1300 = _1296 & 3;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[int(_1298)][_1300];
    float _1304 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1272);
    float _1306 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1308 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1286);
    float _1310 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1246);
    float _1312 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1248);
    float _1314 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1306);
    float _1316 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    int _1318 = _1234 & 3;
    bool _1320 = _1318 != 0;
    float _1322 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1260);
    float _1324 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1314);
    float _1326 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1328 = _1234 & 3;
    bool _1330 = _1328 != 0;
    int _1332 = _1276 + 8;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1352 = _764 + _1326;
    float _1354 = _998 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1356 = uint(_1318) > 1u;
    float _1358 = _782 + _1350;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1362 = _1352 + _1360;
    bool _1364 = !_1214;
    int _1366 = _1364 ? 0 : (-1);
    float _1368 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1270);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1358 + _1370;
    float _1374 = _1362 * _1362;
    int _1376 = _1330 ? 0 : 1;
    float _1378 = fma(_1354, _1304, _1280);
    float _1380 = _1372 * _1372;
    int _1382 = ~_1150;
    int _1384 = _1382 + _1366;
    int _1386 = _1384 + 1;
    float _1388 = fma(_1354, _1284, _1278);
    bool _1390 = _1318 != 3;
    float _1392 = _1374 + _1380;
    bool _1394 = uint(_1318) >= 2u;
    float _1396 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1398 = ~_1376;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    float _1404 = sqrt(_1392);
    int _1406 = _1402;
    float _1408 = _1352;
    float _1410 = _1374;
    float _1412 = _1380;
    float _1414 = _1310;
    if (!_1356)
    {
        int _1416 = ~_1376;
        int _1418 = _1416 + 1;
        _1406 = _1418;
    }
    int _1420 = _1406;
    int _1422 = _301 * _1386;
    int _1424 = _1422 + _820;
    bool _1426 = !_1320;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1396);
    int _1432 = _1394 ? 0 : 1;
    int _1434 = abs(_1420);
    float _1436 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    int _1438 = abs(_1428);
    int _1440 = ~_1432;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1448 = _1444;
    if (_1390)
    {
        int _1450 = ~_1432;
        int _1452 = _1450 + 1;
        _1448 = _1452;
    }
    int _1454 = _1448;
    int _1456 = ~_1434;
    int _1458 = _1456 + 1;
    int _1460 = _1458 + 1;
    float _1462 = _786 + _1446;
    bool _1464 = _1318 != 3;
    int _1466 = _1460 * as_type<int>(_1302);
    int _1468 = ~_1438;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    bool _1474 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1476 = abs(_1454);
    int _1478 = _1472 * as_type<int>(_1294);
    int _1480 = _1478 + _1466;
    bool _1482 = !_1464;
    int _1484 = _1482 ? 0 : (-1);
    bool _1486 = !_592;
    int _1488 = _1486 ? 0 : 1;
    int _1490 = ~_1476;
    int _1492 = _1490 + 1;
    int _1494 = _1492 + 1;
    int _1496 = abs(_1484);
    int _1498 = abs(_1488);
    int _1500 = _1494 * as_type<int>(_1340);
    int _1502 = _1500 + _1480;
    float _1504 = as_type<float>(_1496);
    float _1506 = as_type<float>(_1498);
    if (!_1474)
    {
        _1504 = _1352;
    }
    float _1508 = _1504;
    float _1510 = _1508;
    if (!_1474)
    {
        _1506 = _1358;
    }
    float _1512 = _1506;
    int _1514 = ~_1496;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    float _1520 = _1512;
    if (!_1474)
    {
        _1408 = _1462;
    }
    float _1522 = _1408;
    bool _1524 = !_1474;
    float _1526 = _1522;
    if (!_1524)
    {
        float _1528 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1532 = _1404 + _1530;
        float _1534 = rsqrt(_1392);
        float _1536 = _1532 * _1528;
        float _1538 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = _1536 * 0.15915493667125701904296875;
        float _1542 = _1540 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = _1540 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        float _1550 = fma(_1544, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1534 * _1550;
        float _1554 = fma(_1362, _1552, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = _1548 + (-1.0);
        float _1558 = fma(_1372, _1552, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1562 = _1554 + _1560;
        float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1568 = _1558 + _1566;
        float _1570 = _1562 * _1562;
        float _1572 = fma(_1462, _1548, _1564);
        float _1574 = _1568 * _1568;
        _1526 = _1572;
        _1410 = _1570;
        _1412 = _1574;
        _1510 = _1554;
        _1520 = _1558;
    }
    float _1576 = _1526;
    float _1578 = _1410;
    float _1580 = _1412;
    float _1582 = _1510;
    float _1584 = _1520;
    int _1586 = ~_1498;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    int _1592 = _1518 * as_type<int>(_1348);
    int _1594 = _1592 + _1502;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1598 = _1576 + _1596;
    bool _1600 = !_800;
    int _1602 = _1600 ? _1424 : (-1);
    float _1604 = -_732;
    float _1606 = _1604 + 1.0;
    int _1608 = _1594 * _1590;
    float _1610 = fma(_1598, _1598, _1578);
    float _1612 = -_738;
    float _1614 = _1612 + 1.0;
    float _1616 = fma(_1354, _1310, _1282);
    int _1618 = _1602 * _1498;
    int _1620 = _1618 + _1608;
    float _1622 = _1610 + _1580;
    float _1624 = _1312 + _1388;
    float _1626 = _1322 + _1378;
    float _1628 = -_1606;
    float _1630 = fma(_1088, _1628, _1106);
    float _1632 = fma(_1098, _1614, _1128);
    float _1634 = sqrt(_1622);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1648 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1652 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1658 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = float(_1620);
    float _1666 = _1368 + _1616;
    out.m_76.x = _1630;
    out.m_76.y = _1632;
    bool _1668 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1670 = isnan(_1634);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1676 = _1672 || _1674;
    out.m_78.x = _1656;
    out.m_78.y = _1658;
    out.m_78.z = _1660;
    out.m_78.w = _1650;
    out.m_80.x = _1652;
    out.m_80.y = _1654;
    out.m_80.z = _1662;
    out.m_80.w = _1648;
    out.m_82.x = _1664;
    int _1678 = as_type<int>(_1584);
    if (!_1676)
    {
        _1414 = 1.0;
    }
    float _1680 = _1414;
    out.m_84.x = _1624;
    out.m_84.y = _1626;
    out.m_84.z = _1666;
    bool _1682 = !_1676;
    float _1684 = _1680;
    if (!_1682)
    {
        bool _1686 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1688 = isnan(_1634);
        bool _1690 = _1686 || _1688;
        bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1694 = _1690 || _1692;
        if (!_1694)
        {
            float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1698 = _1634 + _1696;
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1706 = _1704 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1708 = 1.0 / _1702;
            float _1710 = _1698 * _1708;
            float _1712 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1684 = _1712;
            _1714 = true;
        }
        else
        {
            bool _1716 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1718 = isnan(_1634);
            bool _1720 = _1716 || _1718;
            bool _1722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1724 = _1720 || _1722;
            if (!_1724)
            {
                float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1728 = _1634 + _1726;
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1738 = 1.0 / _1732;
                float _1740 = _1728 * _1738;
                float _1742 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1684 = _1742;
                _1714 = true;
            }
            else
            {
                _1684 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1714 = false;
    float _1744 = _1684;
    float _1746 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1748 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1750 = floor(_1746);
    float _1752 = floor(_1748);
    float _1754 = -_1750;
    float _1756 = _1746 + _1754;
    float _1758 = -_1752;
    float _1760 = _1748 + _1758;
    float2 _5902 = float2(_1756, _1760);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).x;
    float _1764 = _786 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1768 = _1582 + _1766;
    float _1770 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1764);
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1576 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1778 = _1584 + _1776;
    float _1780 = fma(_1768, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1782 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1770);
    float _1784 = _786 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1790 = 1.0 / _1786;
    float _1792 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1788);
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1796 = _1794 + _1786;
    float _1798 = _1796 * _1790;
    float _1800 = _1798 * 0.5;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1804 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1802);
    float _1806 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1808 = _786 + _1806;
    float _1810 = 1.0 / _1804;
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1816 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1812);
    float _1818 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1814);
    float _1820 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1816);
    float _1822 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1818);
    float _1824 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1828 = _1810 * _1826;
    float _1830 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1832 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1834 = trunc(_1824);
    int _1836 = int(_1834);
    bool _1838 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1840 = !_1832;
    int _1842 = _1840 ? 0 : 1;
    float _1844 = trunc(_1830);
    int _1846 = int(_1844);
    int _1848 = 2;
    int _1850 = as_type<int>(_1778);
    float _1852 = _1774;
    if (!_1832)
    {
        _1848 = 1;
    }
    int _1854 = _1848;
    int _1856 = _1854;
    if (!_1838)
    {
        _1856 = _1842;
    }
    int _1858 = _1856;
    int _1860 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1862 = _1836 + _1860;
    int _1864 = _1862 + 1;
    int _1866 = _1858 << 6;
    bool _1868 = _1864 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1870 = _1866 + 48;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    int _1888 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1890 = _1846 + _1888;
    int _1892 = _1890 + 1;
    int _1894 = _1864 | _1892;
    int _1896 = _1866 + 56;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
    int _1902 = int(_1898) & 3;
    float _1904 = (*spvDescriptorSet0.vp_c15)._m0[int(_1900)][_1902];
    int _1906 = int(_1898) + 1;
    uint _1908 = uint(int(uint(_1906) >> uint(2)));
    int _1910 = _1906 & 3;
    float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
    bool _1914 = _1894 < 0;
    bool _1916 = _1914 || _1868;
    bool _1918 = _1892 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1920 = _1918 || _1916;
    int _1922 = _1866 + 64;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[int(_1934)][_1936];
    bool _1940 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.5);
    bool _1948 = _1944 || _1946;
    float _1950 = fma(_1774, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1952 = fma(_1778, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1954 = _1866 + 72;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    float _1972 = as_type<float>(_1864);
    float _1974 = _1952;
    int _1976 = as_type<int>(_1950);
    if (!_1920)
    {
        int _1978 = _1892 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1980 = _1978 + _1864;
        _1850 = _1980;
    }
    int _1982 = _1850;
    float _1984 = as_type<float>(_1982);
    if (_1948)
    {
        _1972 = _1780;
    }
    float _1986 = _1972;
    int _1988 = _1866 + 96;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c15)._m0[int(_1992)][_1994];
    int _1998 = int(_1990) + 1;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    int _2002 = _1998 & 3;
    float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
    float _2006 = _1986;
    if (_1948)
    {
        _1852 = _1950;
    }
    float _2008 = _1852;
    int _2010 = _1866 + 104;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
    float _2028 = _2008;
    int _2030 = as_type<int>(_1996);
    if (!_1948)
    {
        float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2034 = _786 + _2032;
        float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2038 = _764 + _2036;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2042 = _2034 * _2034;
        float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2046 = _782 + _2044;
        float _2048 = fma(_2038, _2038, _2042);
        float _2050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2052 = fma(_2046, _2046, _2048);
        float _2054 = sqrt(_2052);
        float _2056 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2058 = precise::min(_2054, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2050;
        float _2062 = -_786;
        float _2064 = _2062 + _1950;
        float _2066 = -_764;
        float _2068 = _2066 + _1780;
        float _2070 = -_782;
        float _2072 = _2070 + _1952;
        float _2074 = _2056 * _2060;
        float _2076 = fma(_2064, _2074, _786);
        float _2078 = fma(_2068, _2074, _764);
        float _2080 = fma(_2072, _2074, _782);
        _2028 = _2076;
        _2006 = _2078;
        _1974 = _2080;
        _1976 = as_type<int>(_2074);
        _1678 = as_type<int>(_2064);
    }
    float _2082 = _2028;
    float _2084 = _2006;
    float _2086 = _1974;
    int _2088 = _1976;
    int _2090 = _1678;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2094 = _1808 * _2004;
    int _2096 = _2088;
    int _2098 = _2090;
    if (!_1920)
    {
        int _2100 = _1982 << 2;
        _2096 = _2100;
    }
    int _2102 = _2096;
    float _2104 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2092);
    float _2108 = fma(_764, _1996, _2094);
    if (!_1920)
    {
        uint _2110 = uint(int(uint(_1982) >> uint(2)));
        _2098 = int(_2110);
    }
    int _2112 = _2098;
    float _2114 = _1808 * _1938;
    float _2116 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2106);
    if (!_1920)
    {
        int _2118 = 12 & _2102;
        _2030 = _2118;
    }
    int _2120 = _2030;
    float _2122 = fma(_782, _2018, _2108);
    float _2124 = fma(_764, _1930, _2114);
    float _2126 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = as_type<float>(_2120);
    if (!_1920)
    {
        int _2130 = _2112 << 4;
        int _2132 = _2130 + _2120;
        _2128 = as_type<float>(_2132);
    }
    float _2134 = _2128;
    float _2136 = _2122 + _2026;
    int _2138 = _1866 + 80;
    uint _2140 = uint(int(uint(_2138) >> uint(2)));
    uint _2142 = uint(int(uint(int(_2140)) >> uint(2)));
    int _2144 = int(_2140) & 3;
    float _2146 = (*spvDescriptorSet0.vp_c15)._m0[int(_2142)][_2144];
    int _2148 = int(_2140) + 1;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    int _2152 = _2148 & 3;
    float _2154 = (*spvDescriptorSet0.vp_c15)._m0[int(_2150)][_2152];
    float _2156 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2158 = _1808 * _1886;
    float _2160 = fma(_782, _1962, _2124);
    float _2162 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = 1.0 / _2136;
    float _2166 = -_2156;
    float _2168 = fma(_2166, _2104, 1.0);
    float _2170 = fma(_764, _1878, _2158);
    float _2172 = _2134;
    float _2174 = _2168;
    if (!_1920)
    {
        int _2176 = as_type<int>(_2134) + 400;
        uint _2178 = uint(int(uint(_2176) >> uint(2)));
        uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
        int _2182 = int(_2178) & 3;
        float _2184 = (*spvDescriptorSet0.vp_c15)._m0[int(_2180)][_2182];
        _2172 = _2184;
    }
    float _2186 = _2172;
    float _2188 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2190 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2192 = fma(_782, _1904, _2170);
    float _2194 = _2160 + _1970;
    float _2196 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2188);
    float _2198 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2190);
    float _2200 = _2192 + _1912;
    int _2202 = _1866 + 88;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[int(_2214)][_2216];
    float _2220 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2196);
    float _2222 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2198);
    float _2224 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2226 = log2(_2168);
    float _2228 = _2200 * _2164;
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2232 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2234 = _2194 * _2164;
    float _2236 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2224);
    bool _2238 = _2228 >= 0.0;
    float _2240 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2244 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2246 = _2228 <= 1.0;
    bool _2248 = _2246 && _2238;
    float _2250 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2240);
    float _2252 = _2200;
    float _2254 = _2164;
    if (!_1920)
    {
        float _2256 = floor(_1824);
        _2252 = _2256;
    }
    float _2258 = _2252;
    bool _2260 = _2234 >= 0.0;
    bool _2262 = _2260 && _2248;
    float _2264 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2250);
    float _2266 = _2226 * 0.693147182464599609375;
    bool _2268 = _2234 <= 1.0;
    bool _2270 = _2268 && _2262;
    float _2272 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2264);
    float _2274 = _2194;
    float _2276 = _2264;
    if (!_1920)
    {
        float _2278 = floor(_1830);
        _2274 = _2278;
    }
    float _2280 = _2274;
    float _2282 = _1808 * _2154;
    float _2284 = 1.0 / _2272;
    float _2286 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_2270)
    {
        float _2288 = float(_1858);
        _2276 = _2288;
    }
    float _2290 = _2276;
    float _2292 = fma(_764, _2146, _2282);
    float _2294 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2242);
    float _2296 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2286);
    float _2298 = _2290;
    if (!_1920)
    {
        float _2300 = -_2258;
        float _2302 = _1824 + _2300;
        _2174 = _2302;
    }
    float _2304 = _2174;
    float _2306 = _2280;
    if (!_1920)
    {
        float _2308 = -_2280;
        float _2310 = _1830 + _2308;
        _2306 = _2310;
    }
    float _2312 = _2306;
    float _2314 = _2186;
    if (!_1920)
    {
        float _2316 = rint(_2186);
        float _2318 = precise::max(_2316, 0.0);
        uint _2320 = uint(_2318);
        uint _2322 = clamp(_2320, 0u, 65535u);
        _2314 = as_type<float>(_2322);
    }
    float _2324 = _2314;
    float _2326 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2296);
    float _2328 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2294);
    float _2330 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2326);
    float _2332 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2328);
    float _2334 = fma(_782, _2210, _2292);
    float _2336 = _2292;
    float _2338 = _2330;
    if (_2270)
    {
        float _2340 = rint(_2290);
        float _2342 = precise::max(_2340, 0.0);
        uint _2344 = uint(_2342);
        uint _2346 = clamp(_2344, 0u, 65535u);
        _2336 = as_type<float>(_2346);
    }
    float _2348 = _2336;
    float _2350 = _2332 * _2284;
    float _2352 = _2334 + _2218;
    float _2354 = _2330 * _2284;
    float _2356 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2358 = fma(_2350, -0.5, 0.5);
    float _2360 = _2352 * _2164;
    float _2362 = fma(_2354, 0.5, 0.5);
    float _2364 = _2324;
    if (!_1920)
    {
        float3 _6930 = float3(_2304, _2312, float(as_type<int>(_2324)));
        float3 _6934 = select(_6930, float3(0.0), isnan(_6930));
        float _2366 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6934.xy, uint(rint(_6934.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6934.xy, uint(rint(_6934.z)), level(0.0)).x;
        _2364 = _2366;
    }
    float _2368 = _2364;
    float _2370 = _2234;
    if (_2270)
    {
        float3 _6949 = float3(_2228, _2234, float(as_type<int>(_2348)));
        float3 _6951 = select(_6949, float3(0.0), isnan(_6949));
        float _2372 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6951.xy, uint(rint(_6951.z)), _2360, level(0.0));
        _2370 = _2372;
    }
    float _2374 = _2370;
    float3 _6961 = float3(_2362, _2358, _2356);
    float _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6961, float3(0.0), isnan(_6961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6961, float3(0.0), isnan(_6961)), level(0.0)).x;
    float3 _6970 = float3(_2362, _2358, _2356);
    float4 _2379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6970, float3(0.0), isnan(_6970)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6970, float3(0.0), isnan(_6970)), level(0.0)).xyzw;
    float _2381 = _2379.x;
    float _2383 = _2379.y;
    float _2385 = _2379.z;
    float _2387 = _2379.w;
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1920)
    {
        _2254 = 1.0;
    }
    float _2391 = _2254;
    bool _2393 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.5);
    bool _2401 = _2397 || _2399;
    float _2403 = _2391;
    if (_2401)
    {
        _2389 = 1.0;
    }
    float _2405 = _2389;
    float _2407 = _2405;
    if (_2401)
    {
        _2298 = 1.0;
    }
    float _2409 = _2298;
    float _2411 = _2409;
    if (!_2401)
    {
        float _2413 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2417 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2415;
        float _2419 = _2413 * 0.15915493667125701904296875;
        float _2421 = _2419 * 6.283185482025146484375;
        float _2423 = cos(_2421);
        float _2425 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2427 = _2425 * 0.15915493667125701904296875;
        float _2429 = _2419 * 6.283185482025146484375;
        float _2431 = sin(_2429);
        float _2433 = 1.0 / _2423;
        float _2435 = _2427 * 6.283185482025146484375;
        float _2437 = cos(_2435);
        float _2439 = _2431 * _2433;
        float _2441 = _2427 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        float _2445 = _2437 * _2439;
        float _2447 = 1.0 / _2417;
        float _2449 = 1.0 / _2445;
        float _2451 = _2443 * _2449;
        float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2455 = fma(_1828, _2451, _2453);
        float _2457 = _2455 * _2447;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        _2411 = _2459;
    }
    float _2461 = _2411;
    if (!_2401)
    {
        float _2463 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2465 = _2463 * 0.15915493667125701904296875;
        float _2467 = _2465 * 6.283185482025146484375;
        float _2469 = cos(_2467);
        float _2471 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2465 * 6.283185482025146484375;
        float _2477 = sin(_2475);
        float _2479 = 1.0 / _2469;
        float _2481 = _2473 * 6.283185482025146484375;
        float _2483 = cos(_2481);
        float _2485 = _2477 * _2479;
        float _2487 = _2473 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = _2483 * _2485;
        float _2493 = 1.0 / _2491;
        float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2497 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2495;
        float _2499 = 1.0 / _2497;
        float _2501 = _2489 * _2493;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2505 = fma(_1828, _2501, _2503);
        float _2507 = _2505 * _2499;
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -_2509;
        float _2513 = _2511 + 1.0;
        _2407 = _2513;
    }
    float _2515 = _2407;
    if (!_1920)
    {
        int _2517 = _1982 << 4;
        int _2519 = _2517 + 2048;
        uint _2521 = uint(int(uint(_2519) >> uint(2)));
        uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
        int _2525 = int(_2521) & 3;
        float _2527 = (*spvDescriptorSet0.vp_c15)._m0[int(_2523)][_2525];
        int _2529 = int(_2521) + 1;
        uint _2531 = uint(int(uint(_2529) >> uint(2)));
        int _2533 = _2529 & 3;
        float _2535 = (*spvDescriptorSet0.vp_c15)._m0[int(_2531)][_2533];
        int _2537 = _2519 + 8;
        uint _2539 = uint(int(uint(_2537) >> uint(2)));
        uint _2541 = uint(int(uint(int(_2539)) >> uint(2)));
        int _2543 = int(_2539) & 3;
        float _2545 = (*spvDescriptorSet0.vp_c15)._m0[int(_2541)][_2543];
        int _2547 = int(_2539) + 1;
        uint _2549 = uint(int(uint(_2547) >> uint(2)));
        int _2551 = _2547 & 3;
        float _2553 = (*spvDescriptorSet0.vp_c15)._m0[int(_2549)][_2551];
        float _2555 = _1808 * _2535;
        float _2557 = fma(_764, _2527, _2555);
        float _2559 = fma(_782, _2545, _2557);
        float _2561 = _2559 + _2553;
        float _2563 = precise::clamp(_2561, 0.0, 1.0);
        float _2565 = -_2563;
        float _2567 = _2565 + _2368;
        float _2569 = fma(_2567, 500.0, 1.5);
        float _2571 = exp2(_2569);
        float _2573 = 0.0 + _2571;
        float _2575 = precise::clamp(_2573, 0.0, 1.0);
        _1984 = as_type<float>(_2519);
        _2403 = _2575;
    }
    float _2577 = _1984;
    float _2579 = _2403;
    float _2581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2583 = _2082 + _2581;
    float _2585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2587 = _2084 + _2585;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2591 = _2086 + _2589;
    float _2593 = _2583 * _2583;
    float _2595 = fma(_2587, _2587, _2593);
    float _2597 = fma(_2591, _2591, _2595);
    float _2599 = rsqrt(_2597);
    float _2601 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2603 = _2587 * _2601;
    float _2605 = _2591 * _2601;
    float _2607 = _2603 * _2603;
    float _2609 = _2605 * _2605;
    float _2611 = _2607 + _2609;
    float _2613 = sqrt(_2611);
    bool _2615 = _2613 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2619 = _2613 + _2617;
    float _2621 = _2591;
    float _2623 = _2593;
    float _2625 = _2619;
    float _2627 = _2577;
    float _2629 = _2601;
    if (_2615)
    {
        float _2631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2621 = _2631;
    }
    float _2633 = _2621;
    if (_2615)
    {
        float _2635 = rsqrt(_2611);
        _2623 = _2635;
    }
    float _2637 = _2623;
    float _2639 = _2637;
    if (_2615)
    {
        float _2641 = _2619 * _2633;
        _2625 = _2641;
    }
    float _2643 = _2625;
    if (_2615)
    {
        float _2645 = _2643 * 0.15915493667125701904296875;
        _2627 = _2645;
    }
    float _2647 = _2627;
    float _2649 = _2599;
    if (_2615)
    {
        float _2651 = _2647 * 6.283185482025146484375;
        float _2653 = sin(_2651);
        _2649 = _2653;
    }
    float _2655 = _2649;
    float _2657 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2659 = precise::max(0.0, _2657);
    float _2661 = _2368;
    float _2663 = _2659;
    float _2665 = _2655;
    float _2667 = _2657;
    if (_2615)
    {
        float _2669 = _2647 * 6.283185482025146484375;
        float _2671 = cos(_2669);
        _2661 = _2671;
    }
    float _2673 = _2661;
    float _2675 = -_2601;
    float _2677 = -_2659;
    float _2679 = fma(_2583, _2675, _2677);
    float _2681 = _2679;
    if (_2615)
    {
        float _2683 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2663 = _2683;
    }
    float _2685 = _2663;
    float _2687 = _2685;
    if (_2615)
    {
        float _2689 = fma(_2655, _2685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2689;
    }
    float _2691 = _2665;
    float _2693 = _2691;
    if (!_2615)
    {
        _2687 = _2605;
    }
    float _2695 = _2687;
    float _2697 = _2695;
    float _2699 = _2673;
    if (_2615)
    {
        float _2701 = _2673 + (-1.0);
        _2667 = _2701;
    }
    float _2703 = _2667;
    float _2705 = _2703;
    if (_2615)
    {
        float _2707 = _2637 * _2691;
        _2629 = _2707;
    }
    float _2709 = _2629;
    if (!_2615)
    {
        _2693 = _2603;
    }
    float _2711 = _2693;
    float _2713 = _2711;
    if (_2615)
    {
        float _2715 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2705 = _2715;
    }
    float _2717 = _2705;
    if (_2615)
    {
        float _2719 = _2603 * _2709;
        _2713 = _2719;
    }
    float _2721 = _2713;
    if (!_2615)
    {
        _2639 = _2607;
    }
    float _2723 = _2639;
    float _2725 = _2723;
    if (_2615)
    {
        float _2727 = _2605 * _2709;
        _2697 = _2727;
    }
    float _2729 = _2697;
    if (_2615)
    {
        float _2731 = fma(_2679, _2673, _2717);
        _2681 = _2731;
    }
    float _2733 = _2681;
    if (_2615)
    {
        float _2735 = _2721 * _2721;
        _2725 = _2735;
    }
    float _2737 = _2725;
    if (!_2615)
    {
        _2699 = _2609;
    }
    float _2739 = _2699;
    float _2741 = _2739;
    if (_2615)
    {
        float _2743 = _2729 * _2729;
        _2741 = _2743;
    }
    float _2745 = _2741;
    float _2747 = sqrt(_2597);
    float _2749 = fma(_2733, _2733, _2737);
    float _2751 = _2749 + _2745;
    float _2753 = rsqrt(_2751);
    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2757 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2755);
    float _2759 = precise::clamp(_2757, 0.0, 1.0);
    float _2761 = -_2759;
    float _2763 = _2761 + 1.0;
    float _2765 = _2753 * _2721;
    float _2767 = _2753 * _2733;
    float _2769 = _2753 * _2729;
    float _2771 = abs(_2763);
    float _2773 = log2(_2771);
    float _2775 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2777 = -_2775;
    float _2779 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2777);
    float _2781 = -_2769;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2779);
    float _2785 = fma(_2783, -0.5, 0.5);
    float _2787 = fma(_2783, 0.5, 0.5);
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2791 = fma(_2787, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2793 = sqrt(_2785);
    float _2795 = fma(_2787, _2791, -0.212114393711090087890625);
    float _2797 = _2767 + 1.0;
    float _2799 = fma(_2787, _2795, 1.570728778839111328125);
    float _2801 = exp2(_2789);
    float _2803 = _2793 * 0.636619746685028076171875;
    float _2805 = -_2767;
    float _2807 = fma(_2801, _2797, _2805);
    float _2809 = -_2799;
    float _2811 = fma(_2803, _2809, 1.0);
    float _2813 = fma(_2807, 0.5, 0.5);
    float2 _7609 = float2(_2811, _2813);
    float3 _2817 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7609, float2(0.0), isnan(_7609)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7609, float2(0.0), isnan(_7609)), level(0.0)).xyz;
    float _2819 = _2817.x;
    float _2821 = _2817.y;
    float _2823 = _2817.z;
    float _2825 = abs(_1828);
    float _2827 = log2(_2825);
    float _2829 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2831 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2833 = -_1762;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2829);
    float _2839 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2837);
    float _2841 = exp2(_2831);
    bool _2843 = _1828 <= 8000.0;
    bool _2845 = isnan(_1828);
    bool _2847 = _2843 || _2845;
    bool _2849 = isnan(8000.0);
    bool _2851 = _2847 || _2849;
    float _2853 = float(_2851);
    float _2855 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2839);
    float _2857 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2859 = _2855 + _2272;
    out.gl_Position.x = _2330;
    out.gl_Position.y = _2332;
    out.gl_Position.z = _2855;
    out.gl_Position.w = _2272;
    float _2861 = _2859 * 0.5;
    float _2863 = exp2(_2857);
    out.m_86.z = _2861;
    out.m_86.w = _2272;
    float _2865 = -_2841;
    float _2867 = _2865 + 1.0;
    float _2869 = _2867;
    if (!_2270)
    {
        _2338 = 1.0;
    }
    float _2871 = _2338;
    float _2873 = _2871;
    if (_2270)
    {
        bool _2875 = _2374 >= _2360;
        bool _2877 = isnan(_2374);
        bool _2879 = _2875 || _2877;
        bool _2881 = isnan(_2360);
        bool _2883 = _2879 || _2881;
        float _2885 = float(_2883);
        _2873 = _2885;
    }
    float _2887 = _2873;
    float _2889 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2891 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2893 = isnan(_2747);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2899 = _2895 || _2897;
    float _2901 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = _2887 * _2579;
    float _2907 = _2889 * _2376;
    float _2909 = fma(_2903, -2.0, 3.0);
    float _2911 = _2903 * _2903;
    float _2913 = _2911 * _2909;
    float _2915 = _2889;
    if (!_2899)
    {
        _2869 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2917 = _2869;
    float _2919 = -_2913;
    float _2921 = _2919 + 1.0;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2913);
    float _2925 = _2853 * _2923;
    float _2927 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2929 = _2925;
    float _2931 = _2917;
    float _2933 = _2917;
    if (!_2899)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2935 = _2929;
    float _2937 = _2835 * _2927;
    float _2939 = precise::clamp(_2937, 0.0, 1.0);
    float _2941 = _2387 * _2907;
    float _2943 = -_2939;
    float _2945 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2947 = -_2905;
    float _2949 = fma(_2947, _2945, 1.0);
    float _2951 = precise::clamp(_2949, 0.0, 1.0);
    float _2953 = -_2889;
    float _2955 = _2953 + 1.0;
    float _2957 = _2941;
    float _2959 = _2955;
    float _2961 = _2935;
    float _2963 = _2935;
    if (!_2899)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2965 = _2915;
    float _2967 = _2951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2969 = _2461 * _2515;
    out.m_88.x = _2967;
    float _2971 = _2969 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2973 = _2969;
    float _2975 = _2965;
    float _2977 = _2965;
    if (!_2899)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2979 = _2973;
    float _2981 = _2823 * _2907;
    float _2983 = fma(_2819, _2941, _2381);
    float _2985 = fma(_2821, _2941, _2383);
    float _2987 = _2387 * _2955;
    float _2989 = fma(_2387, _2981, _2385);
    float _2991 = _2979;
    float _2993 = _2979;
    if (!_2899)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2995 = _2957;
    float _2997 = _2995;
    float _2999 = _2995;
    if (!_2899)
    {
        _2959 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3001 = _2959;
    out.m_90.x = _2983;
    out.m_90.y = _2985;
    out.m_90.z = _2989;
    out.m_90.w = _2987;
    bool _3003 = !_2899;
    float _3005 = _3001;
    float _3007 = _3001;
    if (!_3003)
    {
        bool _3009 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3011 = isnan(_2747);
        bool _3013 = _3009 || _3011;
        bool _3015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3017 = _3013 || _3015;
        if (!_3017)
        {
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3021 = _2747 + _3019;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3025 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3023;
            float _3027 = 1.0 / _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3049 = _3021 * _3027;
            float _3051 = precise::clamp(_3049, 0.0, 1.0);
            float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3057 = fma(_3051, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3059 = fma(_3051, _3055, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3061 = fma(_3051, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3063 = fma(_3051, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3065 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3067 = fma(_3051, _3047, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2977 = _3059;
            _3007 = _3065;
            _2963 = _3057;
            _2999 = _3063;
            _2933 = _3061;
            _2993 = _3067;
            _3069 = true;
        }
        else
        {
            bool _3071 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3073 = isnan(_2747);
            bool _3075 = _3071 || _3073;
            bool _3077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3079 = _3075 || _3077;
            if (!_3079)
            {
                _2961 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3081 = _2961;
            _2963 = _3081;
            if (!_3079)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3083 = _2975;
            _2977 = _3083;
            if (!_3079)
            {
                _2931 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3085 = _2931;
            _2933 = _3085;
            if (!_3079)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3087 = _2997;
            _2999 = _3087;
            if (!_3079)
            {
                _3005 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3089 = _3005;
            _3007 = _3089;
            if (!_3079)
            {
                _2991 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3091 = _2991;
            bool _3093 = !_3079;
            _2993 = _3091;
            if (!_3093)
            {
                bool _3095 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3097 = isnan(_2747);
                bool _3099 = _3095 || _3097;
                bool _3101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3103 = _3099 || _3101;
                if (!_3103)
                {
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3107 = _2747 + _3105;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3111 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3109;
                    float _3113 = 1.0 / _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3135 = _3107 * _3113;
                    float _3137 = precise::clamp(_3135, 0.0, 1.0);
                    float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3143 = fma(_3137, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3145 = fma(_3137, _3141, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3147 = fma(_3137, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3149 = fma(_3137, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3151 = fma(_3137, _3129, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3153 = fma(_3137, _3133, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2977 = _3145;
                    _3007 = _3151;
                    _2963 = _3143;
                    _2999 = _3149;
                    _2933 = _3147;
                    _2993 = _3153;
                    _3069 = true;
                }
                else
                {
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3007 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2963 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2933 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2993 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3069 = false;
    float _3155 = _2977;
    float _3157 = _3007;
    float _3159 = _2963;
    float _3161 = _2999;
    float _3163 = _2933;
    float _3165 = _2993;
    float _3167 = fma(_1626, -0.5, 0.5);
    float _3169 = precise::clamp(_3167, 0.0, 1.0);
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    float _3175 = _2971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3177 = -_3159;
    float _3179 = _3177 + _3161;
    float _3181 = fma(_3169, _3173, _3155);
    out.m_92.x = 0.0;
    float _3183 = -_3163;
    float _3185 = _3183 + _3165;
    float _3187 = fma(_3169, _3179, _3159);
    float _3189 = _3181 * 0.586610972881317138671875;
    out.m_65.x = _3175;
    bool _3191 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3193 = fma(_3169, _3185, _3163);
    float _3195 = fma(_3187, 0.298911988735198974609375, _3189);
    bool _3197 = _2461 > 0.0;
    bool _3199 = isnan(_2461);
    bool _3201 = _3197 || _3199;
    bool _3203 = isnan(0.0);
    bool _3205 = _3201 || _3203;
    float _3207 = fma(_3193, 0.114477999508380889892578125, _3195);
    bool _3209 = _2515 <= 0.0;
    bool _3211 = !_3205;
    bool _3213 = _3209 || _3211;
    float _3215 = -_3207;
    float _3217 = _3187 + _3215;
    float _3219 = -_3207;
    float _3221 = _3181 + _3219;
    float _3223 = -_3207;
    float _3225 = _3193 + _3223;
    float _3227 = fma(_3217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    float _3231 = fma(_3225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    bool _3233 = !_3191;
    if (!_3233)
    {
        float _3235 = -_2082;
        float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3239 = -_2084;
        float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3243 = -_2086;
        float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3247 = _3237 * _3237;
        float _3249 = fma(_3241, _3241, _3247);
        float _3251 = fma(_3245, _3245, _3249);
        float _3253 = sqrt(_3251);
        float _3255 = rsqrt(_3251);
        float _3257 = -_3253;
        float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3261 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3263 = precise::clamp(_3261, 0.0, 1.0);
        float _3265 = _3241 * _3255;
        float _3267 = _3237 * _3255;
        float _3269 = abs(_3263);
        float _3271 = log2(_3269);
        float _3273 = _3245 * _3255;
        float _3275 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3277 = _1626 * _3267;
        float _3279 = -_3267;
        float _3281 = -_3275;
        float _3283 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3281);
        float _3285 = fma(_1624, _3265, _3277);
        float _3287 = -_3273;
        float _3289 = fma(_3287, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3283);
        float _3291 = fma(_1666, _3273, _3285);
        float _3293 = precise::clamp(_3291, 0.0, 1.0);
        float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3297 = _3289 + _3295;
        float _3299 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = exp2(_3299);
        float _3307 = _3305 * _3303;
        float _3309 = _3293 * _3307;
        float _3311 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3313 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3315 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3311;
        out.m_92.y = _3313;
        out.m_92.z = _3315;
    }
    out.m_94.x = _3227;
    out.m_94.y = _3229;
    out.m_94.z = _3231;
    if (!_3213)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_65.x = 0.0;
    float _3317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3317;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3069 = false;
    bool _1714 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = in.m_60.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = _110;
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_65.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_137);
        out.gl_Position.z = _3385;
    }
    if (!_123)
    {
        return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = float(_115);
    bool _153 = _119 >= _151;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    if (_157)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _127;
    if (_157)
    {
        out.m_65.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _139 = as_type<int>(_161);
    }
    int _163 = _139;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3440 = as_type<float>(_163);
        out.gl_Position.z = _3440;
    }
    if (_157)
    {
        return out;
    }
    float _165 = 1.0 / _151;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _119 * _165;
    bool _171 = !_167;
    float _173 = _169;
    float _191;
    if (!_171)
    {
        float _175 = in.m_67.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        _191 = _169;
    }
    _193 = false;
    float _195 = _191;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _195 + _197;
    bool _201 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _203 = isnan(_195);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -_211;
    float _219 = _217 + 1.0;
    bool _221 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _223 = isnan(_195);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _233;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _239 = 1.0 / _215;
    float _241 = _231 * _219;
    float _243 = -_231;
    float _245 = _243 + 1.0;
    float _247 = _199 * _239;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _249;
    float _253 = fma(_235, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _255 = fma(_251, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _257 = _253 * _241;
    float _259 = _255 * _241;
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].x, _257);
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].y, _259);
    float _265 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[144].x, _261);
    float _267 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[144].y, _263);
    bool _269 = !_237;
    if (!_269)
    {
        float _271 = in.m_67.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _173 = _285;
    }
    float _287 = _173;
    float _289 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _291 = int(_289);
    float _293 = in.m_67.x;
    float _295 = in.m_67.y;
    float _297 = as_type<float>(int(gl_VertexIndex));
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _301 = int(_299);
    float _303 = in.m_67.z;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _309 = in.m_72.x;
    float _311 = in.m_72.y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _315 = float(_291);
    float _317 = 1.0 / _307;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _321 = float(uint(_301));
    float _323 = 1.0 / _315;
    float _325 = _295 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _327 = fma(_325, -2.0, _313);
    float _329 = 1.0 / _321;
    float _331 = _303 * 2.0;
    float _333 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _327);
    float _335 = _265 * _309;
    float _337 = _267 * _311;
    float _339 = _323 * _119;
    float _341 = _295 * 2.0;
    float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _345 = log2(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    int _351 = as_type<int>(_329) + (-2);
    float _353 = trunc(_339);
    int _355 = int(_353);
    int _357 = ~_301;
    int _359 = _357 + 1;
    float _361 = floor(_341);
    float _363 = float(uint(_355));
    float _365 = floor(_331);
    float _367 = as_type<float>(_351) * _363;
    float _369 = _293 * 2.0;
    float _371 = trunc(_367);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    float _378 = floor(_369);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _384 = _359 * int(_376);
    int _386 = _384 + _355;
    float _388 = 1.0 / _382;
    float _390 = float(uint(_386));
    bool _392 = _378 > 0.0;
    float _394 = as_type<float>(_351) * _390;
    bool _396 = _378 >= 0.0;
    bool _398 = isnan(_378);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _418 = _416 != 0;
    float _420 = trunc(_394);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    bool _426 = _361 > 0.0;
    float _428 = -_319;
    float _430 = fma(_406, 2.0, _428);
    bool _432 = _361 >= 0.0;
    bool _434 = isnan(_361);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = _349 * _388;
    int _444 = _404 ? 0 : 1;
    float _446 = -_119;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _430);
    int _450 = _440 ? 0 : 1;
    bool _452 = !_414;
    int _454 = _452 ? 0 : 1;
    int _456 = ~_450;
    int _458 = _456 + 1;
    int _460 = _458 + 1;
    bool _462 = !_410;
    int _464 = _462 ? 0 : 1;
    int _466 = _460;
    if (!_426)
    {
        int _468 = ~_450;
        int _470 = _468 + 1;
        _466 = _470;
    }
    int _472 = _466;
    int _474 = int(_376) + int(_424);
    int _476 = ~_301;
    int _478 = _476 + 1;
    int _480 = ~_444;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    bool _486 = !_418;
    int _488 = _486 ? 0 : 1;
    int _490 = _478 * _474;
    int _492 = _490 + _355;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _504 = _502 != 0;
    int _506 = _484;
    if (!_392)
    {
        int _508 = ~_444;
        int _510 = _508 + 1;
        _506 = _510;
    }
    int _512 = _506;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _516 = _514 != 0;
    bool _518 = !_516;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _524 = _522 != 0;
    bool _526 = uint(_492) >= uint(_301);
    float _528 = in.m_58.x;
    float _530 = in.m_58.y;
    float _532 = in.m_58.z;
    bool _534 = !_524;
    float _536 = _534 ? 7.345489978790283203125 : 1.0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _544 = _542 != 0;
    bool _546 = !_526;
    int _548 = _546 ? 0 : (-1);
    int _550 = as_type<int>(_297) & 1;
    bool _552 = _550 != 0;
    int _554 = as_type<int>(_297) & 2;
    bool _556 = _554 != 0;
    bool _558 = !_500;
    int _560 = _558 ? 0 : 1;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = !_504;
    int _568 = _566 ? 0 : 1;
    int _570 = ~_474;
    int _572 = _570 + _548;
    int _574 = _572 + 1;
    float _576 = 1.0 / _564;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _580 = _578 != 0;
    int _582 = abs(_454);
    float _584 = _530 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _586 = _530 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _530 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _592 = _590 != 0;
    float _594 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _584);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _602 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = _295 + _293;
    float _610 = _598 * _317;
    float _612 = _606 * _576;
    float _614 = _608 + (-1.0);
    float _616 = float(_301);
    float _618 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[4].z, _600);
    bool _620 = !_496;
    int _622 = _620 ? 0 : 1;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _626 = _345 * _119;
    bool _628 = _365 >= 0.0;
    bool _630 = isnan(_365);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = _616 * _119;
    float _640 = exp2(_626);
    int _642 = _636 ? 0 : 1;
    float _644 = _638 * _165;
    bool _646 = _365 > 0.0;
    float _648 = _295 + _303;
    float _650 = _303 + _293;
    int _652 = ~_642;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _660 = 1.0 + _658;
    float _662 = _648 + (-1.0);
    float _664 = _536 * _293;
    float _666 = _650 + (-1.0);
    float _668 = 1.0 / _660;
    float _670 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _674 = _287 + _672;
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    int _682 = _656;
    if (!_646)
    {
        int _684 = ~_642;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    bool _692 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _700 = _696 || _698;
    float _702 = floor(_664);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _706 = _700 ? _680 : 0.0;
    float _708 = fma(_442, _674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _722 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _724 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].z, _704);
    int _726 = abs(_622);
    float _728 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[78].w, _720);
    float _730 = float(_688);
    float _732 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _734 = trunc(_644);
    int _736 = int(_734);
    float _738 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    float _740 = in.m_74.x;
    float _742 = in.m_74.y;
    float _744 = in.m_74.z;
    float _746 = -_702;
    float _748 = _664 + _746;
    if (_718)
    {
        float _750 = _706 * _668;
        _129 = _750;
    }
    float _752 = _129;
    int _754 = abs(_560);
    float _756 = _748 * _616;
    float _758 = float(_355);
    float _760 = _303 + (-0.5);
    int _762 = abs(_568);
    float _764 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _766 = _758 >= _616;
    bool _768 = isnan(_758);
    bool _770 = _766 || _768;
    bool _772 = isnan(_616);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = trunc(_756);
    int _780 = int(_778);
    float _782 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _784 = float(_512);
    float _786 = _722 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = float(_754);
    float _790 = float(_726);
    float _792 = trunc(_776);
    int _794 = int(_792);
    int _796 = abs(_520);
    float _798 = _788 * _784;
    bool _800 = _301 == 0;
    float _802 = _790 * _730;
    float _804 = float(_472);
    float _806 = _798 * (-2.0);
    float _808 = _802 * (-2.0);
    int _810 = _301 * _574;
    int _812 = _810 + _355;
    float _814 = fma(_670, _806, _670);
    float _816 = float(_762);
    int _818 = _780 * _796;
    int _820 = _818 + _355;
    float _822 = fma(_624, _808, _624);
    float _824 = fma(_806, _742, _742);
    float _826 = fma(_808, _740, _740);
    int _828 = ~_794;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    float _834 = _816 * _804;
    bool _836 = !_800;
    int _838 = _836 ? _812 : (-1);
    bool _840 = !_580;
    int _842 = _840 ? 0 : 1;
    float _844 = _834 * (-2.0);
    bool _846 = _293 > 0.5;
    float _848 = _293 + (-0.5);
    int _850 = _301 + (-1);
    int _852 = _838 * _832;
    int _854 = abs(_464);
    float _856 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _826);
    int _858 = _794 * _850;
    int _860 = _858 + _852;
    int _862 = abs(_488);
    float _864 = fma(_844, _744, _744);
    int _866 = _860 * _582;
    float _868 = _295 + (-0.5);
    int _870 = abs(_842);
    int _872 = _736 * _854;
    int _874 = _872 + _866;
    bool _876 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _878 = isnan(_287);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_676, _844, _676);
    bool _890 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _892 = isnan(_287);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    int _902 = _820 * _862;
    int _904 = _902 + _874;
    float _906 = float(uint(_820));
    float _908 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].y, _824);
    bool _910 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = isnan(_287);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    int _922 = _780 * _870;
    int _924 = _922 + _904;
    float _926 = -_886;
    float _928 = _926 + 1.0;
    float _930 = as_type<float>(_351) * _906;
    bool _932 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _934 = isnan(_287);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = fma(_822, _752, _856);
    float _946 = float(uint(_924));
    float _948 = _900 * _928;
    float _950 = -_900;
    float _952 = _950 + 1.0;
    float _954 = trunc(_930);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].z, _864);
    float _962 = as_type<float>(_351) * _946;
    float _964 = fma(_814, _752, _908);
    float _966 = _920 * _952;
    float _968 = -_920;
    float _970 = _968 + 1.0;
    int _972 = ~_301;
    int _974 = _972 + 1;
    float _976 = _964 * 0.15915493667125701904296875;
    float _978 = trunc(_962);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    float _984 = _942 * _970;
    float _986 = _944 * 0.15915493667125701904296875;
    float _988 = fma(_888, _752, _960);
    float _990 = _708 * _984;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _994 = _287 + _992;
    bool _996 = !_552;
    float _998 = _996 ? (-0.5) : 0.5;
    float _1000 = _986 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    int _1004 = ~_301;
    int _1006 = _1004 + 1;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1010 = _287 + _1008;
    bool _1012 = _295 > 0.5;
    float _1014 = fma(_610, _994, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1016 = -_942;
    float _1018 = _1016 + 1.0;
    int _1020 = _1006 * int(_958);
    int _1022 = _1020 + _820;
    bool _1024 = !_556;
    float _1026 = _1024 ? (-0.5) : 0.5;
    int _1028 = _974 * int(_982);
    int _1030 = _1028 + _924;
    float _1032 = _986 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    float _1036 = float(uint(_1030));
    float _1038 = _976 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = _988 * 0.15915493667125701904296875;
    float _1044 = float(uint(_1022));
    float _1046 = fma(_612, _1010, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1052 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = as_type<float>(_351) * _1044;
    float _1056 = _976 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = fma(_1014, _966, _1048);
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _998);
    float _1064 = fma(_1046, _948, _1060);
    float _1066 = _1052 * _1062;
    float _1068 = _1042 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = as_type<float>(_351) * _1036;
    float _1074 = -_998;
    int _1076 = _846 ? as_type<int>(_1074) : as_type<int>(_998);
    float _1078 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = -_1026;
    int _1082 = _1012 ? as_type<int>(_1080) : as_type<int>(_1026);
    float _1084 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1064);
    bool _1086 = !_540;
    float _1088 = _1086 ? _998 : as_type<float>(_1076);
    float _1090 = trunc(_1072);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    bool _1096 = !_544;
    float _1098 = _1096 ? _1026 : as_type<float>(_1082);
    float _1100 = _1078 * _1050;
    float _1102 = _1088 + 0.5;
    float _1104 = _1002 * _1058;
    float _1106 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].x, _448);
    float _1108 = trunc(_1054);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = _1098 + (-0.5);
    int _1116 = ~_301;
    int _1118 = _1116 + 1;
    float _1120 = _1002 * _1070;
    float _1122 = _1058 * _1070;
    float _1124 = -_1114;
    float _1126 = -_333;
    float _1128 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1126);
    float _1130 = _1002 * _1040;
    float _1132 = _1042 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    int _1136 = int(_982) + int(_1094);
    float _1138 = _1034 * _1058;
    float _1140 = _1034 * _1040;
    float _1142 = _1034 * _1070;
    int _1144 = ~_301;
    int _1146 = _1144 + 1;
    float _1148 = _1040 * _1070;
    int _1150 = int(_958) + int(_1112);
    int _1152 = _1118 * _1136;
    int _1154 = _1152 + _924;
    float _1156 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1158 = _1142 * _1100;
    bool _1160 = uint(_1154) >= uint(_301);
    float _1162 = fma(_1134, _1138, _1130);
    float _1164 = -_1140;
    float _1166 = fma(_1134, _1104, _1164);
    float _1168 = fma(_1134, _1130, _1138);
    float _1170 = -_1104;
    float _1172 = fma(_1134, _1140, _1170);
    float _1174 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1178 = -_1134;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1156);
    float _1182 = -_1100;
    float _1184 = _1134 * _1182;
    float _1186 = -_1134;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1190 = -_1134;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1176);
    bool _1194 = !_1160;
    int _1196 = _1194 ? 0 : (-1);
    int _1198 = _1146 * _1150;
    int _1200 = _1198 + _820;
    float _1202 = _1120 * _1100;
    float _1204 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1188);
    int _1206 = ~_1136;
    int _1208 = _1206 + _1196;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1122, _1066, _1184);
    bool _1214 = uint(_1200) >= uint(_301);
    float _1216 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1218 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    int _1220 = _301 * _1210;
    int _1222 = _1220 + _924;
    float _1224 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1162, _1066, _1158);
    float _1228 = fma(_1166, _1066, _1202);
    float _1230 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1232 = !_800;
    int _1234 = _1232 ? _1222 : (-1);
    float _1236 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1238 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1240 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1242 = _1234 >> 31;
    float _1244 = fma(_1148, _1230, _1212);
    float _1246 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1238);
    float _1248 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1240);
    int _1250 = _1242 & 3;
    float _1252 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1254 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1256 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1258 = _1234 + _1250;
    float _1260 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1252);
    float _1262 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1264 = fma(_1172, _1230, _1226);
    int _1266 = _1258 >> 2;
    float _1268 = fma(_1168, _1230, _1228);
    float _1270 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1254);
    float _1272 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1256);
    int _1274 = _1266 << 4;
    int _1276 = _1274 + 368;
    float _1278 = _1262 * _1216;
    float _1280 = _1262 * _1204;
    float _1282 = _1262 * _1218;
    float _1284 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1236);
    float _1286 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1288 = uint(int(uint(_1276) >> uint(2)));
    uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
    int _1292 = int(_1288) & 3;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[int(_1290)][_1292];
    int _1296 = int(_1288) + 1;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    int _1300 = _1296 & 3;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[int(_1298)][_1300];
    float _1304 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1272);
    float _1306 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1308 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1286);
    float _1310 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1246);
    float _1312 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1248);
    float _1314 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1306);
    float _1316 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    int _1318 = _1234 & 3;
    bool _1320 = _1318 != 0;
    float _1322 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1260);
    float _1324 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1314);
    float _1326 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1328 = _1234 & 3;
    bool _1330 = _1328 != 0;
    int _1332 = _1276 + 8;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1352 = _764 + _1326;
    float _1354 = _998 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1356 = uint(_1318) > 1u;
    float _1358 = _782 + _1350;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1362 = _1352 + _1360;
    bool _1364 = !_1214;
    int _1366 = _1364 ? 0 : (-1);
    float _1368 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1270);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1358 + _1370;
    float _1374 = _1362 * _1362;
    int _1376 = _1330 ? 0 : 1;
    float _1378 = fma(_1354, _1304, _1280);
    float _1380 = _1372 * _1372;
    int _1382 = ~_1150;
    int _1384 = _1382 + _1366;
    int _1386 = _1384 + 1;
    float _1388 = fma(_1354, _1284, _1278);
    bool _1390 = _1318 != 3;
    float _1392 = _1374 + _1380;
    bool _1394 = uint(_1318) >= 2u;
    float _1396 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1398 = ~_1376;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    float _1404 = sqrt(_1392);
    int _1406 = _1402;
    float _1408 = _1352;
    float _1410 = _1374;
    float _1412 = _1380;
    float _1414 = _1310;
    if (!_1356)
    {
        int _1416 = ~_1376;
        int _1418 = _1416 + 1;
        _1406 = _1418;
    }
    int _1420 = _1406;
    int _1422 = _301 * _1386;
    int _1424 = _1422 + _820;
    bool _1426 = !_1320;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1396);
    int _1432 = _1394 ? 0 : 1;
    int _1434 = abs(_1420);
    float _1436 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    int _1438 = abs(_1428);
    int _1440 = ~_1432;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1448 = _1444;
    if (_1390)
    {
        int _1450 = ~_1432;
        int _1452 = _1450 + 1;
        _1448 = _1452;
    }
    int _1454 = _1448;
    int _1456 = ~_1434;
    int _1458 = _1456 + 1;
    int _1460 = _1458 + 1;
    float _1462 = _786 + _1446;
    bool _1464 = _1318 != 3;
    int _1466 = _1460 * as_type<int>(_1302);
    int _1468 = ~_1438;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    bool _1474 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1476 = abs(_1454);
    int _1478 = _1472 * as_type<int>(_1294);
    int _1480 = _1478 + _1466;
    bool _1482 = !_1464;
    int _1484 = _1482 ? 0 : (-1);
    bool _1486 = !_592;
    int _1488 = _1486 ? 0 : 1;
    int _1490 = ~_1476;
    int _1492 = _1490 + 1;
    int _1494 = _1492 + 1;
    int _1496 = abs(_1484);
    int _1498 = abs(_1488);
    int _1500 = _1494 * as_type<int>(_1340);
    int _1502 = _1500 + _1480;
    float _1504 = as_type<float>(_1496);
    float _1506 = as_type<float>(_1498);
    if (!_1474)
    {
        _1504 = _1352;
    }
    float _1508 = _1504;
    float _1510 = _1508;
    if (!_1474)
    {
        _1506 = _1358;
    }
    float _1512 = _1506;
    int _1514 = ~_1496;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    float _1520 = _1512;
    if (!_1474)
    {
        _1408 = _1462;
    }
    float _1522 = _1408;
    bool _1524 = !_1474;
    float _1526 = _1522;
    if (!_1524)
    {
        float _1528 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1532 = _1404 + _1530;
        float _1534 = rsqrt(_1392);
        float _1536 = _1532 * _1528;
        float _1538 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = _1536 * 0.15915493667125701904296875;
        float _1542 = _1540 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = _1540 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        float _1550 = fma(_1544, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1534 * _1550;
        float _1554 = fma(_1362, _1552, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = _1548 + (-1.0);
        float _1558 = fma(_1372, _1552, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1562 = _1554 + _1560;
        float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1568 = _1558 + _1566;
        float _1570 = _1562 * _1562;
        float _1572 = fma(_1462, _1548, _1564);
        float _1574 = _1568 * _1568;
        _1526 = _1572;
        _1410 = _1570;
        _1412 = _1574;
        _1510 = _1554;
        _1520 = _1558;
    }
    float _1576 = _1526;
    float _1578 = _1410;
    float _1580 = _1412;
    float _1582 = _1510;
    float _1584 = _1520;
    int _1586 = ~_1498;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    int _1592 = _1518 * as_type<int>(_1348);
    int _1594 = _1592 + _1502;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1598 = _1576 + _1596;
    bool _1600 = !_800;
    int _1602 = _1600 ? _1424 : (-1);
    float _1604 = -_732;
    float _1606 = _1604 + 1.0;
    int _1608 = _1594 * _1590;
    float _1610 = fma(_1598, _1598, _1578);
    float _1612 = -_738;
    float _1614 = _1612 + 1.0;
    float _1616 = fma(_1354, _1310, _1282);
    int _1618 = _1602 * _1498;
    int _1620 = _1618 + _1608;
    float _1622 = _1610 + _1580;
    float _1624 = _1312 + _1388;
    float _1626 = _1322 + _1378;
    float _1628 = -_1606;
    float _1630 = fma(_1088, _1628, _1106);
    float _1632 = fma(_1098, _1614, _1128);
    float _1634 = sqrt(_1622);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1648 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1652 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1658 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = float(_1620);
    float _1666 = _1368 + _1616;
    out.m_76.x = _1630;
    out.m_76.y = _1632;
    bool _1668 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1670 = isnan(_1634);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1676 = _1672 || _1674;
    out.m_78.x = _1656;
    out.m_78.y = _1658;
    out.m_78.z = _1660;
    out.m_78.w = _1650;
    out.m_80.x = _1652;
    out.m_80.y = _1654;
    out.m_80.z = _1662;
    out.m_80.w = _1648;
    out.m_82.x = _1664;
    int _1678 = as_type<int>(_1584);
    if (!_1676)
    {
        _1414 = 1.0;
    }
    float _1680 = _1414;
    out.m_84.x = _1624;
    out.m_84.y = _1626;
    out.m_84.z = _1666;
    bool _1682 = !_1676;
    float _1684 = _1680;
    if (!_1682)
    {
        bool _1686 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1688 = isnan(_1634);
        bool _1690 = _1686 || _1688;
        bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1694 = _1690 || _1692;
        if (!_1694)
        {
            float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1698 = _1634 + _1696;
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1706 = _1704 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1708 = 1.0 / _1702;
            float _1710 = _1698 * _1708;
            float _1712 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1684 = _1712;
            _1714 = true;
        }
        else
        {
            bool _1716 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1718 = isnan(_1634);
            bool _1720 = _1716 || _1718;
            bool _1722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1724 = _1720 || _1722;
            if (!_1724)
            {
                float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1728 = _1634 + _1726;
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1738 = 1.0 / _1732;
                float _1740 = _1728 * _1738;
                float _1742 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1684 = _1742;
                _1714 = true;
            }
            else
            {
                _1684 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1714 = false;
    float _1744 = _1684;
    float _1746 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1748 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1750 = floor(_1746);
    float _1752 = floor(_1748);
    float _1754 = -_1750;
    float _1756 = _1746 + _1754;
    float _1758 = -_1752;
    float _1760 = _1748 + _1758;
    float2 _5902 = float2(_1756, _1760);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).x;
    float _1764 = _786 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1768 = _1582 + _1766;
    float _1770 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1764);
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1576 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1778 = _1584 + _1776;
    float _1780 = fma(_1768, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1782 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1770);
    float _1784 = _786 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1790 = 1.0 / _1786;
    float _1792 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1788);
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1796 = _1794 + _1786;
    float _1798 = _1796 * _1790;
    float _1800 = _1798 * 0.5;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1804 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1802);
    float _1806 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1808 = _786 + _1806;
    float _1810 = 1.0 / _1804;
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1816 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1812);
    float _1818 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1814);
    float _1820 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1816);
    float _1822 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1818);
    float _1824 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1828 = _1810 * _1826;
    float _1830 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1832 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1834 = trunc(_1824);
    int _1836 = int(_1834);
    bool _1838 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1840 = !_1832;
    int _1842 = _1840 ? 0 : 1;
    float _1844 = trunc(_1830);
    int _1846 = int(_1844);
    int _1848 = 2;
    int _1850 = as_type<int>(_1778);
    float _1852 = _1774;
    if (!_1832)
    {
        _1848 = 1;
    }
    int _1854 = _1848;
    int _1856 = _1854;
    if (!_1838)
    {
        _1856 = _1842;
    }
    int _1858 = _1856;
    int _1860 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1862 = _1836 + _1860;
    int _1864 = _1862 + 1;
    int _1866 = _1858 << 6;
    bool _1868 = _1864 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1870 = _1866 + 48;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    int _1888 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1890 = _1846 + _1888;
    int _1892 = _1890 + 1;
    int _1894 = _1864 | _1892;
    int _1896 = _1866 + 56;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
    int _1902 = int(_1898) & 3;
    float _1904 = (*spvDescriptorSet0.vp_c15)._m0[int(_1900)][_1902];
    int _1906 = int(_1898) + 1;
    uint _1908 = uint(int(uint(_1906) >> uint(2)));
    int _1910 = _1906 & 3;
    float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
    bool _1914 = _1894 < 0;
    bool _1916 = _1914 || _1868;
    bool _1918 = _1892 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1920 = _1918 || _1916;
    int _1922 = _1866 + 64;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[int(_1934)][_1936];
    bool _1940 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.5);
    bool _1948 = _1944 || _1946;
    float _1950 = fma(_1774, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1952 = fma(_1778, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1954 = _1866 + 72;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    float _1972 = as_type<float>(_1864);
    float _1974 = _1952;
    int _1976 = as_type<int>(_1950);
    if (!_1920)
    {
        int _1978 = _1892 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1980 = _1978 + _1864;
        _1850 = _1980;
    }
    int _1982 = _1850;
    float _1984 = as_type<float>(_1982);
    if (_1948)
    {
        _1972 = _1780;
    }
    float _1986 = _1972;
    int _1988 = _1866 + 96;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c15)._m0[int(_1992)][_1994];
    int _1998 = int(_1990) + 1;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    int _2002 = _1998 & 3;
    float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
    float _2006 = _1986;
    if (_1948)
    {
        _1852 = _1950;
    }
    float _2008 = _1852;
    int _2010 = _1866 + 104;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
    float _2028 = _2008;
    int _2030 = as_type<int>(_1996);
    if (!_1948)
    {
        float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2034 = _786 + _2032;
        float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2038 = _764 + _2036;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2042 = _2034 * _2034;
        float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2046 = _782 + _2044;
        float _2048 = fma(_2038, _2038, _2042);
        float _2050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2052 = fma(_2046, _2046, _2048);
        float _2054 = sqrt(_2052);
        float _2056 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2058 = precise::min(_2054, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2050;
        float _2062 = -_786;
        float _2064 = _2062 + _1950;
        float _2066 = -_764;
        float _2068 = _2066 + _1780;
        float _2070 = -_782;
        float _2072 = _2070 + _1952;
        float _2074 = _2056 * _2060;
        float _2076 = fma(_2064, _2074, _786);
        float _2078 = fma(_2068, _2074, _764);
        float _2080 = fma(_2072, _2074, _782);
        _2028 = _2076;
        _2006 = _2078;
        _1974 = _2080;
        _1976 = as_type<int>(_2074);
        _1678 = as_type<int>(_2064);
    }
    float _2082 = _2028;
    float _2084 = _2006;
    float _2086 = _1974;
    int _2088 = _1976;
    int _2090 = _1678;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2094 = _1808 * _2004;
    int _2096 = _2088;
    int _2098 = _2090;
    if (!_1920)
    {
        int _2100 = _1982 << 2;
        _2096 = _2100;
    }
    int _2102 = _2096;
    float _2104 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2092);
    float _2108 = fma(_764, _1996, _2094);
    if (!_1920)
    {
        uint _2110 = uint(int(uint(_1982) >> uint(2)));
        _2098 = int(_2110);
    }
    int _2112 = _2098;
    float _2114 = _1808 * _1938;
    float _2116 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2106);
    if (!_1920)
    {
        int _2118 = 12 & _2102;
        _2030 = _2118;
    }
    int _2120 = _2030;
    float _2122 = fma(_782, _2018, _2108);
    float _2124 = fma(_764, _1930, _2114);
    float _2126 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = as_type<float>(_2120);
    if (!_1920)
    {
        int _2130 = _2112 << 4;
        int _2132 = _2130 + _2120;
        _2128 = as_type<float>(_2132);
    }
    float _2134 = _2128;
    float _2136 = _2122 + _2026;
    int _2138 = _1866 + 80;
    uint _2140 = uint(int(uint(_2138) >> uint(2)));
    uint _2142 = uint(int(uint(int(_2140)) >> uint(2)));
    int _2144 = int(_2140) & 3;
    float _2146 = (*spvDescriptorSet0.vp_c15)._m0[int(_2142)][_2144];
    int _2148 = int(_2140) + 1;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    int _2152 = _2148 & 3;
    float _2154 = (*spvDescriptorSet0.vp_c15)._m0[int(_2150)][_2152];
    float _2156 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2158 = _1808 * _1886;
    float _2160 = fma(_782, _1962, _2124);
    float _2162 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = 1.0 / _2136;
    float _2166 = -_2156;
    float _2168 = fma(_2166, _2104, 1.0);
    float _2170 = fma(_764, _1878, _2158);
    float _2172 = _2134;
    float _2174 = _2168;
    if (!_1920)
    {
        int _2176 = as_type<int>(_2134) + 400;
        uint _2178 = uint(int(uint(_2176) >> uint(2)));
        uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
        int _2182 = int(_2178) & 3;
        float _2184 = (*spvDescriptorSet0.vp_c15)._m0[int(_2180)][_2182];
        _2172 = _2184;
    }
    float _2186 = _2172;
    float _2188 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2190 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2192 = fma(_782, _1904, _2170);
    float _2194 = _2160 + _1970;
    float _2196 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2188);
    float _2198 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2190);
    float _2200 = _2192 + _1912;
    int _2202 = _1866 + 88;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[int(_2214)][_2216];
    float _2220 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2196);
    float _2222 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2198);
    float _2224 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2226 = log2(_2168);
    float _2228 = _2200 * _2164;
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2232 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2234 = _2194 * _2164;
    float _2236 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2224);
    bool _2238 = _2228 >= 0.0;
    float _2240 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2244 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2246 = _2228 <= 1.0;
    bool _2248 = _2246 && _2238;
    float _2250 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2240);
    float _2252 = _2200;
    float _2254 = _2164;
    if (!_1920)
    {
        float _2256 = floor(_1824);
        _2252 = _2256;
    }
    float _2258 = _2252;
    bool _2260 = _2234 >= 0.0;
    bool _2262 = _2260 && _2248;
    float _2264 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2250);
    float _2266 = _2226 * 0.693147182464599609375;
    bool _2268 = _2234 <= 1.0;
    bool _2270 = _2268 && _2262;
    float _2272 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2264);
    float _2274 = _2194;
    float _2276 = _2264;
    if (!_1920)
    {
        float _2278 = floor(_1830);
        _2274 = _2278;
    }
    float _2280 = _2274;
    float _2282 = _1808 * _2154;
    float _2284 = 1.0 / _2272;
    float _2286 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_2270)
    {
        float _2288 = float(_1858);
        _2276 = _2288;
    }
    float _2290 = _2276;
    float _2292 = fma(_764, _2146, _2282);
    float _2294 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2242);
    float _2296 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2286);
    float _2298 = _2290;
    if (!_1920)
    {
        float _2300 = -_2258;
        float _2302 = _1824 + _2300;
        _2174 = _2302;
    }
    float _2304 = _2174;
    float _2306 = _2280;
    if (!_1920)
    {
        float _2308 = -_2280;
        float _2310 = _1830 + _2308;
        _2306 = _2310;
    }
    float _2312 = _2306;
    float _2314 = _2186;
    if (!_1920)
    {
        float _2316 = rint(_2186);
        float _2318 = precise::max(_2316, 0.0);
        uint _2320 = uint(_2318);
        uint _2322 = clamp(_2320, 0u, 65535u);
        _2314 = as_type<float>(_2322);
    }
    float _2324 = _2314;
    float _2326 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2296);
    float _2328 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2294);
    float _2330 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2326);
    float _2332 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2328);
    float _2334 = fma(_782, _2210, _2292);
    float _2336 = _2292;
    float _2338 = _2330;
    if (_2270)
    {
        float _2340 = rint(_2290);
        float _2342 = precise::max(_2340, 0.0);
        uint _2344 = uint(_2342);
        uint _2346 = clamp(_2344, 0u, 65535u);
        _2336 = as_type<float>(_2346);
    }
    float _2348 = _2336;
    float _2350 = _2332 * _2284;
    float _2352 = _2334 + _2218;
    float _2354 = _2330 * _2284;
    float _2356 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2358 = fma(_2350, -0.5, 0.5);
    float _2360 = _2352 * _2164;
    float _2362 = fma(_2354, 0.5, 0.5);
    float _2364 = _2324;
    if (!_1920)
    {
        float3 _6930 = float3(_2304, _2312, float(as_type<int>(_2324)));
        float3 _6934 = select(_6930, float3(0.0), isnan(_6930));
        float _2366 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6934.xy, uint(rint(_6934.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6934.xy, uint(rint(_6934.z)), level(0.0)).x;
        _2364 = _2366;
    }
    float _2368 = _2364;
    float _2370 = _2234;
    if (_2270)
    {
        float3 _6949 = float3(_2228, _2234, float(as_type<int>(_2348)));
        float3 _6951 = select(_6949, float3(0.0), isnan(_6949));
        float _2372 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6951.xy, uint(rint(_6951.z)), _2360, level(0.0));
        _2370 = _2372;
    }
    float _2374 = _2370;
    float3 _6961 = float3(_2362, _2358, _2356);
    float _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6961, float3(0.0), isnan(_6961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6961, float3(0.0), isnan(_6961)), level(0.0)).x;
    float3 _6970 = float3(_2362, _2358, _2356);
    float4 _2379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6970, float3(0.0), isnan(_6970)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6970, float3(0.0), isnan(_6970)), level(0.0)).xyzw;
    float _2381 = _2379.x;
    float _2383 = _2379.y;
    float _2385 = _2379.z;
    float _2387 = _2379.w;
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1920)
    {
        _2254 = 1.0;
    }
    float _2391 = _2254;
    bool _2393 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.5);
    bool _2401 = _2397 || _2399;
    float _2403 = _2391;
    if (_2401)
    {
        _2389 = 1.0;
    }
    float _2405 = _2389;
    float _2407 = _2405;
    if (_2401)
    {
        _2298 = 1.0;
    }
    float _2409 = _2298;
    float _2411 = _2409;
    if (!_2401)
    {
        float _2413 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2417 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2415;
        float _2419 = _2413 * 0.15915493667125701904296875;
        float _2421 = _2419 * 6.283185482025146484375;
        float _2423 = cos(_2421);
        float _2425 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2427 = _2425 * 0.15915493667125701904296875;
        float _2429 = _2419 * 6.283185482025146484375;
        float _2431 = sin(_2429);
        float _2433 = 1.0 / _2423;
        float _2435 = _2427 * 6.283185482025146484375;
        float _2437 = cos(_2435);
        float _2439 = _2431 * _2433;
        float _2441 = _2427 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        float _2445 = _2437 * _2439;
        float _2447 = 1.0 / _2417;
        float _2449 = 1.0 / _2445;
        float _2451 = _2443 * _2449;
        float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2455 = fma(_1828, _2451, _2453);
        float _2457 = _2455 * _2447;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        _2411 = _2459;
    }
    float _2461 = _2411;
    if (!_2401)
    {
        float _2463 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2465 = _2463 * 0.15915493667125701904296875;
        float _2467 = _2465 * 6.283185482025146484375;
        float _2469 = cos(_2467);
        float _2471 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2465 * 6.283185482025146484375;
        float _2477 = sin(_2475);
        float _2479 = 1.0 / _2469;
        float _2481 = _2473 * 6.283185482025146484375;
        float _2483 = cos(_2481);
        float _2485 = _2477 * _2479;
        float _2487 = _2473 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = _2483 * _2485;
        float _2493 = 1.0 / _2491;
        float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2497 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2495;
        float _2499 = 1.0 / _2497;
        float _2501 = _2489 * _2493;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2505 = fma(_1828, _2501, _2503);
        float _2507 = _2505 * _2499;
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -_2509;
        float _2513 = _2511 + 1.0;
        _2407 = _2513;
    }
    float _2515 = _2407;
    if (!_1920)
    {
        int _2517 = _1982 << 4;
        int _2519 = _2517 + 2048;
        uint _2521 = uint(int(uint(_2519) >> uint(2)));
        uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
        int _2525 = int(_2521) & 3;
        float _2527 = (*spvDescriptorSet0.vp_c15)._m0[int(_2523)][_2525];
        int _2529 = int(_2521) + 1;
        uint _2531 = uint(int(uint(_2529) >> uint(2)));
        int _2533 = _2529 & 3;
        float _2535 = (*spvDescriptorSet0.vp_c15)._m0[int(_2531)][_2533];
        int _2537 = _2519 + 8;
        uint _2539 = uint(int(uint(_2537) >> uint(2)));
        uint _2541 = uint(int(uint(int(_2539)) >> uint(2)));
        int _2543 = int(_2539) & 3;
        float _2545 = (*spvDescriptorSet0.vp_c15)._m0[int(_2541)][_2543];
        int _2547 = int(_2539) + 1;
        uint _2549 = uint(int(uint(_2547) >> uint(2)));
        int _2551 = _2547 & 3;
        float _2553 = (*spvDescriptorSet0.vp_c15)._m0[int(_2549)][_2551];
        float _2555 = _1808 * _2535;
        float _2557 = fma(_764, _2527, _2555);
        float _2559 = fma(_782, _2545, _2557);
        float _2561 = _2559 + _2553;
        float _2563 = precise::clamp(_2561, 0.0, 1.0);
        float _2565 = -_2563;
        float _2567 = _2565 + _2368;
        float _2569 = fma(_2567, 500.0, 1.5);
        float _2571 = exp2(_2569);
        float _2573 = 0.0 + _2571;
        float _2575 = precise::clamp(_2573, 0.0, 1.0);
        _1984 = as_type<float>(_2519);
        _2403 = _2575;
    }
    float _2577 = _1984;
    float _2579 = _2403;
    float _2581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2583 = _2082 + _2581;
    float _2585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2587 = _2084 + _2585;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2591 = _2086 + _2589;
    float _2593 = _2583 * _2583;
    float _2595 = fma(_2587, _2587, _2593);
    float _2597 = fma(_2591, _2591, _2595);
    float _2599 = rsqrt(_2597);
    float _2601 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2603 = _2587 * _2601;
    float _2605 = _2591 * _2601;
    float _2607 = _2603 * _2603;
    float _2609 = _2605 * _2605;
    float _2611 = _2607 + _2609;
    float _2613 = sqrt(_2611);
    bool _2615 = _2613 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2619 = _2613 + _2617;
    float _2621 = _2591;
    float _2623 = _2593;
    float _2625 = _2619;
    float _2627 = _2577;
    float _2629 = _2601;
    if (_2615)
    {
        float _2631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2621 = _2631;
    }
    float _2633 = _2621;
    if (_2615)
    {
        float _2635 = rsqrt(_2611);
        _2623 = _2635;
    }
    float _2637 = _2623;
    float _2639 = _2637;
    if (_2615)
    {
        float _2641 = _2619 * _2633;
        _2625 = _2641;
    }
    float _2643 = _2625;
    if (_2615)
    {
        float _2645 = _2643 * 0.15915493667125701904296875;
        _2627 = _2645;
    }
    float _2647 = _2627;
    float _2649 = _2599;
    if (_2615)
    {
        float _2651 = _2647 * 6.283185482025146484375;
        float _2653 = sin(_2651);
        _2649 = _2653;
    }
    float _2655 = _2649;
    float _2657 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2659 = precise::max(0.0, _2657);
    float _2661 = _2368;
    float _2663 = _2659;
    float _2665 = _2655;
    float _2667 = _2657;
    if (_2615)
    {
        float _2669 = _2647 * 6.283185482025146484375;
        float _2671 = cos(_2669);
        _2661 = _2671;
    }
    float _2673 = _2661;
    float _2675 = -_2601;
    float _2677 = -_2659;
    float _2679 = fma(_2583, _2675, _2677);
    float _2681 = _2679;
    if (_2615)
    {
        float _2683 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2663 = _2683;
    }
    float _2685 = _2663;
    float _2687 = _2685;
    if (_2615)
    {
        float _2689 = fma(_2655, _2685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2689;
    }
    float _2691 = _2665;
    float _2693 = _2691;
    if (!_2615)
    {
        _2687 = _2605;
    }
    float _2695 = _2687;
    float _2697 = _2695;
    float _2699 = _2673;
    if (_2615)
    {
        float _2701 = _2673 + (-1.0);
        _2667 = _2701;
    }
    float _2703 = _2667;
    float _2705 = _2703;
    if (_2615)
    {
        float _2707 = _2637 * _2691;
        _2629 = _2707;
    }
    float _2709 = _2629;
    if (!_2615)
    {
        _2693 = _2603;
    }
    float _2711 = _2693;
    float _2713 = _2711;
    if (_2615)
    {
        float _2715 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2705 = _2715;
    }
    float _2717 = _2705;
    if (_2615)
    {
        float _2719 = _2603 * _2709;
        _2713 = _2719;
    }
    float _2721 = _2713;
    if (!_2615)
    {
        _2639 = _2607;
    }
    float _2723 = _2639;
    float _2725 = _2723;
    if (_2615)
    {
        float _2727 = _2605 * _2709;
        _2697 = _2727;
    }
    float _2729 = _2697;
    if (_2615)
    {
        float _2731 = fma(_2679, _2673, _2717);
        _2681 = _2731;
    }
    float _2733 = _2681;
    if (_2615)
    {
        float _2735 = _2721 * _2721;
        _2725 = _2735;
    }
    float _2737 = _2725;
    if (!_2615)
    {
        _2699 = _2609;
    }
    float _2739 = _2699;
    float _2741 = _2739;
    if (_2615)
    {
        float _2743 = _2729 * _2729;
        _2741 = _2743;
    }
    float _2745 = _2741;
    float _2747 = sqrt(_2597);
    float _2749 = fma(_2733, _2733, _2737);
    float _2751 = _2749 + _2745;
    float _2753 = rsqrt(_2751);
    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2757 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2755);
    float _2759 = precise::clamp(_2757, 0.0, 1.0);
    float _2761 = -_2759;
    float _2763 = _2761 + 1.0;
    float _2765 = _2753 * _2721;
    float _2767 = _2753 * _2733;
    float _2769 = _2753 * _2729;
    float _2771 = abs(_2763);
    float _2773 = log2(_2771);
    float _2775 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2777 = -_2775;
    float _2779 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2777);
    float _2781 = -_2769;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2779);
    float _2785 = fma(_2783, -0.5, 0.5);
    float _2787 = fma(_2783, 0.5, 0.5);
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2791 = fma(_2787, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2793 = sqrt(_2785);
    float _2795 = fma(_2787, _2791, -0.212114393711090087890625);
    float _2797 = _2767 + 1.0;
    float _2799 = fma(_2787, _2795, 1.570728778839111328125);
    float _2801 = exp2(_2789);
    float _2803 = _2793 * 0.636619746685028076171875;
    float _2805 = -_2767;
    float _2807 = fma(_2801, _2797, _2805);
    float _2809 = -_2799;
    float _2811 = fma(_2803, _2809, 1.0);
    float _2813 = fma(_2807, 0.5, 0.5);
    float2 _7609 = float2(_2811, _2813);
    float3 _2817 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7609, float2(0.0), isnan(_7609)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7609, float2(0.0), isnan(_7609)), level(0.0)).xyz;
    float _2819 = _2817.x;
    float _2821 = _2817.y;
    float _2823 = _2817.z;
    float _2825 = abs(_1828);
    float _2827 = log2(_2825);
    float _2829 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2831 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2833 = -_1762;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2829);
    float _2839 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2837);
    float _2841 = exp2(_2831);
    bool _2843 = _1828 <= 8000.0;
    bool _2845 = isnan(_1828);
    bool _2847 = _2843 || _2845;
    bool _2849 = isnan(8000.0);
    bool _2851 = _2847 || _2849;
    float _2853 = float(_2851);
    float _2855 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2839);
    float _2857 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2859 = _2855 + _2272;
    out.gl_Position.x = _2330;
    out.gl_Position.y = _2332;
    out.gl_Position.z = _2855;
    out.gl_Position.w = _2272;
    float _2861 = _2859 * 0.5;
    float _2863 = exp2(_2857);
    out.m_86.z = _2861;
    out.m_86.w = _2272;
    float _2865 = -_2841;
    float _2867 = _2865 + 1.0;
    float _2869 = _2867;
    if (!_2270)
    {
        _2338 = 1.0;
    }
    float _2871 = _2338;
    float _2873 = _2871;
    if (_2270)
    {
        bool _2875 = _2374 >= _2360;
        bool _2877 = isnan(_2374);
        bool _2879 = _2875 || _2877;
        bool _2881 = isnan(_2360);
        bool _2883 = _2879 || _2881;
        float _2885 = float(_2883);
        _2873 = _2885;
    }
    float _2887 = _2873;
    float _2889 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2891 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2893 = isnan(_2747);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2899 = _2895 || _2897;
    float _2901 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = _2887 * _2579;
    float _2907 = _2889 * _2376;
    float _2909 = fma(_2903, -2.0, 3.0);
    float _2911 = _2903 * _2903;
    float _2913 = _2911 * _2909;
    float _2915 = _2889;
    if (!_2899)
    {
        _2869 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2917 = _2869;
    float _2919 = -_2913;
    float _2921 = _2919 + 1.0;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2913);
    float _2925 = _2853 * _2923;
    float _2927 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2929 = _2925;
    float _2931 = _2917;
    float _2933 = _2917;
    if (!_2899)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2935 = _2929;
    float _2937 = _2835 * _2927;
    float _2939 = precise::clamp(_2937, 0.0, 1.0);
    float _2941 = _2387 * _2907;
    float _2943 = -_2939;
    float _2945 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2947 = -_2905;
    float _2949 = fma(_2947, _2945, 1.0);
    float _2951 = precise::clamp(_2949, 0.0, 1.0);
    float _2953 = -_2889;
    float _2955 = _2953 + 1.0;
    float _2957 = _2941;
    float _2959 = _2955;
    float _2961 = _2935;
    float _2963 = _2935;
    if (!_2899)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2965 = _2915;
    float _2967 = _2951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2969 = _2461 * _2515;
    out.m_88.x = _2967;
    float _2971 = _2969 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2973 = _2969;
    float _2975 = _2965;
    float _2977 = _2965;
    if (!_2899)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2979 = _2973;
    float _2981 = _2823 * _2907;
    float _2983 = fma(_2819, _2941, _2381);
    float _2985 = fma(_2821, _2941, _2383);
    float _2987 = _2387 * _2955;
    float _2989 = fma(_2387, _2981, _2385);
    float _2991 = _2979;
    float _2993 = _2979;
    if (!_2899)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2995 = _2957;
    float _2997 = _2995;
    float _2999 = _2995;
    if (!_2899)
    {
        _2959 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3001 = _2959;
    out.m_90.x = _2983;
    out.m_90.y = _2985;
    out.m_90.z = _2989;
    out.m_90.w = _2987;
    bool _3003 = !_2899;
    float _3005 = _3001;
    float _3007 = _3001;
    if (!_3003)
    {
        bool _3009 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3011 = isnan(_2747);
        bool _3013 = _3009 || _3011;
        bool _3015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3017 = _3013 || _3015;
        if (!_3017)
        {
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3021 = _2747 + _3019;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3025 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3023;
            float _3027 = 1.0 / _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3049 = _3021 * _3027;
            float _3051 = precise::clamp(_3049, 0.0, 1.0);
            float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3057 = fma(_3051, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3059 = fma(_3051, _3055, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3061 = fma(_3051, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3063 = fma(_3051, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3065 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3067 = fma(_3051, _3047, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2977 = _3059;
            _3007 = _3065;
            _2963 = _3057;
            _2999 = _3063;
            _2933 = _3061;
            _2993 = _3067;
            _3069 = true;
        }
        else
        {
            bool _3071 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3073 = isnan(_2747);
            bool _3075 = _3071 || _3073;
            bool _3077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3079 = _3075 || _3077;
            if (!_3079)
            {
                _2961 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3081 = _2961;
            _2963 = _3081;
            if (!_3079)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3083 = _2975;
            _2977 = _3083;
            if (!_3079)
            {
                _2931 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3085 = _2931;
            _2933 = _3085;
            if (!_3079)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3087 = _2997;
            _2999 = _3087;
            if (!_3079)
            {
                _3005 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3089 = _3005;
            _3007 = _3089;
            if (!_3079)
            {
                _2991 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3091 = _2991;
            bool _3093 = !_3079;
            _2993 = _3091;
            if (!_3093)
            {
                bool _3095 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3097 = isnan(_2747);
                bool _3099 = _3095 || _3097;
                bool _3101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3103 = _3099 || _3101;
                if (!_3103)
                {
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3107 = _2747 + _3105;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3111 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3109;
                    float _3113 = 1.0 / _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3135 = _3107 * _3113;
                    float _3137 = precise::clamp(_3135, 0.0, 1.0);
                    float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3143 = fma(_3137, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3145 = fma(_3137, _3141, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3147 = fma(_3137, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3149 = fma(_3137, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3151 = fma(_3137, _3129, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3153 = fma(_3137, _3133, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2977 = _3145;
                    _3007 = _3151;
                    _2963 = _3143;
                    _2999 = _3149;
                    _2933 = _3147;
                    _2993 = _3153;
                    _3069 = true;
                }
                else
                {
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3007 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2963 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2933 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2993 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3069 = false;
    float _3155 = _2977;
    float _3157 = _3007;
    float _3159 = _2963;
    float _3161 = _2999;
    float _3163 = _2933;
    float _3165 = _2993;
    float _3167 = fma(_1626, -0.5, 0.5);
    float _3169 = precise::clamp(_3167, 0.0, 1.0);
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    float _3175 = _2971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3177 = -_3159;
    float _3179 = _3177 + _3161;
    float _3181 = fma(_3169, _3173, _3155);
    out.m_92.x = 0.0;
    float _3183 = -_3163;
    float _3185 = _3183 + _3165;
    float _3187 = fma(_3169, _3179, _3159);
    float _3189 = _3181 * 0.586610972881317138671875;
    out.m_65.x = _3175;
    bool _3191 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3193 = fma(_3169, _3185, _3163);
    float _3195 = fma(_3187, 0.298911988735198974609375, _3189);
    bool _3197 = _2461 > 0.0;
    bool _3199 = isnan(_2461);
    bool _3201 = _3197 || _3199;
    bool _3203 = isnan(0.0);
    bool _3205 = _3201 || _3203;
    float _3207 = fma(_3193, 0.114477999508380889892578125, _3195);
    bool _3209 = _2515 <= 0.0;
    bool _3211 = !_3205;
    bool _3213 = _3209 || _3211;
    float _3215 = -_3207;
    float _3217 = _3187 + _3215;
    float _3219 = -_3207;
    float _3221 = _3181 + _3219;
    float _3223 = -_3207;
    float _3225 = _3193 + _3223;
    float _3227 = fma(_3217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    float _3231 = fma(_3225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    bool _3233 = !_3191;
    if (!_3233)
    {
        float _3235 = -_2082;
        float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3239 = -_2084;
        float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3243 = -_2086;
        float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3247 = _3237 * _3237;
        float _3249 = fma(_3241, _3241, _3247);
        float _3251 = fma(_3245, _3245, _3249);
        float _3253 = sqrt(_3251);
        float _3255 = rsqrt(_3251);
        float _3257 = -_3253;
        float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3261 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3263 = precise::clamp(_3261, 0.0, 1.0);
        float _3265 = _3241 * _3255;
        float _3267 = _3237 * _3255;
        float _3269 = abs(_3263);
        float _3271 = log2(_3269);
        float _3273 = _3245 * _3255;
        float _3275 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3277 = _1626 * _3267;
        float _3279 = -_3267;
        float _3281 = -_3275;
        float _3283 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3281);
        float _3285 = fma(_1624, _3265, _3277);
        float _3287 = -_3273;
        float _3289 = fma(_3287, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3283);
        float _3291 = fma(_1666, _3273, _3285);
        float _3293 = precise::clamp(_3291, 0.0, 1.0);
        float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3297 = _3289 + _3295;
        float _3299 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = exp2(_3299);
        float _3307 = _3305 * _3303;
        float _3309 = _3293 * _3307;
        float _3311 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3313 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3315 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3311;
        out.m_92.y = _3313;
        out.m_92.z = _3315;
    }
    out.m_94.x = _3227;
    out.m_94.y = _3229;
    out.m_94.z = _3231;
    if (!_3213)
    {
        return out;
    }
    out.m_65.x = 0.0;
    float _3317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3317;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3069 = false;
    bool _1714 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = in.m_60.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = _110;
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_65.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_137);
        out.gl_Position.z = _3385;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = float(_115);
    bool _153 = _119 >= _151;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    if (_157)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _127;
    if (_157)
    {
        out.m_65.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _139 = as_type<int>(_161);
    }
    int _163 = _139;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3440 = as_type<float>(_163);
        out.gl_Position.z = _3440;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = 1.0 / _151;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _119 * _165;
    bool _171 = !_167;
    float _173 = _169;
    float _191;
    if (!_171)
    {
        float _175 = in.m_67.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        _191 = _169;
    }
    _193 = false;
    float _195 = _191;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _195 + _197;
    bool _201 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _203 = isnan(_195);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -_211;
    float _219 = _217 + 1.0;
    bool _221 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _223 = isnan(_195);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _233;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _239 = 1.0 / _215;
    float _241 = _231 * _219;
    float _243 = -_231;
    float _245 = _243 + 1.0;
    float _247 = _199 * _239;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _249;
    float _253 = fma(_235, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _255 = fma(_251, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _257 = _253 * _241;
    float _259 = _255 * _241;
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].x, _257);
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].y, _259);
    float _265 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[144].x, _261);
    float _267 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[144].y, _263);
    bool _269 = !_237;
    if (!_269)
    {
        float _271 = in.m_67.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _173 = _285;
    }
    float _287 = _173;
    float _289 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _291 = int(_289);
    float _293 = in.m_67.x;
    float _295 = in.m_67.y;
    float _297 = as_type<float>(int(gl_VertexIndex));
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _301 = int(_299);
    float _303 = in.m_67.z;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _309 = in.m_72.x;
    float _311 = in.m_72.y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _315 = float(_291);
    float _317 = 1.0 / _307;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _321 = float(uint(_301));
    float _323 = 1.0 / _315;
    float _325 = _295 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _327 = fma(_325, -2.0, _313);
    float _329 = 1.0 / _321;
    float _331 = _303 * 2.0;
    float _333 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _327);
    float _335 = _265 * _309;
    float _337 = _267 * _311;
    float _339 = _323 * _119;
    float _341 = _295 * 2.0;
    float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _345 = log2(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    int _351 = as_type<int>(_329) + (-2);
    float _353 = trunc(_339);
    int _355 = int(_353);
    int _357 = ~_301;
    int _359 = _357 + 1;
    float _361 = floor(_341);
    float _363 = float(uint(_355));
    float _365 = floor(_331);
    float _367 = as_type<float>(_351) * _363;
    float _369 = _293 * 2.0;
    float _371 = trunc(_367);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    float _378 = floor(_369);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _384 = _359 * int(_376);
    int _386 = _384 + _355;
    float _388 = 1.0 / _382;
    float _390 = float(uint(_386));
    bool _392 = _378 > 0.0;
    float _394 = as_type<float>(_351) * _390;
    bool _396 = _378 >= 0.0;
    bool _398 = isnan(_378);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _418 = _416 != 0;
    float _420 = trunc(_394);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    bool _426 = _361 > 0.0;
    float _428 = -_319;
    float _430 = fma(_406, 2.0, _428);
    bool _432 = _361 >= 0.0;
    bool _434 = isnan(_361);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = _349 * _388;
    int _444 = _404 ? 0 : 1;
    float _446 = -_119;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _430);
    int _450 = _440 ? 0 : 1;
    bool _452 = !_414;
    int _454 = _452 ? 0 : 1;
    int _456 = ~_450;
    int _458 = _456 + 1;
    int _460 = _458 + 1;
    bool _462 = !_410;
    int _464 = _462 ? 0 : 1;
    int _466 = _460;
    if (!_426)
    {
        int _468 = ~_450;
        int _470 = _468 + 1;
        _466 = _470;
    }
    int _472 = _466;
    int _474 = int(_376) + int(_424);
    int _476 = ~_301;
    int _478 = _476 + 1;
    int _480 = ~_444;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    bool _486 = !_418;
    int _488 = _486 ? 0 : 1;
    int _490 = _478 * _474;
    int _492 = _490 + _355;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _504 = _502 != 0;
    int _506 = _484;
    if (!_392)
    {
        int _508 = ~_444;
        int _510 = _508 + 1;
        _506 = _510;
    }
    int _512 = _506;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _516 = _514 != 0;
    bool _518 = !_516;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _524 = _522 != 0;
    bool _526 = uint(_492) >= uint(_301);
    float _528 = in.m_58.x;
    float _530 = in.m_58.y;
    float _532 = in.m_58.z;
    bool _534 = !_524;
    float _536 = _534 ? 7.345489978790283203125 : 1.0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _544 = _542 != 0;
    bool _546 = !_526;
    int _548 = _546 ? 0 : (-1);
    int _550 = as_type<int>(_297) & 1;
    bool _552 = _550 != 0;
    int _554 = as_type<int>(_297) & 2;
    bool _556 = _554 != 0;
    bool _558 = !_500;
    int _560 = _558 ? 0 : 1;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = !_504;
    int _568 = _566 ? 0 : 1;
    int _570 = ~_474;
    int _572 = _570 + _548;
    int _574 = _572 + 1;
    float _576 = 1.0 / _564;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _580 = _578 != 0;
    int _582 = abs(_454);
    float _584 = _530 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _586 = _530 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _530 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _592 = _590 != 0;
    float _594 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _584);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _602 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = _295 + _293;
    float _610 = _598 * _317;
    float _612 = _606 * _576;
    float _614 = _608 + (-1.0);
    float _616 = float(_301);
    float _618 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[4].z, _600);
    bool _620 = !_496;
    int _622 = _620 ? 0 : 1;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _626 = _345 * _119;
    bool _628 = _365 >= 0.0;
    bool _630 = isnan(_365);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = _616 * _119;
    float _640 = exp2(_626);
    int _642 = _636 ? 0 : 1;
    float _644 = _638 * _165;
    bool _646 = _365 > 0.0;
    float _648 = _295 + _303;
    float _650 = _303 + _293;
    int _652 = ~_642;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _660 = 1.0 + _658;
    float _662 = _648 + (-1.0);
    float _664 = _536 * _293;
    float _666 = _650 + (-1.0);
    float _668 = 1.0 / _660;
    float _670 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _674 = _287 + _672;
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    int _682 = _656;
    if (!_646)
    {
        int _684 = ~_642;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    bool _692 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _700 = _696 || _698;
    float _702 = floor(_664);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _706 = _700 ? _680 : 0.0;
    float _708 = fma(_442, _674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _722 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _724 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].z, _704);
    int _726 = abs(_622);
    float _728 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[78].w, _720);
    float _730 = float(_688);
    float _732 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _734 = trunc(_644);
    int _736 = int(_734);
    float _738 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    float _740 = in.m_74.x;
    float _742 = in.m_74.y;
    float _744 = in.m_74.z;
    float _746 = -_702;
    float _748 = _664 + _746;
    if (_718)
    {
        float _750 = _706 * _668;
        _129 = _750;
    }
    float _752 = _129;
    int _754 = abs(_560);
    float _756 = _748 * _616;
    float _758 = float(_355);
    float _760 = _303 + (-0.5);
    int _762 = abs(_568);
    float _764 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _766 = _758 >= _616;
    bool _768 = isnan(_758);
    bool _770 = _766 || _768;
    bool _772 = isnan(_616);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = trunc(_756);
    int _780 = int(_778);
    float _782 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _784 = float(_512);
    float _786 = _722 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = float(_754);
    float _790 = float(_726);
    float _792 = trunc(_776);
    int _794 = int(_792);
    int _796 = abs(_520);
    float _798 = _788 * _784;
    bool _800 = _301 == 0;
    float _802 = _790 * _730;
    float _804 = float(_472);
    float _806 = _798 * (-2.0);
    float _808 = _802 * (-2.0);
    int _810 = _301 * _574;
    int _812 = _810 + _355;
    float _814 = fma(_670, _806, _670);
    float _816 = float(_762);
    int _818 = _780 * _796;
    int _820 = _818 + _355;
    float _822 = fma(_624, _808, _624);
    float _824 = fma(_806, _742, _742);
    float _826 = fma(_808, _740, _740);
    int _828 = ~_794;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    float _834 = _816 * _804;
    bool _836 = !_800;
    int _838 = _836 ? _812 : (-1);
    bool _840 = !_580;
    int _842 = _840 ? 0 : 1;
    float _844 = _834 * (-2.0);
    bool _846 = _293 > 0.5;
    float _848 = _293 + (-0.5);
    int _850 = _301 + (-1);
    int _852 = _838 * _832;
    int _854 = abs(_464);
    float _856 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _826);
    int _858 = _794 * _850;
    int _860 = _858 + _852;
    int _862 = abs(_488);
    float _864 = fma(_844, _744, _744);
    int _866 = _860 * _582;
    float _868 = _295 + (-0.5);
    int _870 = abs(_842);
    int _872 = _736 * _854;
    int _874 = _872 + _866;
    bool _876 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _878 = isnan(_287);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_676, _844, _676);
    bool _890 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _892 = isnan(_287);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    int _902 = _820 * _862;
    int _904 = _902 + _874;
    float _906 = float(uint(_820));
    float _908 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].y, _824);
    bool _910 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = isnan(_287);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    int _922 = _780 * _870;
    int _924 = _922 + _904;
    float _926 = -_886;
    float _928 = _926 + 1.0;
    float _930 = as_type<float>(_351) * _906;
    bool _932 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _934 = isnan(_287);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = fma(_822, _752, _856);
    float _946 = float(uint(_924));
    float _948 = _900 * _928;
    float _950 = -_900;
    float _952 = _950 + 1.0;
    float _954 = trunc(_930);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].z, _864);
    float _962 = as_type<float>(_351) * _946;
    float _964 = fma(_814, _752, _908);
    float _966 = _920 * _952;
    float _968 = -_920;
    float _970 = _968 + 1.0;
    int _972 = ~_301;
    int _974 = _972 + 1;
    float _976 = _964 * 0.15915493667125701904296875;
    float _978 = trunc(_962);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    float _984 = _942 * _970;
    float _986 = _944 * 0.15915493667125701904296875;
    float _988 = fma(_888, _752, _960);
    float _990 = _708 * _984;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _994 = _287 + _992;
    bool _996 = !_552;
    float _998 = _996 ? (-0.5) : 0.5;
    float _1000 = _986 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    int _1004 = ~_301;
    int _1006 = _1004 + 1;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1010 = _287 + _1008;
    bool _1012 = _295 > 0.5;
    float _1014 = fma(_610, _994, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1016 = -_942;
    float _1018 = _1016 + 1.0;
    int _1020 = _1006 * int(_958);
    int _1022 = _1020 + _820;
    bool _1024 = !_556;
    float _1026 = _1024 ? (-0.5) : 0.5;
    int _1028 = _974 * int(_982);
    int _1030 = _1028 + _924;
    float _1032 = _986 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    float _1036 = float(uint(_1030));
    float _1038 = _976 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = _988 * 0.15915493667125701904296875;
    float _1044 = float(uint(_1022));
    float _1046 = fma(_612, _1010, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1052 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = as_type<float>(_351) * _1044;
    float _1056 = _976 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = fma(_1014, _966, _1048);
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _998);
    float _1064 = fma(_1046, _948, _1060);
    float _1066 = _1052 * _1062;
    float _1068 = _1042 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = as_type<float>(_351) * _1036;
    float _1074 = -_998;
    int _1076 = _846 ? as_type<int>(_1074) : as_type<int>(_998);
    float _1078 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = -_1026;
    int _1082 = _1012 ? as_type<int>(_1080) : as_type<int>(_1026);
    float _1084 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1064);
    bool _1086 = !_540;
    float _1088 = _1086 ? _998 : as_type<float>(_1076);
    float _1090 = trunc(_1072);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    bool _1096 = !_544;
    float _1098 = _1096 ? _1026 : as_type<float>(_1082);
    float _1100 = _1078 * _1050;
    float _1102 = _1088 + 0.5;
    float _1104 = _1002 * _1058;
    float _1106 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].x, _448);
    float _1108 = trunc(_1054);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = _1098 + (-0.5);
    int _1116 = ~_301;
    int _1118 = _1116 + 1;
    float _1120 = _1002 * _1070;
    float _1122 = _1058 * _1070;
    float _1124 = -_1114;
    float _1126 = -_333;
    float _1128 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1126);
    float _1130 = _1002 * _1040;
    float _1132 = _1042 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    int _1136 = int(_982) + int(_1094);
    float _1138 = _1034 * _1058;
    float _1140 = _1034 * _1040;
    float _1142 = _1034 * _1070;
    int _1144 = ~_301;
    int _1146 = _1144 + 1;
    float _1148 = _1040 * _1070;
    int _1150 = int(_958) + int(_1112);
    int _1152 = _1118 * _1136;
    int _1154 = _1152 + _924;
    float _1156 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1158 = _1142 * _1100;
    bool _1160 = uint(_1154) >= uint(_301);
    float _1162 = fma(_1134, _1138, _1130);
    float _1164 = -_1140;
    float _1166 = fma(_1134, _1104, _1164);
    float _1168 = fma(_1134, _1130, _1138);
    float _1170 = -_1104;
    float _1172 = fma(_1134, _1140, _1170);
    float _1174 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1178 = -_1134;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1156);
    float _1182 = -_1100;
    float _1184 = _1134 * _1182;
    float _1186 = -_1134;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1190 = -_1134;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1176);
    bool _1194 = !_1160;
    int _1196 = _1194 ? 0 : (-1);
    int _1198 = _1146 * _1150;
    int _1200 = _1198 + _820;
    float _1202 = _1120 * _1100;
    float _1204 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1188);
    int _1206 = ~_1136;
    int _1208 = _1206 + _1196;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1122, _1066, _1184);
    bool _1214 = uint(_1200) >= uint(_301);
    float _1216 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1218 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    int _1220 = _301 * _1210;
    int _1222 = _1220 + _924;
    float _1224 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1162, _1066, _1158);
    float _1228 = fma(_1166, _1066, _1202);
    float _1230 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1232 = !_800;
    int _1234 = _1232 ? _1222 : (-1);
    float _1236 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1238 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1240 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1242 = _1234 >> 31;
    float _1244 = fma(_1148, _1230, _1212);
    float _1246 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1238);
    float _1248 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1240);
    int _1250 = _1242 & 3;
    float _1252 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1254 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1256 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1258 = _1234 + _1250;
    float _1260 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1252);
    float _1262 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1264 = fma(_1172, _1230, _1226);
    int _1266 = _1258 >> 2;
    float _1268 = fma(_1168, _1230, _1228);
    float _1270 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1254);
    float _1272 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1256);
    int _1274 = _1266 << 4;
    int _1276 = _1274 + 368;
    float _1278 = _1262 * _1216;
    float _1280 = _1262 * _1204;
    float _1282 = _1262 * _1218;
    float _1284 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1236);
    float _1286 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1288 = uint(int(uint(_1276) >> uint(2)));
    uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
    int _1292 = int(_1288) & 3;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[int(_1290)][_1292];
    int _1296 = int(_1288) + 1;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    int _1300 = _1296 & 3;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[int(_1298)][_1300];
    float _1304 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1272);
    float _1306 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1308 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1286);
    float _1310 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1246);
    float _1312 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1248);
    float _1314 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1306);
    float _1316 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    int _1318 = _1234 & 3;
    bool _1320 = _1318 != 0;
    float _1322 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1260);
    float _1324 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1314);
    float _1326 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1328 = _1234 & 3;
    bool _1330 = _1328 != 0;
    int _1332 = _1276 + 8;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1352 = _764 + _1326;
    float _1354 = _998 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1356 = uint(_1318) > 1u;
    float _1358 = _782 + _1350;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1362 = _1352 + _1360;
    bool _1364 = !_1214;
    int _1366 = _1364 ? 0 : (-1);
    float _1368 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1270);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1358 + _1370;
    float _1374 = _1362 * _1362;
    int _1376 = _1330 ? 0 : 1;
    float _1378 = fma(_1354, _1304, _1280);
    float _1380 = _1372 * _1372;
    int _1382 = ~_1150;
    int _1384 = _1382 + _1366;
    int _1386 = _1384 + 1;
    float _1388 = fma(_1354, _1284, _1278);
    bool _1390 = _1318 != 3;
    float _1392 = _1374 + _1380;
    bool _1394 = uint(_1318) >= 2u;
    float _1396 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1398 = ~_1376;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    float _1404 = sqrt(_1392);
    int _1406 = _1402;
    float _1408 = _1352;
    float _1410 = _1374;
    float _1412 = _1380;
    float _1414 = _1310;
    if (!_1356)
    {
        int _1416 = ~_1376;
        int _1418 = _1416 + 1;
        _1406 = _1418;
    }
    int _1420 = _1406;
    int _1422 = _301 * _1386;
    int _1424 = _1422 + _820;
    bool _1426 = !_1320;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1396);
    int _1432 = _1394 ? 0 : 1;
    int _1434 = abs(_1420);
    float _1436 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    int _1438 = abs(_1428);
    int _1440 = ~_1432;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1448 = _1444;
    if (_1390)
    {
        int _1450 = ~_1432;
        int _1452 = _1450 + 1;
        _1448 = _1452;
    }
    int _1454 = _1448;
    int _1456 = ~_1434;
    int _1458 = _1456 + 1;
    int _1460 = _1458 + 1;
    float _1462 = _786 + _1446;
    bool _1464 = _1318 != 3;
    int _1466 = _1460 * as_type<int>(_1302);
    int _1468 = ~_1438;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    bool _1474 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1476 = abs(_1454);
    int _1478 = _1472 * as_type<int>(_1294);
    int _1480 = _1478 + _1466;
    bool _1482 = !_1464;
    int _1484 = _1482 ? 0 : (-1);
    bool _1486 = !_592;
    int _1488 = _1486 ? 0 : 1;
    int _1490 = ~_1476;
    int _1492 = _1490 + 1;
    int _1494 = _1492 + 1;
    int _1496 = abs(_1484);
    int _1498 = abs(_1488);
    int _1500 = _1494 * as_type<int>(_1340);
    int _1502 = _1500 + _1480;
    float _1504 = as_type<float>(_1496);
    float _1506 = as_type<float>(_1498);
    if (!_1474)
    {
        _1504 = _1352;
    }
    float _1508 = _1504;
    float _1510 = _1508;
    if (!_1474)
    {
        _1506 = _1358;
    }
    float _1512 = _1506;
    int _1514 = ~_1496;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    float _1520 = _1512;
    if (!_1474)
    {
        _1408 = _1462;
    }
    float _1522 = _1408;
    bool _1524 = !_1474;
    float _1526 = _1522;
    if (!_1524)
    {
        float _1528 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1532 = _1404 + _1530;
        float _1534 = rsqrt(_1392);
        float _1536 = _1532 * _1528;
        float _1538 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = _1536 * 0.15915493667125701904296875;
        float _1542 = _1540 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = _1540 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        float _1550 = fma(_1544, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1534 * _1550;
        float _1554 = fma(_1362, _1552, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = _1548 + (-1.0);
        float _1558 = fma(_1372, _1552, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1562 = _1554 + _1560;
        float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1568 = _1558 + _1566;
        float _1570 = _1562 * _1562;
        float _1572 = fma(_1462, _1548, _1564);
        float _1574 = _1568 * _1568;
        _1526 = _1572;
        _1410 = _1570;
        _1412 = _1574;
        _1510 = _1554;
        _1520 = _1558;
    }
    float _1576 = _1526;
    float _1578 = _1410;
    float _1580 = _1412;
    float _1582 = _1510;
    float _1584 = _1520;
    int _1586 = ~_1498;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    int _1592 = _1518 * as_type<int>(_1348);
    int _1594 = _1592 + _1502;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1598 = _1576 + _1596;
    bool _1600 = !_800;
    int _1602 = _1600 ? _1424 : (-1);
    float _1604 = -_732;
    float _1606 = _1604 + 1.0;
    int _1608 = _1594 * _1590;
    float _1610 = fma(_1598, _1598, _1578);
    float _1612 = -_738;
    float _1614 = _1612 + 1.0;
    float _1616 = fma(_1354, _1310, _1282);
    int _1618 = _1602 * _1498;
    int _1620 = _1618 + _1608;
    float _1622 = _1610 + _1580;
    float _1624 = _1312 + _1388;
    float _1626 = _1322 + _1378;
    float _1628 = -_1606;
    float _1630 = fma(_1088, _1628, _1106);
    float _1632 = fma(_1098, _1614, _1128);
    float _1634 = sqrt(_1622);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1648 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1652 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1658 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = float(_1620);
    float _1666 = _1368 + _1616;
    out.m_76.x = _1630;
    out.m_76.y = _1632;
    bool _1668 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1670 = isnan(_1634);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1676 = _1672 || _1674;
    out.m_78.x = _1656;
    out.m_78.y = _1658;
    out.m_78.z = _1660;
    out.m_78.w = _1650;
    out.m_80.x = _1652;
    out.m_80.y = _1654;
    out.m_80.z = _1662;
    out.m_80.w = _1648;
    out.m_82.x = _1664;
    int _1678 = as_type<int>(_1584);
    if (!_1676)
    {
        _1414 = 1.0;
    }
    float _1680 = _1414;
    out.m_84.x = _1624;
    out.m_84.y = _1626;
    out.m_84.z = _1666;
    bool _1682 = !_1676;
    float _1684 = _1680;
    if (!_1682)
    {
        bool _1686 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1688 = isnan(_1634);
        bool _1690 = _1686 || _1688;
        bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1694 = _1690 || _1692;
        if (!_1694)
        {
            float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1698 = _1634 + _1696;
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1706 = _1704 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1708 = 1.0 / _1702;
            float _1710 = _1698 * _1708;
            float _1712 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1684 = _1712;
            _1714 = true;
        }
        else
        {
            bool _1716 = _1634 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1718 = isnan(_1634);
            bool _1720 = _1716 || _1718;
            bool _1722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1724 = _1720 || _1722;
            if (!_1724)
            {
                float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1728 = _1634 + _1726;
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1738 = 1.0 / _1732;
                float _1740 = _1728 * _1738;
                float _1742 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1684 = _1742;
                _1714 = true;
            }
            else
            {
                _1684 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1714 = false;
    float _1744 = _1684;
    float _1746 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1748 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1750 = floor(_1746);
    float _1752 = floor(_1748);
    float _1754 = -_1750;
    float _1756 = _1746 + _1754;
    float _1758 = -_1752;
    float _1760 = _1748 + _1758;
    float2 _5902 = float2(_1756, _1760);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).x;
    float _1764 = _786 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1768 = _1582 + _1766;
    float _1770 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1764);
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1576 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1778 = _1584 + _1776;
    float _1780 = fma(_1768, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1782 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1770);
    float _1784 = _786 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1790 = 1.0 / _1786;
    float _1792 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1788);
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1796 = _1794 + _1786;
    float _1798 = _1796 * _1790;
    float _1800 = _1798 * 0.5;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1804 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1802);
    float _1806 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1808 = _786 + _1806;
    float _1810 = 1.0 / _1804;
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1816 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1812);
    float _1818 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1814);
    float _1820 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1816);
    float _1822 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1818);
    float _1824 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1828 = _1810 * _1826;
    float _1830 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1832 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1834 = trunc(_1824);
    int _1836 = int(_1834);
    bool _1838 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1840 = !_1832;
    int _1842 = _1840 ? 0 : 1;
    float _1844 = trunc(_1830);
    int _1846 = int(_1844);
    int _1848 = 2;
    int _1850 = as_type<int>(_1778);
    float _1852 = _1774;
    if (!_1832)
    {
        _1848 = 1;
    }
    int _1854 = _1848;
    int _1856 = _1854;
    if (!_1838)
    {
        _1856 = _1842;
    }
    int _1858 = _1856;
    int _1860 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1862 = _1836 + _1860;
    int _1864 = _1862 + 1;
    int _1866 = _1858 << 6;
    bool _1868 = _1864 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1870 = _1866 + 48;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    int _1888 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1890 = _1846 + _1888;
    int _1892 = _1890 + 1;
    int _1894 = _1864 | _1892;
    int _1896 = _1866 + 56;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
    int _1902 = int(_1898) & 3;
    float _1904 = (*spvDescriptorSet0.vp_c15)._m0[int(_1900)][_1902];
    int _1906 = int(_1898) + 1;
    uint _1908 = uint(int(uint(_1906) >> uint(2)));
    int _1910 = _1906 & 3;
    float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
    bool _1914 = _1894 < 0;
    bool _1916 = _1914 || _1868;
    bool _1918 = _1892 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1920 = _1918 || _1916;
    int _1922 = _1866 + 64;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[int(_1934)][_1936];
    bool _1940 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.5);
    bool _1948 = _1944 || _1946;
    float _1950 = fma(_1774, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1952 = fma(_1778, _1744, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1954 = _1866 + 72;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    float _1972 = as_type<float>(_1864);
    float _1974 = _1952;
    int _1976 = as_type<int>(_1950);
    if (!_1920)
    {
        int _1978 = _1892 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1980 = _1978 + _1864;
        _1850 = _1980;
    }
    int _1982 = _1850;
    float _1984 = as_type<float>(_1982);
    if (_1948)
    {
        _1972 = _1780;
    }
    float _1986 = _1972;
    int _1988 = _1866 + 96;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c15)._m0[int(_1992)][_1994];
    int _1998 = int(_1990) + 1;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    int _2002 = _1998 & 3;
    float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
    float _2006 = _1986;
    if (_1948)
    {
        _1852 = _1950;
    }
    float _2008 = _1852;
    int _2010 = _1866 + 104;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
    float _2028 = _2008;
    int _2030 = as_type<int>(_1996);
    if (!_1948)
    {
        float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2034 = _786 + _2032;
        float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2038 = _764 + _2036;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2042 = _2034 * _2034;
        float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2046 = _782 + _2044;
        float _2048 = fma(_2038, _2038, _2042);
        float _2050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2052 = fma(_2046, _2046, _2048);
        float _2054 = sqrt(_2052);
        float _2056 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2058 = precise::min(_2054, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2050;
        float _2062 = -_786;
        float _2064 = _2062 + _1950;
        float _2066 = -_764;
        float _2068 = _2066 + _1780;
        float _2070 = -_782;
        float _2072 = _2070 + _1952;
        float _2074 = _2056 * _2060;
        float _2076 = fma(_2064, _2074, _786);
        float _2078 = fma(_2068, _2074, _764);
        float _2080 = fma(_2072, _2074, _782);
        _2028 = _2076;
        _2006 = _2078;
        _1974 = _2080;
        _1976 = as_type<int>(_2074);
        _1678 = as_type<int>(_2064);
    }
    float _2082 = _2028;
    float _2084 = _2006;
    float _2086 = _1974;
    int _2088 = _1976;
    int _2090 = _1678;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2094 = _1808 * _2004;
    int _2096 = _2088;
    int _2098 = _2090;
    if (!_1920)
    {
        int _2100 = _1982 << 2;
        _2096 = _2100;
    }
    int _2102 = _2096;
    float _2104 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2092);
    float _2108 = fma(_764, _1996, _2094);
    if (!_1920)
    {
        uint _2110 = uint(int(uint(_1982) >> uint(2)));
        _2098 = int(_2110);
    }
    int _2112 = _2098;
    float _2114 = _1808 * _1938;
    float _2116 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2106);
    if (!_1920)
    {
        int _2118 = 12 & _2102;
        _2030 = _2118;
    }
    int _2120 = _2030;
    float _2122 = fma(_782, _2018, _2108);
    float _2124 = fma(_764, _1930, _2114);
    float _2126 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = as_type<float>(_2120);
    if (!_1920)
    {
        int _2130 = _2112 << 4;
        int _2132 = _2130 + _2120;
        _2128 = as_type<float>(_2132);
    }
    float _2134 = _2128;
    float _2136 = _2122 + _2026;
    int _2138 = _1866 + 80;
    uint _2140 = uint(int(uint(_2138) >> uint(2)));
    uint _2142 = uint(int(uint(int(_2140)) >> uint(2)));
    int _2144 = int(_2140) & 3;
    float _2146 = (*spvDescriptorSet0.vp_c15)._m0[int(_2142)][_2144];
    int _2148 = int(_2140) + 1;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    int _2152 = _2148 & 3;
    float _2154 = (*spvDescriptorSet0.vp_c15)._m0[int(_2150)][_2152];
    float _2156 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2158 = _1808 * _1886;
    float _2160 = fma(_782, _1962, _2124);
    float _2162 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = 1.0 / _2136;
    float _2166 = -_2156;
    float _2168 = fma(_2166, _2104, 1.0);
    float _2170 = fma(_764, _1878, _2158);
    float _2172 = _2134;
    float _2174 = _2168;
    if (!_1920)
    {
        int _2176 = as_type<int>(_2134) + 400;
        uint _2178 = uint(int(uint(_2176) >> uint(2)));
        uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
        int _2182 = int(_2178) & 3;
        float _2184 = (*spvDescriptorSet0.vp_c15)._m0[int(_2180)][_2182];
        _2172 = _2184;
    }
    float _2186 = _2172;
    float _2188 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2190 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2192 = fma(_782, _1904, _2170);
    float _2194 = _2160 + _1970;
    float _2196 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2188);
    float _2198 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2190);
    float _2200 = _2192 + _1912;
    int _2202 = _1866 + 88;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[int(_2214)][_2216];
    float _2220 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2196);
    float _2222 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2198);
    float _2224 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2226 = log2(_2168);
    float _2228 = _2200 * _2164;
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2232 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2234 = _2194 * _2164;
    float _2236 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2224);
    bool _2238 = _2228 >= 0.0;
    float _2240 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2244 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2246 = _2228 <= 1.0;
    bool _2248 = _2246 && _2238;
    float _2250 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2240);
    float _2252 = _2200;
    float _2254 = _2164;
    if (!_1920)
    {
        float _2256 = floor(_1824);
        _2252 = _2256;
    }
    float _2258 = _2252;
    bool _2260 = _2234 >= 0.0;
    bool _2262 = _2260 && _2248;
    float _2264 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2250);
    float _2266 = _2226 * 0.693147182464599609375;
    bool _2268 = _2234 <= 1.0;
    bool _2270 = _2268 && _2262;
    float _2272 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2264);
    float _2274 = _2194;
    float _2276 = _2264;
    if (!_1920)
    {
        float _2278 = floor(_1830);
        _2274 = _2278;
    }
    float _2280 = _2274;
    float _2282 = _1808 * _2154;
    float _2284 = 1.0 / _2272;
    float _2286 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_2270)
    {
        float _2288 = float(_1858);
        _2276 = _2288;
    }
    float _2290 = _2276;
    float _2292 = fma(_764, _2146, _2282);
    float _2294 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2242);
    float _2296 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2286);
    float _2298 = _2290;
    if (!_1920)
    {
        float _2300 = -_2258;
        float _2302 = _1824 + _2300;
        _2174 = _2302;
    }
    float _2304 = _2174;
    float _2306 = _2280;
    if (!_1920)
    {
        float _2308 = -_2280;
        float _2310 = _1830 + _2308;
        _2306 = _2310;
    }
    float _2312 = _2306;
    float _2314 = _2186;
    if (!_1920)
    {
        float _2316 = rint(_2186);
        float _2318 = precise::max(_2316, 0.0);
        uint _2320 = uint(_2318);
        uint _2322 = clamp(_2320, 0u, 65535u);
        _2314 = as_type<float>(_2322);
    }
    float _2324 = _2314;
    float _2326 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2296);
    float _2328 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2294);
    float _2330 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2326);
    float _2332 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2328);
    float _2334 = fma(_782, _2210, _2292);
    float _2336 = _2292;
    float _2338 = _2330;
    if (_2270)
    {
        float _2340 = rint(_2290);
        float _2342 = precise::max(_2340, 0.0);
        uint _2344 = uint(_2342);
        uint _2346 = clamp(_2344, 0u, 65535u);
        _2336 = as_type<float>(_2346);
    }
    float _2348 = _2336;
    float _2350 = _2332 * _2284;
    float _2352 = _2334 + _2218;
    float _2354 = _2330 * _2284;
    float _2356 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2358 = fma(_2350, -0.5, 0.5);
    float _2360 = _2352 * _2164;
    float _2362 = fma(_2354, 0.5, 0.5);
    float _2364 = _2324;
    if (!_1920)
    {
        float3 _6930 = float3(_2304, _2312, float(as_type<int>(_2324)));
        float3 _6934 = select(_6930, float3(0.0), isnan(_6930));
        float _2366 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6934.xy, uint(rint(_6934.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6934.xy, uint(rint(_6934.z)), level(0.0)).x;
        _2364 = _2366;
    }
    float _2368 = _2364;
    float _2370 = _2234;
    if (_2270)
    {
        float3 _6949 = float3(_2228, _2234, float(as_type<int>(_2348)));
        float3 _6951 = select(_6949, float3(0.0), isnan(_6949));
        float _2372 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6951.xy, uint(rint(_6951.z)), _2360, level(0.0));
        _2370 = _2372;
    }
    float _2374 = _2370;
    float3 _6961 = float3(_2362, _2358, _2356);
    float _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6961, float3(0.0), isnan(_6961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6961, float3(0.0), isnan(_6961)), level(0.0)).x;
    float3 _6970 = float3(_2362, _2358, _2356);
    float4 _2379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6970, float3(0.0), isnan(_6970)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6970, float3(0.0), isnan(_6970)), level(0.0)).xyzw;
    float _2381 = _2379.x;
    float _2383 = _2379.y;
    float _2385 = _2379.z;
    float _2387 = _2379.w;
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1920)
    {
        _2254 = 1.0;
    }
    float _2391 = _2254;
    bool _2393 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.5);
    bool _2401 = _2397 || _2399;
    float _2403 = _2391;
    if (_2401)
    {
        _2389 = 1.0;
    }
    float _2405 = _2389;
    float _2407 = _2405;
    if (_2401)
    {
        _2298 = 1.0;
    }
    float _2409 = _2298;
    float _2411 = _2409;
    if (!_2401)
    {
        float _2413 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2417 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2415;
        float _2419 = _2413 * 0.15915493667125701904296875;
        float _2421 = _2419 * 6.283185482025146484375;
        float _2423 = cos(_2421);
        float _2425 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2427 = _2425 * 0.15915493667125701904296875;
        float _2429 = _2419 * 6.283185482025146484375;
        float _2431 = sin(_2429);
        float _2433 = 1.0 / _2423;
        float _2435 = _2427 * 6.283185482025146484375;
        float _2437 = cos(_2435);
        float _2439 = _2431 * _2433;
        float _2441 = _2427 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        float _2445 = _2437 * _2439;
        float _2447 = 1.0 / _2417;
        float _2449 = 1.0 / _2445;
        float _2451 = _2443 * _2449;
        float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2455 = fma(_1828, _2451, _2453);
        float _2457 = _2455 * _2447;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        _2411 = _2459;
    }
    float _2461 = _2411;
    if (!_2401)
    {
        float _2463 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2465 = _2463 * 0.15915493667125701904296875;
        float _2467 = _2465 * 6.283185482025146484375;
        float _2469 = cos(_2467);
        float _2471 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2465 * 6.283185482025146484375;
        float _2477 = sin(_2475);
        float _2479 = 1.0 / _2469;
        float _2481 = _2473 * 6.283185482025146484375;
        float _2483 = cos(_2481);
        float _2485 = _2477 * _2479;
        float _2487 = _2473 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = _2483 * _2485;
        float _2493 = 1.0 / _2491;
        float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2497 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2495;
        float _2499 = 1.0 / _2497;
        float _2501 = _2489 * _2493;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2505 = fma(_1828, _2501, _2503);
        float _2507 = _2505 * _2499;
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -_2509;
        float _2513 = _2511 + 1.0;
        _2407 = _2513;
    }
    float _2515 = _2407;
    if (!_1920)
    {
        int _2517 = _1982 << 4;
        int _2519 = _2517 + 2048;
        uint _2521 = uint(int(uint(_2519) >> uint(2)));
        uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
        int _2525 = int(_2521) & 3;
        float _2527 = (*spvDescriptorSet0.vp_c15)._m0[int(_2523)][_2525];
        int _2529 = int(_2521) + 1;
        uint _2531 = uint(int(uint(_2529) >> uint(2)));
        int _2533 = _2529 & 3;
        float _2535 = (*spvDescriptorSet0.vp_c15)._m0[int(_2531)][_2533];
        int _2537 = _2519 + 8;
        uint _2539 = uint(int(uint(_2537) >> uint(2)));
        uint _2541 = uint(int(uint(int(_2539)) >> uint(2)));
        int _2543 = int(_2539) & 3;
        float _2545 = (*spvDescriptorSet0.vp_c15)._m0[int(_2541)][_2543];
        int _2547 = int(_2539) + 1;
        uint _2549 = uint(int(uint(_2547) >> uint(2)));
        int _2551 = _2547 & 3;
        float _2553 = (*spvDescriptorSet0.vp_c15)._m0[int(_2549)][_2551];
        float _2555 = _1808 * _2535;
        float _2557 = fma(_764, _2527, _2555);
        float _2559 = fma(_782, _2545, _2557);
        float _2561 = _2559 + _2553;
        float _2563 = precise::clamp(_2561, 0.0, 1.0);
        float _2565 = -_2563;
        float _2567 = _2565 + _2368;
        float _2569 = fma(_2567, 500.0, 1.5);
        float _2571 = exp2(_2569);
        float _2573 = 0.0 + _2571;
        float _2575 = precise::clamp(_2573, 0.0, 1.0);
        _1984 = as_type<float>(_2519);
        _2403 = _2575;
    }
    float _2577 = _1984;
    float _2579 = _2403;
    float _2581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2583 = _2082 + _2581;
    float _2585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2587 = _2084 + _2585;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2591 = _2086 + _2589;
    float _2593 = _2583 * _2583;
    float _2595 = fma(_2587, _2587, _2593);
    float _2597 = fma(_2591, _2591, _2595);
    float _2599 = rsqrt(_2597);
    float _2601 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2603 = _2587 * _2601;
    float _2605 = _2591 * _2601;
    float _2607 = _2603 * _2603;
    float _2609 = _2605 * _2605;
    float _2611 = _2607 + _2609;
    float _2613 = sqrt(_2611);
    bool _2615 = _2613 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2619 = _2613 + _2617;
    float _2621 = _2591;
    float _2623 = _2593;
    float _2625 = _2619;
    float _2627 = _2577;
    float _2629 = _2601;
    if (_2615)
    {
        float _2631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2621 = _2631;
    }
    float _2633 = _2621;
    if (_2615)
    {
        float _2635 = rsqrt(_2611);
        _2623 = _2635;
    }
    float _2637 = _2623;
    float _2639 = _2637;
    if (_2615)
    {
        float _2641 = _2619 * _2633;
        _2625 = _2641;
    }
    float _2643 = _2625;
    if (_2615)
    {
        float _2645 = _2643 * 0.15915493667125701904296875;
        _2627 = _2645;
    }
    float _2647 = _2627;
    float _2649 = _2599;
    if (_2615)
    {
        float _2651 = _2647 * 6.283185482025146484375;
        float _2653 = sin(_2651);
        _2649 = _2653;
    }
    float _2655 = _2649;
    float _2657 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2659 = precise::max(0.0, _2657);
    float _2661 = _2368;
    float _2663 = _2659;
    float _2665 = _2655;
    float _2667 = _2657;
    if (_2615)
    {
        float _2669 = _2647 * 6.283185482025146484375;
        float _2671 = cos(_2669);
        _2661 = _2671;
    }
    float _2673 = _2661;
    float _2675 = -_2601;
    float _2677 = -_2659;
    float _2679 = fma(_2583, _2675, _2677);
    float _2681 = _2679;
    if (_2615)
    {
        float _2683 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2663 = _2683;
    }
    float _2685 = _2663;
    float _2687 = _2685;
    if (_2615)
    {
        float _2689 = fma(_2655, _2685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2689;
    }
    float _2691 = _2665;
    float _2693 = _2691;
    if (!_2615)
    {
        _2687 = _2605;
    }
    float _2695 = _2687;
    float _2697 = _2695;
    float _2699 = _2673;
    if (_2615)
    {
        float _2701 = _2673 + (-1.0);
        _2667 = _2701;
    }
    float _2703 = _2667;
    float _2705 = _2703;
    if (_2615)
    {
        float _2707 = _2637 * _2691;
        _2629 = _2707;
    }
    float _2709 = _2629;
    if (!_2615)
    {
        _2693 = _2603;
    }
    float _2711 = _2693;
    float _2713 = _2711;
    if (_2615)
    {
        float _2715 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2705 = _2715;
    }
    float _2717 = _2705;
    if (_2615)
    {
        float _2719 = _2603 * _2709;
        _2713 = _2719;
    }
    float _2721 = _2713;
    if (!_2615)
    {
        _2639 = _2607;
    }
    float _2723 = _2639;
    float _2725 = _2723;
    if (_2615)
    {
        float _2727 = _2605 * _2709;
        _2697 = _2727;
    }
    float _2729 = _2697;
    if (_2615)
    {
        float _2731 = fma(_2679, _2673, _2717);
        _2681 = _2731;
    }
    float _2733 = _2681;
    if (_2615)
    {
        float _2735 = _2721 * _2721;
        _2725 = _2735;
    }
    float _2737 = _2725;
    if (!_2615)
    {
        _2699 = _2609;
    }
    float _2739 = _2699;
    float _2741 = _2739;
    if (_2615)
    {
        float _2743 = _2729 * _2729;
        _2741 = _2743;
    }
    float _2745 = _2741;
    float _2747 = sqrt(_2597);
    float _2749 = fma(_2733, _2733, _2737);
    float _2751 = _2749 + _2745;
    float _2753 = rsqrt(_2751);
    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2757 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2755);
    float _2759 = precise::clamp(_2757, 0.0, 1.0);
    float _2761 = -_2759;
    float _2763 = _2761 + 1.0;
    float _2765 = _2753 * _2721;
    float _2767 = _2753 * _2733;
    float _2769 = _2753 * _2729;
    float _2771 = abs(_2763);
    float _2773 = log2(_2771);
    float _2775 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2777 = -_2775;
    float _2779 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2777);
    float _2781 = -_2769;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2779);
    float _2785 = fma(_2783, -0.5, 0.5);
    float _2787 = fma(_2783, 0.5, 0.5);
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2791 = fma(_2787, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2793 = sqrt(_2785);
    float _2795 = fma(_2787, _2791, -0.212114393711090087890625);
    float _2797 = _2767 + 1.0;
    float _2799 = fma(_2787, _2795, 1.570728778839111328125);
    float _2801 = exp2(_2789);
    float _2803 = _2793 * 0.636619746685028076171875;
    float _2805 = -_2767;
    float _2807 = fma(_2801, _2797, _2805);
    float _2809 = -_2799;
    float _2811 = fma(_2803, _2809, 1.0);
    float _2813 = fma(_2807, 0.5, 0.5);
    float2 _7609 = float2(_2811, _2813);
    float3 _2817 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7609, float2(0.0), isnan(_7609)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7609, float2(0.0), isnan(_7609)), level(0.0)).xyz;
    float _2819 = _2817.x;
    float _2821 = _2817.y;
    float _2823 = _2817.z;
    float _2825 = abs(_1828);
    float _2827 = log2(_2825);
    float _2829 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2831 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2833 = -_1762;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2829);
    float _2839 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2837);
    float _2841 = exp2(_2831);
    bool _2843 = _1828 <= 8000.0;
    bool _2845 = isnan(_1828);
    bool _2847 = _2843 || _2845;
    bool _2849 = isnan(8000.0);
    bool _2851 = _2847 || _2849;
    float _2853 = float(_2851);
    float _2855 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2839);
    float _2857 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2859 = _2855 + _2272;
    out.gl_Position.x = _2330;
    out.gl_Position.y = _2332;
    out.gl_Position.z = _2855;
    out.gl_Position.w = _2272;
    float _2861 = _2859 * 0.5;
    float _2863 = exp2(_2857);
    out.m_86.z = _2861;
    out.m_86.w = _2272;
    float _2865 = -_2841;
    float _2867 = _2865 + 1.0;
    float _2869 = _2867;
    if (!_2270)
    {
        _2338 = 1.0;
    }
    float _2871 = _2338;
    float _2873 = _2871;
    if (_2270)
    {
        bool _2875 = _2374 >= _2360;
        bool _2877 = isnan(_2374);
        bool _2879 = _2875 || _2877;
        bool _2881 = isnan(_2360);
        bool _2883 = _2879 || _2881;
        float _2885 = float(_2883);
        _2873 = _2885;
    }
    float _2887 = _2873;
    float _2889 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2891 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2893 = isnan(_2747);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2899 = _2895 || _2897;
    float _2901 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = _2887 * _2579;
    float _2907 = _2889 * _2376;
    float _2909 = fma(_2903, -2.0, 3.0);
    float _2911 = _2903 * _2903;
    float _2913 = _2911 * _2909;
    float _2915 = _2889;
    if (!_2899)
    {
        _2869 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2917 = _2869;
    float _2919 = -_2913;
    float _2921 = _2919 + 1.0;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2913);
    float _2925 = _2853 * _2923;
    float _2927 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2929 = _2925;
    float _2931 = _2917;
    float _2933 = _2917;
    if (!_2899)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2935 = _2929;
    float _2937 = _2835 * _2927;
    float _2939 = precise::clamp(_2937, 0.0, 1.0);
    float _2941 = _2387 * _2907;
    float _2943 = -_2939;
    float _2945 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2947 = -_2905;
    float _2949 = fma(_2947, _2945, 1.0);
    float _2951 = precise::clamp(_2949, 0.0, 1.0);
    float _2953 = -_2889;
    float _2955 = _2953 + 1.0;
    float _2957 = _2941;
    float _2959 = _2955;
    float _2961 = _2935;
    float _2963 = _2935;
    if (!_2899)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2965 = _2915;
    float _2967 = _2951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2969 = _2461 * _2515;
    out.m_88.x = _2967;
    float _2971 = _2969 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2973 = _2969;
    float _2975 = _2965;
    float _2977 = _2965;
    if (!_2899)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2979 = _2973;
    float _2981 = _2823 * _2907;
    float _2983 = fma(_2819, _2941, _2381);
    float _2985 = fma(_2821, _2941, _2383);
    float _2987 = _2387 * _2955;
    float _2989 = fma(_2387, _2981, _2385);
    float _2991 = _2979;
    float _2993 = _2979;
    if (!_2899)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2995 = _2957;
    float _2997 = _2995;
    float _2999 = _2995;
    if (!_2899)
    {
        _2959 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3001 = _2959;
    out.m_90.x = _2983;
    out.m_90.y = _2985;
    out.m_90.z = _2989;
    out.m_90.w = _2987;
    bool _3003 = !_2899;
    float _3005 = _3001;
    float _3007 = _3001;
    if (!_3003)
    {
        bool _3009 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3011 = isnan(_2747);
        bool _3013 = _3009 || _3011;
        bool _3015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3017 = _3013 || _3015;
        if (!_3017)
        {
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3021 = _2747 + _3019;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3025 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3023;
            float _3027 = 1.0 / _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3049 = _3021 * _3027;
            float _3051 = precise::clamp(_3049, 0.0, 1.0);
            float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3057 = fma(_3051, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3059 = fma(_3051, _3055, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3061 = fma(_3051, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3063 = fma(_3051, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3065 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3067 = fma(_3051, _3047, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2977 = _3059;
            _3007 = _3065;
            _2963 = _3057;
            _2999 = _3063;
            _2933 = _3061;
            _2993 = _3067;
            _3069 = true;
        }
        else
        {
            bool _3071 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3073 = isnan(_2747);
            bool _3075 = _3071 || _3073;
            bool _3077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3079 = _3075 || _3077;
            if (!_3079)
            {
                _2961 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3081 = _2961;
            _2963 = _3081;
            if (!_3079)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3083 = _2975;
            _2977 = _3083;
            if (!_3079)
            {
                _2931 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3085 = _2931;
            _2933 = _3085;
            if (!_3079)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3087 = _2997;
            _2999 = _3087;
            if (!_3079)
            {
                _3005 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3089 = _3005;
            _3007 = _3089;
            if (!_3079)
            {
                _2991 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3091 = _2991;
            bool _3093 = !_3079;
            _2993 = _3091;
            if (!_3093)
            {
                bool _3095 = _2747 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3097 = isnan(_2747);
                bool _3099 = _3095 || _3097;
                bool _3101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3103 = _3099 || _3101;
                if (!_3103)
                {
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3107 = _2747 + _3105;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3111 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3109;
                    float _3113 = 1.0 / _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3135 = _3107 * _3113;
                    float _3137 = precise::clamp(_3135, 0.0, 1.0);
                    float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3143 = fma(_3137, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3145 = fma(_3137, _3141, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3147 = fma(_3137, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3149 = fma(_3137, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3151 = fma(_3137, _3129, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3153 = fma(_3137, _3133, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2977 = _3145;
                    _3007 = _3151;
                    _2963 = _3143;
                    _2999 = _3149;
                    _2933 = _3147;
                    _2993 = _3153;
                    _3069 = true;
                }
                else
                {
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3007 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2963 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2933 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2993 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3069 = false;
    float _3155 = _2977;
    float _3157 = _3007;
    float _3159 = _2963;
    float _3161 = _2999;
    float _3163 = _2933;
    float _3165 = _2993;
    float _3167 = fma(_1626, -0.5, 0.5);
    float _3169 = precise::clamp(_3167, 0.0, 1.0);
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    float _3175 = _2971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3177 = -_3159;
    float _3179 = _3177 + _3161;
    float _3181 = fma(_3169, _3173, _3155);
    out.m_92.x = 0.0;
    float _3183 = -_3163;
    float _3185 = _3183 + _3165;
    float _3187 = fma(_3169, _3179, _3159);
    float _3189 = _3181 * 0.586610972881317138671875;
    out.m_65.x = _3175;
    bool _3191 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3193 = fma(_3169, _3185, _3163);
    float _3195 = fma(_3187, 0.298911988735198974609375, _3189);
    bool _3197 = _2461 > 0.0;
    bool _3199 = isnan(_2461);
    bool _3201 = _3197 || _3199;
    bool _3203 = isnan(0.0);
    bool _3205 = _3201 || _3203;
    float _3207 = fma(_3193, 0.114477999508380889892578125, _3195);
    bool _3209 = _2515 <= 0.0;
    bool _3211 = !_3205;
    bool _3213 = _3209 || _3211;
    float _3215 = -_3207;
    float _3217 = _3187 + _3215;
    float _3219 = -_3207;
    float _3221 = _3181 + _3219;
    float _3223 = -_3207;
    float _3225 = _3193 + _3223;
    float _3227 = fma(_3217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    float _3231 = fma(_3225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3207);
    bool _3233 = !_3191;
    if (!_3233)
    {
        float _3235 = -_2082;
        float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3239 = -_2084;
        float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3243 = -_2086;
        float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3247 = _3237 * _3237;
        float _3249 = fma(_3241, _3241, _3247);
        float _3251 = fma(_3245, _3245, _3249);
        float _3253 = sqrt(_3251);
        float _3255 = rsqrt(_3251);
        float _3257 = -_3253;
        float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3261 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3263 = precise::clamp(_3261, 0.0, 1.0);
        float _3265 = _3241 * _3255;
        float _3267 = _3237 * _3255;
        float _3269 = abs(_3263);
        float _3271 = log2(_3269);
        float _3273 = _3245 * _3255;
        float _3275 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3277 = _1626 * _3267;
        float _3279 = -_3267;
        float _3281 = -_3275;
        float _3283 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3281);
        float _3285 = fma(_1624, _3265, _3277);
        float _3287 = -_3273;
        float _3289 = fma(_3287, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3283);
        float _3291 = fma(_1666, _3273, _3285);
        float _3293 = precise::clamp(_3291, 0.0, 1.0);
        float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3297 = _3289 + _3295;
        float _3299 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = exp2(_3299);
        float _3307 = _3305 * _3303;
        float _3309 = _3293 * _3307;
        float _3311 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3313 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3315 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3311;
        out.m_92.y = _3313;
        out.m_92.z = _3315;
    }
    out.m_94.x = _3227;
    out.m_94.y = _3229;
    out.m_94.z = _3231;
    if (!_3213)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_65.x = 0.0;
    float _3317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3317;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

