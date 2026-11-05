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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_2A [[id(7)]];
    sampler vp_t_tcb_2ASmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_14 [[id(11)]];
    sampler vp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_16 [[id(13)]];
    sampler vp_t_tcb_16Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_2ASmplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_88 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_100 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_98 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_76 [[attribute(2)]];
    float4 m_78 [[attribute(3)]];
    float4 m_84 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_82 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3303 = false;
    bool _3085 = false;
    bool _1365 = false;
    bool _1353 = false;
    bool _535 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3608 = as_type<float>(_135);
        out.gl_Position.z = _3608;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3678 = as_type<float>(_173);
        out.gl_Position.z = _3678;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = in.m_67.x;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_72.x;
    float _185 = in.m_72.y;
    float _187 = in.m_72.z;
    float _189 = in.m_74.x;
    float _191 = in.m_74.y;
    float _193 = in.m_74.z;
    float _195 = in.m_76.x;
    float _197 = in.m_76.y;
    float _199 = in.m_76.z;
    float _201 = _179 * _177;
    float _203 = in.m_78.x;
    float _205 = in.m_78.y;
    float _207 = in.m_78.z;
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _201);
    int _211 = as_type<int>(_181) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_181) & 2;
    bool _217 = _215 != 0;
    float _219 = _209 * 6.283185482025146484375;
    float _221 = floor(_209);
    int _223 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _225 = _223 != 0;
    float _227 = _219 * 0.15915493667125701904296875;
    bool _229 = !_217;
    int _231 = _229 ? (-1090519040) : 1056964608;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = _185 * _191;
    bool _243 = !_213;
    int _245 = _243 ? (-1090519040) : 1056964608;
    float _247 = _227 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_225;
    int _253 = _251 ? 0 : 1;
    float _255 = _185 * _197;
    bool _257 = !_235;
    int _259 = _257 ? 0 : 1;
    out.m_80.x = as_type<float>(_245);
    out.m_80.y = as_type<float>(_231);
    float _261 = _185 * _205;
    float _263 = fma(_183, _189, _241);
    int _265 = abs(_259);
    float _267 = -_221;
    float _269 = _209 + _267;
    int _271 = abs(_253);
    float _273 = fma(_183, _195, _255);
    float _275 = fma(_183, _203, _261);
    bool _277 = !_239;
    int _279 = _277 ? 0 : 1;
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_265);
    float _287 = fma(_249, 0.5, 0.5);
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_187, _199, _273);
    int _293 = abs(_279);
    float _295 = abs(_283);
    float _297 = _285 * _295;
    bool _299 = _269 < 0.5;
    float _301 = float(_299);
    float _303 = -_287;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = float(_271);
    float _309 = -_301;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_307, _305, _297);
    float _315 = float(_293);
    float _317 = fma(_187, _193, _263);
    float _319 = fma(_187, _207, _275);
    float _321 = abs(_311);
    float _323 = fma(_315, _321, _313);
    bool _325 = !_289;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_119);
        float _347 = 1.0 / _345;
        float _349 = _153 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _351 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _351 + _357;
    bool _361 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_351);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _351 + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _375;
    float _393 = 1.0 / _383;
    float _395 = 1.0 / _379;
    float _397 = _355 * _391;
    bool _399 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _401 = isnan(_351);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_371;
    float _413 = _411 + 1.0;
    bool _415 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_351);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _409 * _413;
    float _429 = _359 * _393;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = _387 * _395;
    bool _441 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_351);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = _425 * _433;
    float _459 = -_425;
    float _461 = _459 + 1.0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_455, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _451 * _461;
    float _475 = fma(_465, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_437, _439, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _439, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = -_451;
    float _483 = _481 + 1.0;
    float _485 = _471 * _473;
    float _487 = _475 * _473;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _501 = fma(_491, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _503 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = fma(_477, _457, _497);
    float _507 = fma(_479, _457, _499);
    float _509 = fma(_501, _427, _505);
    float _511 = fma(_503, _427, _507);
    float _513 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _509);
    float _515 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _511);
    bool _517 = !_389;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _521 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_119);
        float _539 = 1.0 / _537;
        float _541 = _153 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_60.x;
    float _547 = in.m_60.y;
    float _549 = in.m_60.z;
    float _551 = _175 * 2.0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _563 = _561 != 0;
    float _565 = in.m_67.y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = floor(_551);
    float _573 = in.m_67.z;
    bool _575 = !_559;
    int _577 = _575 ? 0 : 1;
    float _579 = in.m_82.x;
    float _581 = in.m_82.y;
    bool _583 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _591 = _587 || _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _597 = 1.0 / _569;
    float _599 = in.m_76.w;
    float _601 = in.m_74.w;
    bool _603 = _571 > 0.0;
    float _605 = _197 * _547;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _611 = _191 * _547;
    float _613 = _205 * _547;
    float _615 = fma(_195, _545, _605);
    float _617 = 1.0 / _609;
    float _619 = fma(_203, _545, _613);
    float _621 = fma(_189, _545, _611);
    float _623 = fma(_199, _549, _615);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _625;
    float _629 = fma(_207, _549, _619);
    float _631 = fma(_193, _549, _621);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _639 = log2(_637);
    float _641 = _627 * _597;
    float _643 = _175 + _565;
    float _645 = _573 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _647;
    float _651 = _643 + (-1.0);
    float _653 = _565 * 2.0;
    bool _655 = _571 >= 0.0;
    bool _657 = isnan(_571);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    float _665 = _649 * _617;
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _669 = floor(_653);
    float _671 = _565 + _573;
    float _673 = _513 * _579;
    float _675 = _175 + _573;
    float _677 = _671 + (-1.0);
    float _679 = in.m_78.w;
    float _681 = floor(_645);
    float _683 = _639 * _153;
    float _685 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _687 = _675 + (-1.0);
    bool _689 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _691 = isnan(_543);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = _623 + _599;
    float _703 = _565 + (-0.5);
    float _705 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _707 = 1.0 / _595;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _543 + _709;
    bool _713 = _669 >= 0.0;
    bool _715 = isnan(_669);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = _175 + (-0.5);
    float _725 = _573 + (-0.5);
    float _727 = _515 * _581;
    float _729 = _323 * _673;
    float _731 = exp2(_683);
    int _733 = _663 ? 0 : 1;
    float _735 = _323 * _727;
    bool _737 = _681 >= 0.0;
    bool _739 = isnan(_681);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = _729 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _749 = ~_733;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _757 = _753;
    int _759 = as_type<int>(_601);
    if (!_603)
    {
        int _761 = ~_733;
        int _763 = _761 + 1;
        _757 = _763;
    }
    int _765 = _757;
    float _767 = _635 * _707;
    bool _769 = _681 > 0.0;
    float _771 = fma(_641, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _773 = _629 + _679;
    bool _775 = _669 > 0.0;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _779 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _781 = isnan(_543);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _793 = 1.0 + _791;
    float _795 = -_731;
    float _797 = _795 + 1.0;
    bool _799 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _801 = isnan(_543);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    bool _811 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = isnan(_543);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_789;
    float _825 = _823 + 1.0;
    float _827 = 1.0 / _793;
    float _829 = _591 ? _797 : 0.0;
    float _831 = -_809;
    float _833 = _831 + 1.0;
    bool _835 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _837 = isnan(1.0);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _843 = _839 || _841;
    float _845 = _809 * _825;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _849 = _543 + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = _543 + _851;
    float _855 = _821 * _833;
    float _857 = -_821;
    float _859 = _857 + 1.0;
    float _861 = fma(_767, _849, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _863 = fma(_665, _853, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _865 = _745 ? 0 : 1;
    float _867 = _699 * _859;
    float _869 = _631 + _601;
    int _871 = abs(_577);
    float _873 = -_699;
    float _875 = _873 + 1.0;
    if (_843)
    {
        float _877 = _829 * _827;
        _155 = _877;
    }
    float _879 = _155;
    float _881 = _771 * _867;
    int _883 = _721 ? 0 : 1;
    float _885 = _869 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _887 = ~_865;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[115].x, _881);
    int _895 = _891;
    if (!_769)
    {
        int _897 = ~_865;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _701 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _905 = ~_883;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = fma(_861, _855, _893);
    float _913 = float(_871);
    float _915 = _773 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _917 = float(_765);
    float _919 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _921 = _909;
    if (!_775)
    {
        int _923 = ~_883;
        int _925 = _923 + 1;
        _921 = _925;
    }
    int _927 = _921;
    float _929 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _933 = _913 * _917;
    float _935 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _937 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].x, _929);
    float _939 = fma(_863, _845, _911);
    bool _941 = !_555;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].y, _935);
    float _947 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].x, _937);
    float _949 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].z, _919);
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _953 = in.m_84.x;
    float _955 = in.m_84.y;
    float _957 = in.m_84.z;
    float _959 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].y, _945);
    float _961 = _947 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _963 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].z, _949);
    bool _965 = !_563;
    int _967 = _965 ? 0 : 1;
    float _969 = _959 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _971 = _961 * _931;
    float _973 = _963 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _975 = abs(_967);
    float _977 = _969 * _777;
    int _979 = abs(_943);
    float _981 = fma(_971, 0.5, 0.5);
    float _983 = float(_975);
    float _985 = float(_927);
    float _987 = _973 * _951;
    float _989 = _933 * (-2.0);
    float _991 = float(_979);
    float _993 = fma(_977, 0.5, 0.5);
    float _995 = float(_901);
    float _997 = _983 * _985;
    float _999 = fma(_685, _989, _685);
    float _1001 = floor(_981);
    bool _1003 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1005 = isnan(1.0);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_989, _955, _955);
    float _1015 = _991 * _995;
    float _1017 = _997 * (-2.0);
    float _1019 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1013);
    float _1021 = _1015 * (-2.0);
    float _1023 = floor(_993);
    float _1025 = fma(_987, 0.5, 0.5);
    float _1027 = fma(_999, _879, _1019);
    float _1029 = fma(_705, _1017, _705);
    float _1031 = fma(_1017, _957, _957);
    float _1033 = fma(_1021, _953, _953);
    float _1035 = fma(_667, _1021, _667);
    float _1037 = _1027 * 0.15915493667125701904296875;
    float _1039 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1031);
    float _1041 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1033);
    float _1043 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[118].x, _939);
    float _1045 = fma(_1029, _879, _1039);
    float _1047 = fma(_1035, _879, _1041);
    float _1049 = _1037 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _1047 * 0.15915493667125701904296875;
    float _1055 = _1045 * 0.15915493667125701904296875;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1059 = _1037 * 6.283185482025146484375;
    float _1061 = cos(_1059);
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_1023;
    float _1067 = _993 + _1065;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_231));
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1053 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1053 * 6.283185482025146484375;
    float _1097 = cos(_1095);
    float _1099 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _755 * _1071;
    out.m_86.x = _1075;
    out.m_86.y = _1091;
    out.m_86.z = _1093;
    out.m_86.w = _1087;
    float _1105 = as_type<float>(_231) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1107 = _1055 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = -_1001;
    float _1113 = _981 + _1111;
    float _1115 = _1079 * _1061;
    out.m_88.x = _1089;
    out.m_88.y = _1099;
    out.m_88.z = _1101;
    out.m_88.w = _1057;
    float _1117 = _1079 * _1051;
    float _1119 = _1055 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    float _1123 = _1097 * _1061;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_245));
    float _1127 = fma(_1113, 2.0, -1.0);
    float _1129 = as_type<float>(_245) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1131 = floor(_1025);
    float _1133 = _1061 * _1109;
    float _1135 = _1097 * _1051;
    float _1137 = _1097 * _1109;
    float _1139 = _1079 * _1109;
    float _1141 = _1051 * _1109;
    float _1143 = _747 * _1125;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = fma(_1121, _1123, _1117);
    float _1153 = fma(_1121, _1117, _1123);
    float _1155 = fma(_1067, 2.0, -1.0);
    float _1157 = -_1135;
    float _1159 = fma(_1121, _1115, _1157);
    float _1161 = -_1115;
    float _1163 = fma(_1121, _1135, _1161);
    float _1165 = -_1121;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1145);
    float _1169 = -_1121;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1147);
    float _1173 = -_1121;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1177 = -_1103;
    float _1179 = _1121 * _1177;
    float _1181 = _1155 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1183 = -_1131;
    float _1185 = _1025 + _1183;
    float _1187 = _1127 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1189 = fma(_1133, _1143, _1179);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1195 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1197 = _1137 * _1103;
    float _1199 = _1139 * _1103;
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1191);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1193);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1195);
    float _1207 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1209 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1211 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = fma(_1151, _1143, _1197);
    float _1215 = fma(_1159, _1143, _1199);
    float _1217 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1167);
    float _1219 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1221 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1223 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1225 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1227 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1207);
    float _1229 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1209);
    float _1231 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1233 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1235 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1171);
    float _1237 = fma(_1141, _1219, _1189);
    float _1239 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1221);
    float _1241 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1223);
    float _1243 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1225);
    float _1245 = _1105 * _1217;
    float _1247 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1227);
    float _1249 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1229);
    float _1251 = _1105 * _1231;
    float _1253 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1233);
    float _1255 = _1105 * _1235;
    float _1257 = fma(_1129, _1247, _1245);
    float _1259 = fma(_1163, _1219, _1213);
    float _1261 = fma(_1129, _1253, _1251);
    float _1263 = fma(_1129, _1249, _1255);
    float _1265 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1239);
    float _1267 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1241);
    float _1269 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1271 = fma(_1153, _1219, _1215);
    float _1273 = _1265 + _1257;
    float _1275 = _1267 + _1263;
    float _1277 = _1269 + _1261;
    float _1279 = fma(_1185, 2.0, -1.0);
    float _1281 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1283 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1285 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_90.x = _1273;
    out.m_90.y = _1275;
    out.m_90.z = _1277;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1289 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1281);
    float _1291 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1283);
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1285);
    float _1295 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1203);
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1201);
    float _1299 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1205);
    float _1301 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1289);
    float _1303 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1291);
    float _1305 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1293);
    float _1307 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1309 = _1297 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1311 = _1299 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1313 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1315 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1319 = _1313 + _1309;
    float _1321 = _1315 + _1307;
    float _1323 = _1317 + _1311;
    float _1325 = _1287;
    float _1327 = _1233;
    float _1329 = _1271;
    float _1331 = _1129;
    float _1333 = _1271;
    float _1335 = _1315;
    float _1337 = _1129;
    float _1339 = _1297;
    float _1341 = _1155;
    float _1343 = _1279;
    float _1345 = _1127;
    int _1347 = as_type<int>(_987);
    float _1357;
    float _1359;
    float _1361;
    float _1363;
    if (!_1011)
    {
        bool _1349 = _1307 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1351 = !_1349;
        _1353 = _1351;
        if (!_1353)
        {
            float _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1357 = _1355;
            _1359 = 0.0;
            _1361 = 0.0;
            _1363 = 0.0;
            _1365 = true;
        }
    }
    if ((!_1365) || _1353)
    {
        bool _1401;
        if (!_1353)
        {
            bool _1367 = _1307 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1369 = isnan(_1307);
            bool _1371 = _1367 || _1369;
            bool _1373 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1375 = _1371 || _1373;
            bool _1377 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1379 = !_1375;
            bool _1381 = _1377 && _1379;
            bool _1383 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1335 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1381)
            {
                _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1385 = _1325;
            float _1387 = _1385;
            if (_1381)
            {
                _1327 = 0.0;
            }
            float _1389 = _1327;
            _1359 = _1389;
            if (_1381)
            {
                _1329 = 0.0;
            }
            float _1391 = _1329;
            _1333 = _1391;
            _1361 = _1391;
            if (_1381)
            {
                float _1393 = _1385 * 5.0;
                _1387 = _1393;
            }
            float _1395 = _1387;
            _1357 = _1395;
            if (_1381)
            {
                _1331 = 0.0;
            }
            float _1397 = _1331;
            bool _1399 = !_1375;
            _1401 = _1399 && _1383;
            _1337 = _1397;
            _1363 = _1397;
        }
        if ((!_1401) || _1353)
        {
            _1353 = false;
            float _1403 = _1333;
            float _1405 = _1335;
            float _1407 = _1337;
            bool _1409 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1411 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1413 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1415 = _1281;
            float _1417 = _1405;
            float _1419 = _1407;
            _1357 = _1323;
            _1359 = _1319;
            if (_1409)
            {
                float _1421 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1415 = _1421;
            }
            float _1423 = _1415;
            if (_1409)
            {
                float _1425 = abs(_1127);
                float _1427 = -_1425;
                float _1429 = _1427 + 1.0;
                _1339 = _1429;
            }
            float _1431 = _1339;
            if (_1411)
            {
                float _1433 = abs(_1155);
                float _1435 = -_1433;
                float _1437 = _1435 + 1.0;
                _1341 = _1437;
            }
            float _1439 = _1341;
            if (!_1409)
            {
                _1417 = 1.0;
            }
            float _1441 = _1417;
            float _1443 = _1441;
            if (_1413)
            {
                float _1445 = abs(_1279);
                float _1447 = -_1445;
                float _1449 = _1447 + 1.0;
                _1343 = _1449;
            }
            float _1451 = _1343;
            if (!_1411)
            {
                _1345 = 1.0;
            }
            float _1453 = _1345;
            float _1455 = _1453;
            if (!_1413)
            {
                _1419 = 1.0;
            }
            float _1457 = _1419;
            float _1459 = _1313;
            float _1461 = _1457;
            if (_1411)
            {
                float _1463 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1459 = _1463;
            }
            float _1465 = _1459;
            float _1467 = _1403;
            if (_1413)
            {
                float _1469 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1467 = _1469;
            }
            float _1471 = _1467;
            if (_1409)
            {
                float _1473 = _1431 * _1423;
                float _1475 = precise::clamp(_1473, 0.0, 1.0);
                _1443 = _1475;
            }
            float _1477 = _1443;
            if (_1411)
            {
                float _1479 = _1439 * _1465;
                float _1481 = precise::clamp(_1479, 0.0, 1.0);
                _1455 = _1481;
            }
            float _1483 = _1455;
            float _1485 = _1477 * _1483;
            if (_1413)
            {
                float _1487 = _1451 * _1471;
                float _1489 = precise::clamp(_1487, 0.0, 1.0);
                _1461 = _1489;
            }
            float _1491 = _1461;
            float _1493 = _1485 * _1491;
            _1361 = _1321;
            _1363 = _1493;
        }
    }
    _1365 = false;
    float _1495 = _1357;
    float _1497 = _1359;
    float _1499 = _1361;
    float _1501 = _1363;
    float _1503 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1505 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1503);
    float _1507 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1505);
    float _1509 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1511 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1513 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1509);
    float _1515 = 1.0 / _1511;
    float _1517 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1513);
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1521 = _1519 + _1511;
    float _1523 = _1521 * _1515;
    float _1525 = _1523 * 0.5;
    float _1527 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1531 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1529);
    float _1533 = _1307 + _1527;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1537 = 1.0 / _1531;
    float _1539 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1541 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1535);
    float _1543 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1539);
    float _1545 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1541);
    float _1547 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1543);
    float _1549 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1551 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1555 = _1537 * _1553;
    float _1557 = trunc(_1551);
    int _1559 = int(_1557);
    bool _1561 = _1555 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1563 = _1555 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1565 = !_1561;
    int _1567 = _1565 ? 0 : 1;
    int _1569 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1571 = _1559 + _1569;
    int _1573 = _1571 + 1;
    int _1575 = 2;
    float _1577 = _1499;
    float _1579 = _1497;
    float _1581 = _1495;
    float _1583 = _1501;
    if (!_1561)
    {
        _1575 = 1;
    }
    int _1585 = _1575;
    int _1587 = _1585;
    if (!_1563)
    {
        _1587 = _1567;
    }
    int _1589 = _1587;
    float _1591 = trunc(_1549);
    int _1593 = int(_1591);
    int _1595 = _1589 << 6;
    int _1597 = _1595 + 96;
    uint _1600 = uint(int(uint(_1597) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    int _1616 = _1595 + 104;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
    int _1622 = int(_1618) & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    int _1626 = int(_1618) + 1;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    int _1630 = _1626 & 3;
    float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
    int _1634 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1636 = _1593 + _1634;
    int _1638 = _1636 + 1;
    bool _1640 = _1638 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1642 = _1595 + 48;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    int _1660 = _1638 | _1573;
    bool _1662 = _1660 < 0;
    bool _1664 = _1662 || _1640;
    int _1666 = _1595 + 64;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c15)._m0[int(_1678)][_1680];
    bool _1684 = _1573 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1686 = _1684 || _1664;
    int _1688 = _1595 + 56;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
    uint _1706 = uint(_1638);
    float _1708 = as_type<float>(_1589);
    if (!_1686)
    {
        int _1710 = _1573 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1712 = _1710 + _1638;
        _1706 = uint(_1712);
    }
    uint _1714 = _1706;
    int _1716 = _1595 + 72;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
    int _1722 = int(_1718) & 3;
    float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
    int _1726 = int(_1718) + 1;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    int _1730 = _1726 & 3;
    float _1732 = (*spvDescriptorSet0.vp_c15)._m0[int(_1728)][_1730];
    if (!_1686)
    {
        uint _1734 = uint(int(uint(int(_1714)) >> uint(2)));
        _1347 = int(_1734);
    }
    int _1736 = _1347;
    float _1738 = _1533 * _1614;
    int _1740 = as_type<int>(_1614);
    int _1742 = as_type<int>(_1738);
    if (!_1686)
    {
        int _1744 = int(_1714) << 2;
        _1740 = _1744;
    }
    int _1746 = _1740;
    float _1748 = fma(_1309, _1606, _1738);
    if (!_1686)
    {
        int _1750 = 12 & _1746;
        _1742 = _1750;
    }
    int _1752 = _1742;
    float _1754 = fma(_1311, _1624, _1748);
    if (!_1686)
    {
        int _1756 = _1736 << 4;
        int _1758 = _1756 + _1752;
        _759 = _1758;
    }
    int _1760 = _759;
    float _1762 = _1754 + _1632;
    float _1764 = _599;
    if (!_1686)
    {
        int _1766 = _1760 + 400;
        uint _1768 = uint(int(uint(_1766) >> uint(2)));
        uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
        int _1772 = int(_1768) & 3;
        float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
        _1764 = _1774;
    }
    float _1776 = _1764;
    float _1778 = _1533 * _1658;
    float _1780 = 1.0 / _1762;
    float _1782 = fma(_1309, _1650, _1778);
    int _1784 = _1595 + 80;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c15)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c15)._m0[int(_1796)][_1798];
    float _1802 = _1533 * _1682;
    float _1804 = fma(_1309, _1674, _1802);
    int _1806 = _1595 + 88;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c15)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    float _1824 = _1802;
    float _1826 = _1782;
    if (!_1686)
    {
        float _1828 = floor(_1551);
        _1824 = _1828;
    }
    float _1830 = _1824;
    float _1832 = fma(_1311, _1696, _1782);
    float _1834 = _1832 + _1704;
    float _1836 = fma(_1311, _1724, _1804);
    float _1838 = _1834 * _1780;
    float _1840 = _1804;
    float _1842 = _1830;
    float _1844 = _1838;
    if (!_1686)
    {
        float _1846 = floor(_1549);
        _1840 = _1846;
    }
    float _1848 = _1840;
    float _1850 = _1836 + _1732;
    float _1852 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1854 = _1838 >= 0.0;
    if (!_1686)
    {
        float _1856 = -_1830;
        float _1858 = _1551 + _1856;
        _1842 = _1858;
    }
    float _1860 = _1842;
    float _1862 = _1850 * _1780;
    float _1864 = floor(_1852);
    bool _1866 = _1838 <= 1.0;
    bool _1868 = _1866 && _1854;
    float _1870 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1872 = _1862 >= 0.0;
    bool _1874 = _1872 && _1868;
    float _1876 = floor(_1870);
    bool _1878 = _1862 <= 1.0;
    bool _1880 = _1878 && _1874;
    float _1882 = _1848;
    if (!_1686)
    {
        float _1884 = -_1848;
        float _1886 = _1549 + _1884;
        _1882 = _1886;
    }
    float _1888 = _1882;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_1686)
    {
        float _1892 = rint(_1776);
        float _1894 = precise::max(_1892, 0.0);
        uint _1896 = uint(_1894);
        uint _1898 = clamp(_1896, 0u, 65535u);
        _1890 = as_type<float>(_1898);
    }
    float _1900 = _1890;
    float _1902 = _1533 * _1800;
    float _1904 = fma(_1309, 6.2500002968590706586837768554688e-05, 0.5);
    if (_1880)
    {
        float _1906 = float(_1589);
        _1826 = _1906;
    }
    float _1908 = _1826;
    float _1910 = fma(_1309, _1792, _1902);
    float _1912 = fma(_1311, 6.2500002968590706586837768554688e-05, 0.5);
    float _1914 = -_1876;
    float _1916 = _1870 + _1914;
    float _1918 = fma(_1311, _1814, _1910);
    float _1920 = _1908;
    float _1922 = _1916;
    if (_1880)
    {
        float _1924 = rint(_1908);
        float _1926 = precise::max(_1924, 0.0);
        uint _1928 = uint(_1926);
        uint _1930 = clamp(_1928, 0u, 65535u);
        _1920 = as_type<float>(_1930);
    }
    float _1932 = _1920;
    float _1934 = -_1864;
    float _1936 = _1852 + _1934;
    float _1938 = _1918 + _1822;
    float2 _6498 = float2(_1904, _1912);
    float _1940 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_6498, float2(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_6498, float2(0.0), isnan(_6498)), level(0.0)).x;
    float _1942 = _1938 * _1780;
    float2 _6511 = float2(_1936, _1916);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6511, float2(0.0), isnan(_6511)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6511, float2(0.0), isnan(_6511)), level(0.0)).x;
    float _1946 = _1900;
    if (!_1686)
    {
        float3 _6526 = float3(_1888, _1860, float(as_type<int>(_1900)));
        float3 _6530 = select(_6526, float3(0.0), isnan(_6526));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6530.xy, uint(rint(_6530.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6530.xy, uint(rint(_6530.z)), level(0.0)).x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = _1932;
    if (_1880)
    {
        float3 _6545 = float3(_1838, _1862, float(as_type<int>(_1932)));
        float3 _6547 = select(_6545, float3(0.0), isnan(_6545));
        float _1954 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6547.xy, uint(rint(_6547.z)), _1942, level(0.0));
        _1952 = _1954;
    }
    float _1956 = _1952;
    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1960 = _1495 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1964 = _1497 + _1962;
    float _1966 = _1960 * _1960;
    float _1968 = fma(_1964, _1964, _1966);
    float _1970 = sqrt(_1968);
    bool _1972 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1974 = !_1972;
    float _1976 = _1970;
    float _1978 = _1968;
    float _1980 = _1960;
    float _1982 = _1964;
    float _1984 = _1950;
    if (!_1974)
    {
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1990 = _1970 + _1988;
        float _1992 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1994 = rsqrt(_1968);
        float _1996 = _1990 * _1986;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = _1998 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        float _2004 = _1998 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        float _2008 = _2002 + (-1.0);
        float _2010 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2012 = fma(_2006, _1992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2014 = fma(_2002, _1499, _2010);
        float _2016 = _1994 * _2012;
        float _2018 = fma(_1964, _2016, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2020 = fma(_1960, _2016, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1577 = _2014;
        _1579 = _2018;
        _1581 = _2020;
        _1976 = _2002;
    }
    float _2022 = _1577;
    float _2024 = _1579;
    float _2026 = _1581;
    float _2028 = _1976;
    float _2030 = _1940 * 2000.0;
    bool _2032 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2034 = isnan(0.5);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2040 = _2036 || _2038;
    bool _2042 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2044 = isnan(0.5);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = _1307 >= _2030;
    bool _2054 = isnan(_1307);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(_2030);
    bool _2060 = _2056 || _2058;
    float _2062 = _2028;
    if (_2060)
    {
        _1708 = _2022;
    }
    float _2064 = _1708;
    float _2066 = _2064;
    if (!_2060)
    {
        _2066 = 0.0;
    }
    float _2068 = _2066;
    float _2070 = _2068;
    if (_2060)
    {
        _1978 = _2024;
    }
    float _2072 = _1978;
    float _2074 = _2072;
    if (!_2060)
    {
        _2062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2076 = _2062;
    float _2078 = -_1307;
    float _2080 = _2078 + _2068;
    if (!_2060)
    {
        _2074 = 0.0;
    }
    float _2082 = _2074;
    float _2084 = _2082;
    if (_2060)
    {
        _1980 = _2026;
    }
    float _2086 = _1980;
    float _2088 = _2086;
    if (!_2060)
    {
        float _2090 = _2076 * 5.0;
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = _2080 * _2080;
    float _2096 = -_1309;
    float _2098 = _2096 + _2082;
    float _2100 = -_1311;
    float _2102 = _2100 + _2092;
    float _2104 = fma(_2098, _2098, _2094);
    float _2106 = fma(_2102, _2102, _2104);
    float _2108 = sqrt(_2106);
    bool _2110 = _2108 > 0.0;
    bool _2112 = !_2110;
    float _2114 = _2092;
    float _2116 = _2098;
    float _2118 = _2106;
    if (!_2112)
    {
        float _2120 = _291 * _291;
        float _2122 = fma(_317, _317, _2120);
        float _2124 = fma(_319, _319, _2122);
        float _2126 = rsqrt(_2106);
        float _2128 = sqrt(_2124);
        float _2130 = _2080 * _2126;
        float _2132 = _2102 * _2126;
        bool _2134 = _2128 > 0.0;
        float _2136 = _2098 * _2126;
        bool _2138 = !_2134;
        if (!_2138)
        {
            float _2140 = rsqrt(_2124);
            float _2142 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2144 = _291 * _2140;
            float _2146 = _317 * _2140;
            float _2148 = _319 * _2140;
            float _2150 = _2130 * _2144;
            float _2152 = fma(_2136, _2146, _2150);
            float _2154 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2156 = fma(_2132, _2148, _2152);
            float _2158 = _2156 * _2154;
            float _2160 = fma(_317, _2158, _2082);
            float _2162 = fma(_291, _2158, _2068);
            float _2164 = fma(_319, _2158, _2092);
            _2114 = _2164;
            _2084 = _2160;
            _2070 = _2162;
            _2116 = _2152;
            _2118 = _2146;
        }
    }
    float _2166 = _2114;
    float _2168 = _2084;
    float _2170 = _2070;
    float _2172 = _2116;
    float _2174 = _2118;
    float _2176 = _2172;
    float _2178 = _2170;
    float _2180 = _2168;
    float _2182 = _2166;
    float _2184 = _2174;
    if (!_2040)
    {
        float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2188 = _1307 + _2186;
        float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2192 = _1309 + _2190;
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2196 = -_1311;
        float _2198 = _2196 + _2166;
        float _2200 = _2188 * _2188;
        float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2204 = _1311 + _2202;
        float _2206 = fma(_2192, _2192, _2200);
        float _2208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2210 = fma(_2204, _2204, _2206);
        float _2212 = sqrt(_2210);
        float _2214 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2216 = precise::min(_2212, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2218 = _2216 * _2208;
        float _2220 = -_1309;
        float _2222 = _2220 + _2168;
        float _2224 = _2214 * _2218;
        float _2226 = -_1307;
        float _2228 = _2226 + _2170;
        float _2230 = fma(_2222, _2224, _1309);
        float _2232 = fma(_2228, _2224, _1307);
        float _2234 = fma(_2198, _2224, _1311);
        _2176 = _2208;
        _2178 = _2232;
        _2180 = _2230;
        _2182 = _2234;
        _2184 = _2222;
    }
    float _2236 = _2176;
    float _2238 = _2178;
    float _2240 = _2180;
    float _2242 = _2182;
    float _2244 = _2184;
    float _2246 = _2244;
    float _2248 = _2236;
    if (_2050)
    {
        _1982 = 1.0;
    }
    float _2250 = _1982;
    float _2252 = _2250;
    if (_1686)
    {
        _1844 = 1.0;
    }
    float _2254 = _1844;
    float _2256 = _2254;
    if (_2050)
    {
        _2246 = 1.0;
    }
    float _2258 = _2246;
    float _2260 = _2258;
    if (!_2050)
    {
        float _2262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2270 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2268;
        float _2272 = _2264 * 6.283185482025146484375;
        float _2274 = cos(_2272);
        float _2276 = _2266 * 0.15915493667125701904296875;
        float _2278 = _2264 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = 1.0 / _2274;
        float _2284 = _2276 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = _2276 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = 1.0 / _2270;
        float _2298 = 1.0 / _2294;
        float _2300 = _2292 * _2298;
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2304 = fma(_1555, _2300, _2302);
        float _2306 = _2304 * _2296;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2248 = _2282;
        _2260 = _2308;
    }
    float _2310 = _2248;
    float _2312 = _2260;
    float _2314 = _2310;
    if (!_2050)
    {
        float _2316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2318 = _2316 * 0.15915493667125701904296875;
        float _2320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2322 = _2318 * 6.283185482025146484375;
        float _2324 = cos(_2322);
        float _2326 = _2320 * 0.15915493667125701904296875;
        float _2328 = _2318 * 6.283185482025146484375;
        float _2330 = sin(_2328);
        float _2332 = 1.0 / _2324;
        float _2334 = _2326 * 6.283185482025146484375;
        float _2336 = cos(_2334);
        float _2338 = _2330 * _2332;
        float _2340 = _2326 * 6.283185482025146484375;
        float _2342 = sin(_2340);
        float _2344 = _2336 * _2338;
        float _2346 = 1.0 / _2344;
        float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2350 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2348;
        float _2352 = 1.0 / _2350;
        float _2354 = _2342 * _2346;
        float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2358 = fma(_1555, _2354, _2356);
        float _2360 = _2358 * _2352;
        float _2362 = precise::clamp(_2360, 0.0, 1.0);
        float _2364 = -_2362;
        float _2366 = _2364 + 1.0;
        _2314 = _2326;
        _2252 = _2366;
    }
    float _2368 = _2314;
    float _2370 = _2252;
    float _2372 = _2368;
    if (!_1686)
    {
        int _2374 = int(_1714) << 4;
        int _2376 = _2374 + 2048;
        uint _2378 = uint(int(uint(_2376) >> uint(2)));
        uint _2380 = uint(int(uint(int(_2378)) >> uint(2)));
        int _2382 = int(_2378) & 3;
        float _2384 = (*spvDescriptorSet0.vp_c15)._m0[int(_2380)][_2382];
        int _2386 = int(_2378) + 1;
        uint _2388 = uint(int(uint(_2386) >> uint(2)));
        int _2390 = _2386 & 3;
        float _2392 = (*spvDescriptorSet0.vp_c15)._m0[int(_2388)][_2390];
        int _2394 = _2376 + 8;
        uint _2396 = uint(int(uint(_2394) >> uint(2)));
        uint _2398 = uint(int(uint(int(_2396)) >> uint(2)));
        int _2400 = int(_2396) & 3;
        float _2402 = (*spvDescriptorSet0.vp_c15)._m0[int(_2398)][_2400];
        int _2404 = int(_2396) + 1;
        uint _2406 = uint(int(uint(_2404) >> uint(2)));
        int _2408 = _2404 & 3;
        float _2410 = (*spvDescriptorSet0.vp_c15)._m0[int(_2406)][_2408];
        float _2412 = _1533 * _2392;
        float _2414 = fma(_1309, _2384, _2412);
        float _2416 = fma(_1311, _2402, _2414);
        float _2418 = _2416 + _2410;
        float _2420 = precise::clamp(_2418, 0.0, 1.0);
        float _2422 = -_2420;
        float _2424 = _2422 + _1950;
        float _2426 = fma(_2424, 500.0, 1.5);
        float _2428 = exp2(_2426);
        float _2430 = 0.0 + _2428;
        float _2432 = precise::clamp(_2430, 0.0, 1.0);
        _2256 = _2432;
    }
    float _2434 = _2256;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2438 = _2238 + _2436;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2442 = _2240 + _2440;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2446 = _2242 + _2444;
    float _2448 = _2438 * _2438;
    float _2450 = fma(_2442, _2442, _2448);
    float _2452 = fma(_2446, _2446, _2450);
    float _2454 = rsqrt(_2452);
    float _2456 = sqrt(_2452);
    float _2458 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2460 = _2442 * _2458;
    float _2462 = _2446 * _2458;
    float _2464 = _2460 * _2460;
    float _2466 = _2462 * _2462;
    float _2468 = _2464 + _2466;
    float _2470 = sqrt(_2468);
    bool _2472 = _2470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2476 = _2470 + _2474;
    float _2478 = _2454;
    float _2480 = _2476;
    float _2482 = _2438;
    float _2484 = _2468;
    if (_2472)
    {
        float _2486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2478 = _2486;
    }
    float _2488 = _2478;
    if (_2472)
    {
        float _2490 = rsqrt(_2468);
        _2372 = _2490;
    }
    float _2492 = _2372;
    float _2494 = _2492;
    if (_2472)
    {
        float _2496 = _2476 * _2488;
        _2480 = _2496;
    }
    float _2498 = _2480;
    if (_2472)
    {
        float _2500 = _2498 * 0.15915493667125701904296875;
        _1984 = _2500;
    }
    float _2502 = _1984;
    float _2504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2506 = _2446;
    if (_2472)
    {
        float _2508 = _2502 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        _2506 = _2510;
    }
    float _2512 = _2506;
    float _2514 = precise::max(0.0, _2504);
    float _2516 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2518 = _2514;
    if (_2472)
    {
        float _2520 = _2502 * 6.283185482025146484375;
        float _2522 = cos(_2520);
        _2516 = _2522;
    }
    float _2524 = _2516;
    float _2526 = -_2458;
    float _2528 = -_2514;
    float _2530 = fma(_2438, _2526, _2528);
    if (_2472)
    {
        float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2482 = _2532;
    }
    float _2534 = _2482;
    float _2536 = _2534;
    float _2538 = _2512;
    if (_2472)
    {
        float _2540 = fma(_2512, _2534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2536 = _2540;
    }
    float _2542 = _2536;
    float _2544 = _2542;
    if (!_2472)
    {
        _2538 = _2530;
    }
    float _2546 = _2538;
    float _2548 = _2546;
    if (_2472)
    {
        float _2550 = _2492 * _2542;
        _1922 = _2550;
    }
    float _2552 = _1922;
    if (!_2472)
    {
        _2494 = _2460;
    }
    float _2554 = _2494;
    float _2556 = _2554;
    float _2558 = _2524;
    if (_2472)
    {
        float _2560 = _2524 + (-1.0);
        _2518 = _2560;
    }
    float _2562 = _2518;
    float _2564 = _2562;
    if (_2472)
    {
        float _2566 = _2460 * _2552;
        _2556 = _2566;
    }
    float _2568 = _2556;
    if (!_2472)
    {
        _2544 = _2464;
    }
    float _2570 = _2544;
    float _2572 = _2570;
    if (_2472)
    {
        float _2574 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2484 = _2574;
    }
    float _2576 = _2484;
    if (!_2472)
    {
        _2564 = _2462;
    }
    float _2578 = _2564;
    float _2580 = _2578;
    if (_2472)
    {
        float _2582 = _2462 * _2552;
        _2580 = _2582;
    }
    float _2584 = _2580;
    if (_2472)
    {
        float _2586 = _2568 * _2568;
        _2572 = _2586;
    }
    float _2588 = _2572;
    if (_2472)
    {
        float _2590 = fma(_2530, _2524, _2576);
        _2548 = _2590;
    }
    float _2592 = _2548;
    if (!_2472)
    {
        _2558 = _2466;
    }
    float _2594 = _2558;
    float _2596 = _2594;
    if (_2472)
    {
        float _2598 = _2584 * _2584;
        _2596 = _2598;
    }
    float _2600 = _2596;
    float _2602 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2604 = fma(_2592, _2592, _2588);
    float _2606 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2608 = _2604 + _2600;
    float _2610 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2606);
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2614 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2612);
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2620 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2622 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2610);
    float _2624 = rsqrt(_2608);
    float _2626 = -_2616;
    float _2628 = _2626 + 1.0;
    float _2630 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2632 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2618);
    float _2634 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2636 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2620);
    float _2638 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2630);
    float _2640 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2632);
    float _2642 = abs(_2628);
    float _2644 = log2(_2642);
    float _2646 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2636);
    float _2648 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2638);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2652 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2654 = _2646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2656 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2660 = _2624 * _2568;
    float _2662 = _2624 * _2592;
    float _2664 = _2624 * _2584;
    float _2666 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2658);
    float _2668 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2670 = -_2652;
    float _2672 = fma(_2670, _2602, 1.0);
    float _2674 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2666);
    float _2676 = -_2668;
    float _2678 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2676);
    float _2680 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2682 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2684 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2674);
    float _2686 = -_2664;
    float _2688 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2678);
    float _2690 = log2(_2672);
    float _2692 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2694 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2682);
    float _2696 = fma(_2688, -0.5, 0.5);
    float _2698 = fma(_2688, 0.5, 0.5);
    float _2700 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2692);
    float _2702 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2694);
    float _2704 = _2662 + 1.0;
    float _2706 = 1.0 / _2684;
    float _2708 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2700);
    float _2710 = fma(_2698, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2712 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2708);
    float _2714 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2702);
    float _2716 = fma(_2698, _2710, -0.212114393711090087890625);
    float _2718 = exp2(_2680);
    float _2720 = _2690 * 0.693147182464599609375;
    float _2722 = fma(_2698, _2716, 1.570728778839111328125);
    float _2724 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2726 = sqrt(_2696);
    float _2728 = _2712 * _2706;
    float _2730 = _2714 * _2706;
    float _2732 = fma(_2730, -0.5, 0.5);
    float _2734 = -_2662;
    float _2736 = fma(_2718, _2704, _2734);
    float _2738 = fma(_2736, 0.5, 0.5);
    float _2740 = _2726 * 0.636619746685028076171875;
    float _2742 = fma(_2728, 0.5, 0.5);
    float _2744 = -_2722;
    float _2746 = fma(_2740, _2744, 1.0);
    float3 _7753 = float3(_2742, _2732, _2724);
    float _2748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7753, float3(0.0), isnan(_7753)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7753, float3(0.0), isnan(_7753)), level(0.0)).x;
    float3 _7762 = float3(_2742, _2732, _2724);
    float4 _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7762, float3(0.0), isnan(_7762)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7762, float3(0.0), isnan(_7762)), level(0.0)).xyzw;
    float _2753 = _2751.x;
    float _2755 = _2751.y;
    float _2757 = _2751.z;
    float _2759 = _2751.w;
    float2 _7778 = float2(_2746, _2738);
    float3 _2763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7778, float2(0.0), isnan(_7778)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7778, float2(0.0), isnan(_7778)), level(0.0)).xyz;
    float _2765 = _2763.x;
    float _2767 = _2763.y;
    float _2769 = _2763.z;
    float _2771 = abs(_1555);
    float _2773 = log2(_2771);
    float _2775 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2777 = -_1944;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2775);
    float _2783 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_92.y = 1.0;
    float _2785 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2787 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2789 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2791 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2783);
    float _2793 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2785);
    float _2795 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2787);
    float _2797 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2789);
    float _2799 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2791);
    float _2801 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2803 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2793);
    float _2805 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2795);
    float _2807 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2781);
    float _2809 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2797);
    float _2811 = _2799 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2813 = exp2(_2801);
    float _2815 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2807);
    float _2817 = _2803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2819 = _2805 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2821 = _2809 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2823 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2825 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2827 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _2829 = _1555 <= 8000.0;
    bool _2831 = isnan(_1555);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan(8000.0);
    bool _2837 = _2833 || _2835;
    float _2839 = float(_2837);
    float _2841 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2823);
    float _2843 = -_319;
    float _2845 = _2843 + _2242;
    float _2847 = _2817;
    float _2849 = _2714;
    float _2851 = _2684;
    if (!_2060)
    {
        _1583 = 0.0;
    }
    float _2853 = _1583;
    float _2855 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2841);
    float _2857 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2859 = precise::clamp(_2857, 0.0, 1.0);
    float _2861 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2863 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2855);
    float _2865 = fma(_2859, -2.0, 3.0);
    float _2867 = _2859 * _2859;
    float _2869 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2861);
    float _2871 = _2867 * _2865;
    float _2873 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2875 = -_2871;
    float _2877 = _2875 + 1.0;
    float _2879 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2873);
    float _2881 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2825);
    float _2883 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2871);
    float _2885 = _2827 + _2879;
    float _2887 = _2815 + _2684;
    if (!_1880)
    {
        _2847 = 1.0;
    }
    float _2889 = _2847;
    float _2891 = _2839 * _2883;
    float _2893 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2885);
    float _2895 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2897 = _2887 * 0.5;
    float _2899 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2901 = 1.0 / _2893;
    float _2903 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2905 = _2889;
    if (_1880)
    {
        bool _2907 = _1956 >= _1942;
        bool _2909 = isnan(_1956);
        bool _2911 = _2907 || _2909;
        bool _2913 = isnan(_1942);
        bool _2915 = _2911 || _2913;
        float _2917 = float(_2915);
        _2905 = _2917;
    }
    float _2919 = _2905;
    out.m_94.z = _2897;
    out.m_94.w = _2684;
    float _2921 = _2779 * _2899;
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = _2903 + _2881;
    float _2927 = -_317;
    float _2929 = _2927 + _2240;
    float _2931 = _2919 * _2434;
    float _2933 = exp2(_2895);
    float _2935 = -_2923;
    float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _2712;
    out.gl_Position.y = _2714;
    out.gl_Position.z = _2815;
    out.gl_Position.w = _2684;
    float _2939 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2941 = -_291;
    float _2943 = _2941 + _2238;
    float _2945 = -_2931;
    float _2947 = fma(_2945, _2937, 1.0);
    float _2949 = precise::clamp(_2947, 0.0, 1.0);
    float _2951 = _2863 * _2901;
    float _2953 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2955 = _2949 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2957 = _2951 > 0.0;
    out.m_92.x = _2955;
    float _2959 = -_2933;
    float _2961 = _2959 + 1.0;
    float _2963 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2925);
    bool _2965 = _2951 < 1.0;
    bool _2967 = _2965 && _2957;
    float _2969 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2953);
    float _2971 = _2961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2973 = _2939 + _2869;
    bool _2975 = _2728 > (-1.0);
    bool _2977 = _2975 && _2967;
    float _2979 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2969);
    float _2981 = -_2971;
    float _2983 = _2981 + 1.0;
    float _2985 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2973);
    bool _2987 = _2730 > (-1.0);
    bool _2989 = _2987 && _2977;
    float _2991 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2993 = _2963 * _2901;
    float _2995 = _2985 * _2901;
    bool _2997 = _2728 < 1.0;
    bool _2999 = _2997 && _2989;
    bool _3001 = _2730 < 1.0;
    bool _3003 = _3001 && _2999;
    float _3005 = _2971 * _2748;
    float _3007 = 1.0 / _2991;
    float _3009 = _2759 * _3005;
    float _3011 = _2769 * _3005;
    float _3013 = fma(_2765, _3009, _2753);
    float _3015 = fma(_2767, _3009, _2755);
    float _3017 = _2759 * _2983;
    float _3019 = fma(_2759, _3011, _2757);
    float _3021 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3023 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    out.m_96.x = _3013;
    out.m_96.y = _3015;
    out.m_96.z = _3019;
    out.m_96.w = _3017;
    float _3025 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3021);
    float _3027 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3023);
    float _3029 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3025);
    float _3031 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3027);
    float _3033 = _2312 * _2370;
    float _3035 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3037 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3039 = _3033 * _2853;
    float _3041 = _3035 * _3007;
    float _3043 = _3037 * _3007;
    float _3045 = _3039 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3047 = !_3003;
    float _3049 = _3041;
    float _3051 = _3045;
    float _3053 = _3007;
    float _3081;
    float _3083;
    if (!_3047)
    {
        float _3055 = -_2995;
        float _3057 = _2730 + _3055;
        float _3059 = -_2993;
        float _3061 = _2728 + _3059;
        float _3063 = -_3041;
        float _3065 = _2728 + _3063;
        float _3067 = -_3043;
        float _3069 = _2730 + _3067;
        float _3071 = _3057 * _3057;
        float _3073 = fma(_3061, _3061, _3071);
        float _3075 = sqrt(_3073);
        bool _3077 = _3075 > 0.0;
        bool _3079 = !_3077;
        _3053 = _3061;
        _3081 = _3073;
        _3083 = _3075;
        _3085 = _3079;
        if (!_3085)
        {
            float _3087 = _3069 * _3069;
            float _3089 = fma(_3065, _3065, _3087);
            float _3091 = rsqrt(_3073);
            float _3093 = sqrt(_3089);
            float _3095 = _3061 * _3091;
            float _3097 = _3057 * _3091;
            bool _3099 = _3093 > 0.0;
            bool _3101 = !_3099;
            _3049 = _3093;
            _3083 = _3091;
            _3085 = _3101;
            if (!_3085)
            {
                float _3103 = _747 * _2821;
                float _3105 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3107 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2827);
                float _3109 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2939);
                float _3111 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2903);
                float _3113 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3107);
                float _3115 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3109);
                float _3117 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3111);
                float _3119 = rsqrt(_3089);
                float _3121 = _3105 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3123 = 1.0 / _3113;
                float _3125 = _3069 * _3121;
                float _3127 = _3065 * _3121;
                float _3129 = _3125 * _3125;
                float _3131 = fma(_3127, _3127, _3129);
                float _3133 = _3069 * _3119;
                float _3135 = _3065 * _3119;
                float _3137 = _3115 * _3123;
                float _3139 = _3117 * _3123;
                float _3141 = sqrt(_3131);
                float _3143 = _3137 * _3137;
                float _3145 = fma(_3139, _3139, _3143);
                float _3147 = _3097 * _3133;
                float _3149 = fma(_3095, _3135, _3147);
                float _3151 = sqrt(_3145);
                float _3153 = precise::min(0.0, _3149);
                float _3155 = _2684 * _3153;
                float _3157 = fma(_3127, _3155, _2712);
                float _3159 = fma(_3125, _3155, _2714);
                float _3161 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3151);
                out.gl_Position.x = _3157;
                out.gl_Position.y = _3159;
                float _3163 = 1.0 / _3161;
                float _3165 = _3151 * _3163;
                out.m_92.y = _3165;
                _3049 = _3125;
                _2849 = _3159;
                _3053 = _3163;
                _3081 = _3161;
                _2851 = _3155;
                _3083 = _3157;
                _3085 = true;
            }
        }
    }
    else
    {
        float _3167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3167;
        _2849 = 0.0;
        _3051 = 0.0;
        _3081 = _3167;
        _3083 = 0.0;
    }
    _3085 = false;
    float _3169 = _3049;
    float _3171 = _2849;
    float _3173 = _3051;
    float _3175 = _3053;
    float _3177 = _3081;
    float _3179 = _2851;
    float _3181 = _3083;
    bool _3183 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3185 = isnan(_2456);
    bool _3187 = _3183 || _3185;
    bool _3189 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3191 = _3187 || _3189;
    float _3193 = _3175;
    float _3195 = _3169;
    float _3197 = _3179;
    float _3199 = _3177;
    float _3201 = _3171;
    float _3203 = _3181;
    if (!_3191)
    {
        _3193 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3205 = _3193;
    float _3207 = _3205;
    float _3209 = _3205;
    if (!_3191)
    {
        _3195 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3211 = _3195;
    float _3213 = _3211;
    float _3215 = _3211;
    if (!_3191)
    {
        _3197 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3217 = _3197;
    float _3219 = _3217;
    float _3221 = _3217;
    if (!_3191)
    {
        _3199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3223 = _3199;
    float _3225 = _3223;
    float _3227 = _3223;
    if (!_3191)
    {
        _3201 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3229 = _3201;
    float _3231 = _3229;
    float _3233 = _3229;
    if (!_3191)
    {
        _3203 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3235 = _3203;
    bool _3237 = !_3191;
    float _3239 = _3235;
    float _3241 = _3235;
    if (!_3237)
    {
        bool _3243 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3245 = isnan(_2456);
        bool _3247 = _3243 || _3245;
        bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3251 = _3247 || _3249;
        if (!_3251)
        {
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3255 = _2456 + _3253;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3259 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3257;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3265 = 1.0 / _3259;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3283 = _3255 * _3265;
            float _3285 = precise::clamp(_3283, 0.0, 1.0);
            float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3291 = fma(_3285, _3263, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3293 = fma(_3285, _3289, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3295 = fma(_3285, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3297 = fma(_3285, _3273, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3299 = fma(_3285, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3301 = fma(_3285, _3281, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3215 = _3295;
            _3233 = _3299;
            _3209 = _3291;
            _3227 = _3297;
            _3221 = _3293;
            _3241 = _3301;
            _3303 = true;
        }
        else
        {
            bool _3305 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3307 = isnan(_2456);
            bool _3309 = _3305 || _3307;
            bool _3311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3313 = _3309 || _3311;
            if (!_3313)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3315 = _3207;
            _3209 = _3315;
            if (!_3313)
            {
                _3213 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3317 = _3213;
            _3215 = _3317;
            if (!_3313)
            {
                _3219 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3319 = _3219;
            _3221 = _3319;
            if (!_3313)
            {
                _3225 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3321 = _3225;
            _3227 = _3321;
            if (!_3313)
            {
                _3231 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3323 = _3231;
            _3233 = _3323;
            if (!_3313)
            {
                _3239 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3325 = _3239;
            bool _3327 = !_3313;
            _3241 = _3325;
            if (!_3327)
            {
                bool _3329 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3331 = isnan(_2456);
                bool _3333 = _3329 || _3331;
                bool _3335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3337 = _3333 || _3335;
                if (!_3337)
                {
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3341 = _2456 + _3339;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3345 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3343;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3351 = 1.0 / _3345;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3369 = _3341 * _3351;
                    float _3371 = precise::clamp(_3369, 0.0, 1.0);
                    float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3377 = fma(_3371, _3349, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3379 = fma(_3371, _3375, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3381 = fma(_3371, _3355, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3383 = fma(_3371, _3359, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3385 = fma(_3371, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3387 = fma(_3371, _3367, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3215 = _3381;
                    _3233 = _3385;
                    _3209 = _3377;
                    _3227 = _3383;
                    _3221 = _3379;
                    _3241 = _3387;
                    _3303 = true;
                }
                else
                {
                    _3215 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3233 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3227 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3221 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3241 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3303 = false;
    float _3389 = _3215;
    float _3391 = _3233;
    float _3393 = _3209;
    float _3395 = _3227;
    float _3397 = _3221;
    float _3399 = _3241;
    float _3401 = fma(_1275, -0.5, 0.5);
    float _3403 = precise::clamp(_3401, 0.0, 1.0);
    float _3405 = -_3389;
    float _3407 = _3405 + _3391;
    float _3409 = _3173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3411 = -_3393;
    float _3413 = _3411 + _3395;
    float _3415 = fma(_3403, _3407, _3389);
    out.m_98.x = 0.0;
    float _3417 = -_3397;
    float _3419 = _3417 + _3399;
    float _3421 = fma(_3403, _3413, _3393);
    float _3423 = _3415 * 0.586610972881317138671875;
    out.m_63.x = _3409;
    bool _3425 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3427 = fma(_3403, _3419, _3397);
    float _3429 = fma(_3421, 0.298911988735198974609375, _3423);
    bool _3431 = _2312 > 0.0;
    bool _3433 = isnan(_2312);
    bool _3435 = _3431 || _3433;
    bool _3437 = isnan(0.0);
    bool _3439 = _3435 || _3437;
    float _3441 = fma(_3427, 0.114477999508380889892578125, _3429);
    bool _3443 = _2370 <= 0.0;
    bool _3445 = !_3439;
    bool _3447 = _3443 || _3445;
    float _3449 = -_3441;
    float _3451 = _3421 + _3449;
    float _3453 = -_3441;
    float _3455 = _3415 + _3453;
    float _3457 = -_3441;
    float _3459 = _3427 + _3457;
    float _3461 = fma(_3451, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    float _3463 = fma(_3455, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    float _3465 = fma(_3459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    bool _3467 = !_3425;
    if (!_3467)
    {
        float _3469 = -_2238;
        float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3473 = -_2240;
        float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3477 = -_2242;
        float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3481 = _3471 * _3471;
        float _3483 = fma(_3475, _3475, _3481);
        float _3485 = fma(_3479, _3479, _3483);
        float _3487 = sqrt(_3485);
        float _3489 = rsqrt(_3485);
        float _3491 = -_3487;
        float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3495 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3497 = precise::clamp(_3495, 0.0, 1.0);
        float _3499 = _3475 * _3489;
        float _3501 = _3471 * _3489;
        float _3503 = abs(_3497);
        float _3505 = log2(_3503);
        float _3507 = _3479 * _3489;
        float _3509 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3511 = _1275 * _3501;
        float _3513 = -_3501;
        float _3515 = -_3509;
        float _3517 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3515);
        float _3519 = fma(_1273, _3499, _3511);
        float _3521 = -_3507;
        float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3517);
        float _3525 = fma(_1277, _3507, _3519);
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3531 = _3523 + _3529;
        float _3533 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3537 = precise::clamp(_3535, 0.0, 1.0);
        float _3539 = exp2(_3533);
        float _3541 = _3539 * _3537;
        float _3543 = _3527 * _3541;
        float _3545 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3549 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3545;
        out.m_98.y = _3547;
        out.m_98.z = _3549;
    }
    out.m_100.x = _3461;
    out.m_100.y = _3463;
    out.m_100.z = _3465;
    if (!_3447)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3551 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3551;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3303 = false;
    bool _3085 = false;
    bool _1365 = false;
    bool _1353 = false;
    bool _535 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3608 = as_type<float>(_135);
        out.gl_Position.z = _3608;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3678 = as_type<float>(_173);
        out.gl_Position.z = _3678;
    }
    if (_165)
    {
        return out;
    }
    float _175 = in.m_67.x;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_72.x;
    float _185 = in.m_72.y;
    float _187 = in.m_72.z;
    float _189 = in.m_74.x;
    float _191 = in.m_74.y;
    float _193 = in.m_74.z;
    float _195 = in.m_76.x;
    float _197 = in.m_76.y;
    float _199 = in.m_76.z;
    float _201 = _179 * _177;
    float _203 = in.m_78.x;
    float _205 = in.m_78.y;
    float _207 = in.m_78.z;
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _201);
    int _211 = as_type<int>(_181) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_181) & 2;
    bool _217 = _215 != 0;
    float _219 = _209 * 6.283185482025146484375;
    float _221 = floor(_209);
    int _223 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _225 = _223 != 0;
    float _227 = _219 * 0.15915493667125701904296875;
    bool _229 = !_217;
    int _231 = _229 ? (-1090519040) : 1056964608;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = _185 * _191;
    bool _243 = !_213;
    int _245 = _243 ? (-1090519040) : 1056964608;
    float _247 = _227 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_225;
    int _253 = _251 ? 0 : 1;
    float _255 = _185 * _197;
    bool _257 = !_235;
    int _259 = _257 ? 0 : 1;
    out.m_80.x = as_type<float>(_245);
    out.m_80.y = as_type<float>(_231);
    float _261 = _185 * _205;
    float _263 = fma(_183, _189, _241);
    int _265 = abs(_259);
    float _267 = -_221;
    float _269 = _209 + _267;
    int _271 = abs(_253);
    float _273 = fma(_183, _195, _255);
    float _275 = fma(_183, _203, _261);
    bool _277 = !_239;
    int _279 = _277 ? 0 : 1;
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_265);
    float _287 = fma(_249, 0.5, 0.5);
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_187, _199, _273);
    int _293 = abs(_279);
    float _295 = abs(_283);
    float _297 = _285 * _295;
    bool _299 = _269 < 0.5;
    float _301 = float(_299);
    float _303 = -_287;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = float(_271);
    float _309 = -_301;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_307, _305, _297);
    float _315 = float(_293);
    float _317 = fma(_187, _193, _263);
    float _319 = fma(_187, _207, _275);
    float _321 = abs(_311);
    float _323 = fma(_315, _321, _313);
    bool _325 = !_289;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_119);
        float _347 = 1.0 / _345;
        float _349 = _153 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _351 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _351 + _357;
    bool _361 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_351);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _351 + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _375;
    float _393 = 1.0 / _383;
    float _395 = 1.0 / _379;
    float _397 = _355 * _391;
    bool _399 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _401 = isnan(_351);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_371;
    float _413 = _411 + 1.0;
    bool _415 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_351);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _409 * _413;
    float _429 = _359 * _393;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = _387 * _395;
    bool _441 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_351);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = _425 * _433;
    float _459 = -_425;
    float _461 = _459 + 1.0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_455, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _451 * _461;
    float _475 = fma(_465, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_437, _439, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _439, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = -_451;
    float _483 = _481 + 1.0;
    float _485 = _471 * _473;
    float _487 = _475 * _473;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _501 = fma(_491, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _503 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = fma(_477, _457, _497);
    float _507 = fma(_479, _457, _499);
    float _509 = fma(_501, _427, _505);
    float _511 = fma(_503, _427, _507);
    float _513 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _509);
    float _515 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _511);
    bool _517 = !_389;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _521 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_119);
        float _539 = 1.0 / _537;
        float _541 = _153 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_60.x;
    float _547 = in.m_60.y;
    float _549 = in.m_60.z;
    float _551 = _175 * 2.0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _563 = _561 != 0;
    float _565 = in.m_67.y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = floor(_551);
    float _573 = in.m_67.z;
    bool _575 = !_559;
    int _577 = _575 ? 0 : 1;
    float _579 = in.m_82.x;
    float _581 = in.m_82.y;
    bool _583 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _591 = _587 || _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _597 = 1.0 / _569;
    float _599 = in.m_76.w;
    float _601 = in.m_74.w;
    bool _603 = _571 > 0.0;
    float _605 = _197 * _547;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _611 = _191 * _547;
    float _613 = _205 * _547;
    float _615 = fma(_195, _545, _605);
    float _617 = 1.0 / _609;
    float _619 = fma(_203, _545, _613);
    float _621 = fma(_189, _545, _611);
    float _623 = fma(_199, _549, _615);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _625;
    float _629 = fma(_207, _549, _619);
    float _631 = fma(_193, _549, _621);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _639 = log2(_637);
    float _641 = _627 * _597;
    float _643 = _175 + _565;
    float _645 = _573 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _647;
    float _651 = _643 + (-1.0);
    float _653 = _565 * 2.0;
    bool _655 = _571 >= 0.0;
    bool _657 = isnan(_571);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    float _665 = _649 * _617;
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _669 = floor(_653);
    float _671 = _565 + _573;
    float _673 = _513 * _579;
    float _675 = _175 + _573;
    float _677 = _671 + (-1.0);
    float _679 = in.m_78.w;
    float _681 = floor(_645);
    float _683 = _639 * _153;
    float _685 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _687 = _675 + (-1.0);
    bool _689 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _691 = isnan(_543);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = _623 + _599;
    float _703 = _565 + (-0.5);
    float _705 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _707 = 1.0 / _595;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _543 + _709;
    bool _713 = _669 >= 0.0;
    bool _715 = isnan(_669);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = _175 + (-0.5);
    float _725 = _573 + (-0.5);
    float _727 = _515 * _581;
    float _729 = _323 * _673;
    float _731 = exp2(_683);
    int _733 = _663 ? 0 : 1;
    float _735 = _323 * _727;
    bool _737 = _681 >= 0.0;
    bool _739 = isnan(_681);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = _729 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _749 = ~_733;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _757 = _753;
    int _759 = as_type<int>(_601);
    if (!_603)
    {
        int _761 = ~_733;
        int _763 = _761 + 1;
        _757 = _763;
    }
    int _765 = _757;
    float _767 = _635 * _707;
    bool _769 = _681 > 0.0;
    float _771 = fma(_641, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _773 = _629 + _679;
    bool _775 = _669 > 0.0;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _779 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _781 = isnan(_543);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _793 = 1.0 + _791;
    float _795 = -_731;
    float _797 = _795 + 1.0;
    bool _799 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _801 = isnan(_543);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    bool _811 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = isnan(_543);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_789;
    float _825 = _823 + 1.0;
    float _827 = 1.0 / _793;
    float _829 = _591 ? _797 : 0.0;
    float _831 = -_809;
    float _833 = _831 + 1.0;
    bool _835 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _837 = isnan(1.0);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _843 = _839 || _841;
    float _845 = _809 * _825;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _849 = _543 + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = _543 + _851;
    float _855 = _821 * _833;
    float _857 = -_821;
    float _859 = _857 + 1.0;
    float _861 = fma(_767, _849, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _863 = fma(_665, _853, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _865 = _745 ? 0 : 1;
    float _867 = _699 * _859;
    float _869 = _631 + _601;
    int _871 = abs(_577);
    float _873 = -_699;
    float _875 = _873 + 1.0;
    if (_843)
    {
        float _877 = _829 * _827;
        _155 = _877;
    }
    float _879 = _155;
    float _881 = _771 * _867;
    int _883 = _721 ? 0 : 1;
    float _885 = _869 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _887 = ~_865;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[115].x, _881);
    int _895 = _891;
    if (!_769)
    {
        int _897 = ~_865;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _701 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _905 = ~_883;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = fma(_861, _855, _893);
    float _913 = float(_871);
    float _915 = _773 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _917 = float(_765);
    float _919 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _921 = _909;
    if (!_775)
    {
        int _923 = ~_883;
        int _925 = _923 + 1;
        _921 = _925;
    }
    int _927 = _921;
    float _929 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _933 = _913 * _917;
    float _935 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _937 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].x, _929);
    float _939 = fma(_863, _845, _911);
    bool _941 = !_555;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].y, _935);
    float _947 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].x, _937);
    float _949 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].z, _919);
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _953 = in.m_84.x;
    float _955 = in.m_84.y;
    float _957 = in.m_84.z;
    float _959 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].y, _945);
    float _961 = _947 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _963 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].z, _949);
    bool _965 = !_563;
    int _967 = _965 ? 0 : 1;
    float _969 = _959 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _971 = _961 * _931;
    float _973 = _963 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _975 = abs(_967);
    float _977 = _969 * _777;
    int _979 = abs(_943);
    float _981 = fma(_971, 0.5, 0.5);
    float _983 = float(_975);
    float _985 = float(_927);
    float _987 = _973 * _951;
    float _989 = _933 * (-2.0);
    float _991 = float(_979);
    float _993 = fma(_977, 0.5, 0.5);
    float _995 = float(_901);
    float _997 = _983 * _985;
    float _999 = fma(_685, _989, _685);
    float _1001 = floor(_981);
    bool _1003 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1005 = isnan(1.0);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_989, _955, _955);
    float _1015 = _991 * _995;
    float _1017 = _997 * (-2.0);
    float _1019 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1013);
    float _1021 = _1015 * (-2.0);
    float _1023 = floor(_993);
    float _1025 = fma(_987, 0.5, 0.5);
    float _1027 = fma(_999, _879, _1019);
    float _1029 = fma(_705, _1017, _705);
    float _1031 = fma(_1017, _957, _957);
    float _1033 = fma(_1021, _953, _953);
    float _1035 = fma(_667, _1021, _667);
    float _1037 = _1027 * 0.15915493667125701904296875;
    float _1039 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1031);
    float _1041 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1033);
    float _1043 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[118].x, _939);
    float _1045 = fma(_1029, _879, _1039);
    float _1047 = fma(_1035, _879, _1041);
    float _1049 = _1037 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _1047 * 0.15915493667125701904296875;
    float _1055 = _1045 * 0.15915493667125701904296875;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1059 = _1037 * 6.283185482025146484375;
    float _1061 = cos(_1059);
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_1023;
    float _1067 = _993 + _1065;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_231));
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1053 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1053 * 6.283185482025146484375;
    float _1097 = cos(_1095);
    float _1099 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _755 * _1071;
    out.m_86.x = _1075;
    out.m_86.y = _1091;
    out.m_86.z = _1093;
    out.m_86.w = _1087;
    float _1105 = as_type<float>(_231) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1107 = _1055 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = -_1001;
    float _1113 = _981 + _1111;
    float _1115 = _1079 * _1061;
    out.m_88.x = _1089;
    out.m_88.y = _1099;
    out.m_88.z = _1101;
    out.m_88.w = _1057;
    float _1117 = _1079 * _1051;
    float _1119 = _1055 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    float _1123 = _1097 * _1061;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_245));
    float _1127 = fma(_1113, 2.0, -1.0);
    float _1129 = as_type<float>(_245) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1131 = floor(_1025);
    float _1133 = _1061 * _1109;
    float _1135 = _1097 * _1051;
    float _1137 = _1097 * _1109;
    float _1139 = _1079 * _1109;
    float _1141 = _1051 * _1109;
    float _1143 = _747 * _1125;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = fma(_1121, _1123, _1117);
    float _1153 = fma(_1121, _1117, _1123);
    float _1155 = fma(_1067, 2.0, -1.0);
    float _1157 = -_1135;
    float _1159 = fma(_1121, _1115, _1157);
    float _1161 = -_1115;
    float _1163 = fma(_1121, _1135, _1161);
    float _1165 = -_1121;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1145);
    float _1169 = -_1121;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1147);
    float _1173 = -_1121;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1177 = -_1103;
    float _1179 = _1121 * _1177;
    float _1181 = _1155 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1183 = -_1131;
    float _1185 = _1025 + _1183;
    float _1187 = _1127 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1189 = fma(_1133, _1143, _1179);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1195 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1197 = _1137 * _1103;
    float _1199 = _1139 * _1103;
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1191);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1193);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1195);
    float _1207 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1209 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1211 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = fma(_1151, _1143, _1197);
    float _1215 = fma(_1159, _1143, _1199);
    float _1217 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1167);
    float _1219 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1221 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1223 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1225 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1227 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1207);
    float _1229 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1209);
    float _1231 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1233 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1235 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1171);
    float _1237 = fma(_1141, _1219, _1189);
    float _1239 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1221);
    float _1241 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1223);
    float _1243 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1225);
    float _1245 = _1105 * _1217;
    float _1247 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1227);
    float _1249 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1229);
    float _1251 = _1105 * _1231;
    float _1253 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1233);
    float _1255 = _1105 * _1235;
    float _1257 = fma(_1129, _1247, _1245);
    float _1259 = fma(_1163, _1219, _1213);
    float _1261 = fma(_1129, _1253, _1251);
    float _1263 = fma(_1129, _1249, _1255);
    float _1265 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1239);
    float _1267 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1241);
    float _1269 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1271 = fma(_1153, _1219, _1215);
    float _1273 = _1265 + _1257;
    float _1275 = _1267 + _1263;
    float _1277 = _1269 + _1261;
    float _1279 = fma(_1185, 2.0, -1.0);
    float _1281 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1283 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1285 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_90.x = _1273;
    out.m_90.y = _1275;
    out.m_90.z = _1277;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1289 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1281);
    float _1291 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1283);
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1285);
    float _1295 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1203);
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1201);
    float _1299 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1205);
    float _1301 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1289);
    float _1303 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1291);
    float _1305 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1293);
    float _1307 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1309 = _1297 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1311 = _1299 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1313 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1315 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1319 = _1313 + _1309;
    float _1321 = _1315 + _1307;
    float _1323 = _1317 + _1311;
    float _1325 = _1287;
    float _1327 = _1233;
    float _1329 = _1271;
    float _1331 = _1129;
    float _1333 = _1271;
    float _1335 = _1315;
    float _1337 = _1129;
    float _1339 = _1297;
    float _1341 = _1155;
    float _1343 = _1279;
    float _1345 = _1127;
    int _1347 = as_type<int>(_987);
    float _1357;
    float _1359;
    float _1361;
    float _1363;
    if (!_1011)
    {
        bool _1349 = _1307 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1351 = !_1349;
        _1353 = _1351;
        if (!_1353)
        {
            float _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1357 = _1355;
            _1359 = 0.0;
            _1361 = 0.0;
            _1363 = 0.0;
            _1365 = true;
        }
    }
    if ((!_1365) || _1353)
    {
        bool _1401;
        if (!_1353)
        {
            bool _1367 = _1307 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1369 = isnan(_1307);
            bool _1371 = _1367 || _1369;
            bool _1373 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1375 = _1371 || _1373;
            bool _1377 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1379 = !_1375;
            bool _1381 = _1377 && _1379;
            bool _1383 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1335 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1381)
            {
                _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1385 = _1325;
            float _1387 = _1385;
            if (_1381)
            {
                _1327 = 0.0;
            }
            float _1389 = _1327;
            _1359 = _1389;
            if (_1381)
            {
                _1329 = 0.0;
            }
            float _1391 = _1329;
            _1333 = _1391;
            _1361 = _1391;
            if (_1381)
            {
                float _1393 = _1385 * 5.0;
                _1387 = _1393;
            }
            float _1395 = _1387;
            _1357 = _1395;
            if (_1381)
            {
                _1331 = 0.0;
            }
            float _1397 = _1331;
            bool _1399 = !_1375;
            _1401 = _1399 && _1383;
            _1337 = _1397;
            _1363 = _1397;
        }
        if ((!_1401) || _1353)
        {
            _1353 = false;
            float _1403 = _1333;
            float _1405 = _1335;
            float _1407 = _1337;
            bool _1409 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1411 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1413 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1415 = _1281;
            float _1417 = _1405;
            float _1419 = _1407;
            _1357 = _1323;
            _1359 = _1319;
            if (_1409)
            {
                float _1421 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1415 = _1421;
            }
            float _1423 = _1415;
            if (_1409)
            {
                float _1425 = abs(_1127);
                float _1427 = -_1425;
                float _1429 = _1427 + 1.0;
                _1339 = _1429;
            }
            float _1431 = _1339;
            if (_1411)
            {
                float _1433 = abs(_1155);
                float _1435 = -_1433;
                float _1437 = _1435 + 1.0;
                _1341 = _1437;
            }
            float _1439 = _1341;
            if (!_1409)
            {
                _1417 = 1.0;
            }
            float _1441 = _1417;
            float _1443 = _1441;
            if (_1413)
            {
                float _1445 = abs(_1279);
                float _1447 = -_1445;
                float _1449 = _1447 + 1.0;
                _1343 = _1449;
            }
            float _1451 = _1343;
            if (!_1411)
            {
                _1345 = 1.0;
            }
            float _1453 = _1345;
            float _1455 = _1453;
            if (!_1413)
            {
                _1419 = 1.0;
            }
            float _1457 = _1419;
            float _1459 = _1313;
            float _1461 = _1457;
            if (_1411)
            {
                float _1463 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1459 = _1463;
            }
            float _1465 = _1459;
            float _1467 = _1403;
            if (_1413)
            {
                float _1469 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1467 = _1469;
            }
            float _1471 = _1467;
            if (_1409)
            {
                float _1473 = _1431 * _1423;
                float _1475 = precise::clamp(_1473, 0.0, 1.0);
                _1443 = _1475;
            }
            float _1477 = _1443;
            if (_1411)
            {
                float _1479 = _1439 * _1465;
                float _1481 = precise::clamp(_1479, 0.0, 1.0);
                _1455 = _1481;
            }
            float _1483 = _1455;
            float _1485 = _1477 * _1483;
            if (_1413)
            {
                float _1487 = _1451 * _1471;
                float _1489 = precise::clamp(_1487, 0.0, 1.0);
                _1461 = _1489;
            }
            float _1491 = _1461;
            float _1493 = _1485 * _1491;
            _1361 = _1321;
            _1363 = _1493;
        }
    }
    _1365 = false;
    float _1495 = _1357;
    float _1497 = _1359;
    float _1499 = _1361;
    float _1501 = _1363;
    float _1503 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1505 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1503);
    float _1507 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1505);
    float _1509 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1511 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1513 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1509);
    float _1515 = 1.0 / _1511;
    float _1517 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1513);
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1521 = _1519 + _1511;
    float _1523 = _1521 * _1515;
    float _1525 = _1523 * 0.5;
    float _1527 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1531 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1529);
    float _1533 = _1307 + _1527;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1537 = 1.0 / _1531;
    float _1539 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1541 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1535);
    float _1543 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1539);
    float _1545 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1541);
    float _1547 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1543);
    float _1549 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1551 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1555 = _1537 * _1553;
    float _1557 = trunc(_1551);
    int _1559 = int(_1557);
    bool _1561 = _1555 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1563 = _1555 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1565 = !_1561;
    int _1567 = _1565 ? 0 : 1;
    int _1569 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1571 = _1559 + _1569;
    int _1573 = _1571 + 1;
    int _1575 = 2;
    float _1577 = _1499;
    float _1579 = _1497;
    float _1581 = _1495;
    float _1583 = _1501;
    if (!_1561)
    {
        _1575 = 1;
    }
    int _1585 = _1575;
    int _1587 = _1585;
    if (!_1563)
    {
        _1587 = _1567;
    }
    int _1589 = _1587;
    float _1591 = trunc(_1549);
    int _1593 = int(_1591);
    int _1595 = _1589 << 6;
    int _1597 = _1595 + 96;
    uint _1600 = uint(int(uint(_1597) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    int _1616 = _1595 + 104;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
    int _1622 = int(_1618) & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    int _1626 = int(_1618) + 1;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    int _1630 = _1626 & 3;
    float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
    int _1634 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1636 = _1593 + _1634;
    int _1638 = _1636 + 1;
    bool _1640 = _1638 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1642 = _1595 + 48;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    int _1660 = _1638 | _1573;
    bool _1662 = _1660 < 0;
    bool _1664 = _1662 || _1640;
    int _1666 = _1595 + 64;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c15)._m0[int(_1678)][_1680];
    bool _1684 = _1573 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1686 = _1684 || _1664;
    int _1688 = _1595 + 56;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
    uint _1706 = uint(_1638);
    float _1708 = as_type<float>(_1589);
    if (!_1686)
    {
        int _1710 = _1573 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1712 = _1710 + _1638;
        _1706 = uint(_1712);
    }
    uint _1714 = _1706;
    int _1716 = _1595 + 72;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
    int _1722 = int(_1718) & 3;
    float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
    int _1726 = int(_1718) + 1;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    int _1730 = _1726 & 3;
    float _1732 = (*spvDescriptorSet0.vp_c15)._m0[int(_1728)][_1730];
    if (!_1686)
    {
        uint _1734 = uint(int(uint(int(_1714)) >> uint(2)));
        _1347 = int(_1734);
    }
    int _1736 = _1347;
    float _1738 = _1533 * _1614;
    int _1740 = as_type<int>(_1614);
    int _1742 = as_type<int>(_1738);
    if (!_1686)
    {
        int _1744 = int(_1714) << 2;
        _1740 = _1744;
    }
    int _1746 = _1740;
    float _1748 = fma(_1309, _1606, _1738);
    if (!_1686)
    {
        int _1750 = 12 & _1746;
        _1742 = _1750;
    }
    int _1752 = _1742;
    float _1754 = fma(_1311, _1624, _1748);
    if (!_1686)
    {
        int _1756 = _1736 << 4;
        int _1758 = _1756 + _1752;
        _759 = _1758;
    }
    int _1760 = _759;
    float _1762 = _1754 + _1632;
    float _1764 = _599;
    if (!_1686)
    {
        int _1766 = _1760 + 400;
        uint _1768 = uint(int(uint(_1766) >> uint(2)));
        uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
        int _1772 = int(_1768) & 3;
        float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
        _1764 = _1774;
    }
    float _1776 = _1764;
    float _1778 = _1533 * _1658;
    float _1780 = 1.0 / _1762;
    float _1782 = fma(_1309, _1650, _1778);
    int _1784 = _1595 + 80;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c15)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c15)._m0[int(_1796)][_1798];
    float _1802 = _1533 * _1682;
    float _1804 = fma(_1309, _1674, _1802);
    int _1806 = _1595 + 88;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c15)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    float _1824 = _1802;
    float _1826 = _1782;
    if (!_1686)
    {
        float _1828 = floor(_1551);
        _1824 = _1828;
    }
    float _1830 = _1824;
    float _1832 = fma(_1311, _1696, _1782);
    float _1834 = _1832 + _1704;
    float _1836 = fma(_1311, _1724, _1804);
    float _1838 = _1834 * _1780;
    float _1840 = _1804;
    float _1842 = _1830;
    float _1844 = _1838;
    if (!_1686)
    {
        float _1846 = floor(_1549);
        _1840 = _1846;
    }
    float _1848 = _1840;
    float _1850 = _1836 + _1732;
    float _1852 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1854 = _1838 >= 0.0;
    if (!_1686)
    {
        float _1856 = -_1830;
        float _1858 = _1551 + _1856;
        _1842 = _1858;
    }
    float _1860 = _1842;
    float _1862 = _1850 * _1780;
    float _1864 = floor(_1852);
    bool _1866 = _1838 <= 1.0;
    bool _1868 = _1866 && _1854;
    float _1870 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1872 = _1862 >= 0.0;
    bool _1874 = _1872 && _1868;
    float _1876 = floor(_1870);
    bool _1878 = _1862 <= 1.0;
    bool _1880 = _1878 && _1874;
    float _1882 = _1848;
    if (!_1686)
    {
        float _1884 = -_1848;
        float _1886 = _1549 + _1884;
        _1882 = _1886;
    }
    float _1888 = _1882;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_1686)
    {
        float _1892 = rint(_1776);
        float _1894 = precise::max(_1892, 0.0);
        uint _1896 = uint(_1894);
        uint _1898 = clamp(_1896, 0u, 65535u);
        _1890 = as_type<float>(_1898);
    }
    float _1900 = _1890;
    float _1902 = _1533 * _1800;
    float _1904 = fma(_1309, 6.2500002968590706586837768554688e-05, 0.5);
    if (_1880)
    {
        float _1906 = float(_1589);
        _1826 = _1906;
    }
    float _1908 = _1826;
    float _1910 = fma(_1309, _1792, _1902);
    float _1912 = fma(_1311, 6.2500002968590706586837768554688e-05, 0.5);
    float _1914 = -_1876;
    float _1916 = _1870 + _1914;
    float _1918 = fma(_1311, _1814, _1910);
    float _1920 = _1908;
    float _1922 = _1916;
    if (_1880)
    {
        float _1924 = rint(_1908);
        float _1926 = precise::max(_1924, 0.0);
        uint _1928 = uint(_1926);
        uint _1930 = clamp(_1928, 0u, 65535u);
        _1920 = as_type<float>(_1930);
    }
    float _1932 = _1920;
    float _1934 = -_1864;
    float _1936 = _1852 + _1934;
    float _1938 = _1918 + _1822;
    float2 _6498 = float2(_1904, _1912);
    float _1940 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_6498, float2(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_6498, float2(0.0), isnan(_6498)), level(0.0)).x;
    float _1942 = _1938 * _1780;
    float2 _6511 = float2(_1936, _1916);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6511, float2(0.0), isnan(_6511)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6511, float2(0.0), isnan(_6511)), level(0.0)).x;
    float _1946 = _1900;
    if (!_1686)
    {
        float3 _6526 = float3(_1888, _1860, float(as_type<int>(_1900)));
        float3 _6530 = select(_6526, float3(0.0), isnan(_6526));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6530.xy, uint(rint(_6530.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6530.xy, uint(rint(_6530.z)), level(0.0)).x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = _1932;
    if (_1880)
    {
        float3 _6545 = float3(_1838, _1862, float(as_type<int>(_1932)));
        float3 _6547 = select(_6545, float3(0.0), isnan(_6545));
        float _1954 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6547.xy, uint(rint(_6547.z)), _1942, level(0.0));
        _1952 = _1954;
    }
    float _1956 = _1952;
    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1960 = _1495 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1964 = _1497 + _1962;
    float _1966 = _1960 * _1960;
    float _1968 = fma(_1964, _1964, _1966);
    float _1970 = sqrt(_1968);
    bool _1972 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1974 = !_1972;
    float _1976 = _1970;
    float _1978 = _1968;
    float _1980 = _1960;
    float _1982 = _1964;
    float _1984 = _1950;
    if (!_1974)
    {
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1990 = _1970 + _1988;
        float _1992 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1994 = rsqrt(_1968);
        float _1996 = _1990 * _1986;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = _1998 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        float _2004 = _1998 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        float _2008 = _2002 + (-1.0);
        float _2010 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2012 = fma(_2006, _1992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2014 = fma(_2002, _1499, _2010);
        float _2016 = _1994 * _2012;
        float _2018 = fma(_1964, _2016, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2020 = fma(_1960, _2016, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1577 = _2014;
        _1579 = _2018;
        _1581 = _2020;
        _1976 = _2002;
    }
    float _2022 = _1577;
    float _2024 = _1579;
    float _2026 = _1581;
    float _2028 = _1976;
    float _2030 = _1940 * 2000.0;
    bool _2032 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2034 = isnan(0.5);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2040 = _2036 || _2038;
    bool _2042 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2044 = isnan(0.5);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = _1307 >= _2030;
    bool _2054 = isnan(_1307);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(_2030);
    bool _2060 = _2056 || _2058;
    float _2062 = _2028;
    if (_2060)
    {
        _1708 = _2022;
    }
    float _2064 = _1708;
    float _2066 = _2064;
    if (!_2060)
    {
        _2066 = 0.0;
    }
    float _2068 = _2066;
    float _2070 = _2068;
    if (_2060)
    {
        _1978 = _2024;
    }
    float _2072 = _1978;
    float _2074 = _2072;
    if (!_2060)
    {
        _2062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2076 = _2062;
    float _2078 = -_1307;
    float _2080 = _2078 + _2068;
    if (!_2060)
    {
        _2074 = 0.0;
    }
    float _2082 = _2074;
    float _2084 = _2082;
    if (_2060)
    {
        _1980 = _2026;
    }
    float _2086 = _1980;
    float _2088 = _2086;
    if (!_2060)
    {
        float _2090 = _2076 * 5.0;
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = _2080 * _2080;
    float _2096 = -_1309;
    float _2098 = _2096 + _2082;
    float _2100 = -_1311;
    float _2102 = _2100 + _2092;
    float _2104 = fma(_2098, _2098, _2094);
    float _2106 = fma(_2102, _2102, _2104);
    float _2108 = sqrt(_2106);
    bool _2110 = _2108 > 0.0;
    bool _2112 = !_2110;
    float _2114 = _2092;
    float _2116 = _2098;
    float _2118 = _2106;
    if (!_2112)
    {
        float _2120 = _291 * _291;
        float _2122 = fma(_317, _317, _2120);
        float _2124 = fma(_319, _319, _2122);
        float _2126 = rsqrt(_2106);
        float _2128 = sqrt(_2124);
        float _2130 = _2080 * _2126;
        float _2132 = _2102 * _2126;
        bool _2134 = _2128 > 0.0;
        float _2136 = _2098 * _2126;
        bool _2138 = !_2134;
        if (!_2138)
        {
            float _2140 = rsqrt(_2124);
            float _2142 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2144 = _291 * _2140;
            float _2146 = _317 * _2140;
            float _2148 = _319 * _2140;
            float _2150 = _2130 * _2144;
            float _2152 = fma(_2136, _2146, _2150);
            float _2154 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2156 = fma(_2132, _2148, _2152);
            float _2158 = _2156 * _2154;
            float _2160 = fma(_317, _2158, _2082);
            float _2162 = fma(_291, _2158, _2068);
            float _2164 = fma(_319, _2158, _2092);
            _2114 = _2164;
            _2084 = _2160;
            _2070 = _2162;
            _2116 = _2152;
            _2118 = _2146;
        }
    }
    float _2166 = _2114;
    float _2168 = _2084;
    float _2170 = _2070;
    float _2172 = _2116;
    float _2174 = _2118;
    float _2176 = _2172;
    float _2178 = _2170;
    float _2180 = _2168;
    float _2182 = _2166;
    float _2184 = _2174;
    if (!_2040)
    {
        float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2188 = _1307 + _2186;
        float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2192 = _1309 + _2190;
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2196 = -_1311;
        float _2198 = _2196 + _2166;
        float _2200 = _2188 * _2188;
        float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2204 = _1311 + _2202;
        float _2206 = fma(_2192, _2192, _2200);
        float _2208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2210 = fma(_2204, _2204, _2206);
        float _2212 = sqrt(_2210);
        float _2214 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2216 = precise::min(_2212, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2218 = _2216 * _2208;
        float _2220 = -_1309;
        float _2222 = _2220 + _2168;
        float _2224 = _2214 * _2218;
        float _2226 = -_1307;
        float _2228 = _2226 + _2170;
        float _2230 = fma(_2222, _2224, _1309);
        float _2232 = fma(_2228, _2224, _1307);
        float _2234 = fma(_2198, _2224, _1311);
        _2176 = _2208;
        _2178 = _2232;
        _2180 = _2230;
        _2182 = _2234;
        _2184 = _2222;
    }
    float _2236 = _2176;
    float _2238 = _2178;
    float _2240 = _2180;
    float _2242 = _2182;
    float _2244 = _2184;
    float _2246 = _2244;
    float _2248 = _2236;
    if (_2050)
    {
        _1982 = 1.0;
    }
    float _2250 = _1982;
    float _2252 = _2250;
    if (_1686)
    {
        _1844 = 1.0;
    }
    float _2254 = _1844;
    float _2256 = _2254;
    if (_2050)
    {
        _2246 = 1.0;
    }
    float _2258 = _2246;
    float _2260 = _2258;
    if (!_2050)
    {
        float _2262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2270 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2268;
        float _2272 = _2264 * 6.283185482025146484375;
        float _2274 = cos(_2272);
        float _2276 = _2266 * 0.15915493667125701904296875;
        float _2278 = _2264 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = 1.0 / _2274;
        float _2284 = _2276 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = _2276 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = 1.0 / _2270;
        float _2298 = 1.0 / _2294;
        float _2300 = _2292 * _2298;
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2304 = fma(_1555, _2300, _2302);
        float _2306 = _2304 * _2296;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2248 = _2282;
        _2260 = _2308;
    }
    float _2310 = _2248;
    float _2312 = _2260;
    float _2314 = _2310;
    if (!_2050)
    {
        float _2316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2318 = _2316 * 0.15915493667125701904296875;
        float _2320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2322 = _2318 * 6.283185482025146484375;
        float _2324 = cos(_2322);
        float _2326 = _2320 * 0.15915493667125701904296875;
        float _2328 = _2318 * 6.283185482025146484375;
        float _2330 = sin(_2328);
        float _2332 = 1.0 / _2324;
        float _2334 = _2326 * 6.283185482025146484375;
        float _2336 = cos(_2334);
        float _2338 = _2330 * _2332;
        float _2340 = _2326 * 6.283185482025146484375;
        float _2342 = sin(_2340);
        float _2344 = _2336 * _2338;
        float _2346 = 1.0 / _2344;
        float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2350 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2348;
        float _2352 = 1.0 / _2350;
        float _2354 = _2342 * _2346;
        float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2358 = fma(_1555, _2354, _2356);
        float _2360 = _2358 * _2352;
        float _2362 = precise::clamp(_2360, 0.0, 1.0);
        float _2364 = -_2362;
        float _2366 = _2364 + 1.0;
        _2314 = _2326;
        _2252 = _2366;
    }
    float _2368 = _2314;
    float _2370 = _2252;
    float _2372 = _2368;
    if (!_1686)
    {
        int _2374 = int(_1714) << 4;
        int _2376 = _2374 + 2048;
        uint _2378 = uint(int(uint(_2376) >> uint(2)));
        uint _2380 = uint(int(uint(int(_2378)) >> uint(2)));
        int _2382 = int(_2378) & 3;
        float _2384 = (*spvDescriptorSet0.vp_c15)._m0[int(_2380)][_2382];
        int _2386 = int(_2378) + 1;
        uint _2388 = uint(int(uint(_2386) >> uint(2)));
        int _2390 = _2386 & 3;
        float _2392 = (*spvDescriptorSet0.vp_c15)._m0[int(_2388)][_2390];
        int _2394 = _2376 + 8;
        uint _2396 = uint(int(uint(_2394) >> uint(2)));
        uint _2398 = uint(int(uint(int(_2396)) >> uint(2)));
        int _2400 = int(_2396) & 3;
        float _2402 = (*spvDescriptorSet0.vp_c15)._m0[int(_2398)][_2400];
        int _2404 = int(_2396) + 1;
        uint _2406 = uint(int(uint(_2404) >> uint(2)));
        int _2408 = _2404 & 3;
        float _2410 = (*spvDescriptorSet0.vp_c15)._m0[int(_2406)][_2408];
        float _2412 = _1533 * _2392;
        float _2414 = fma(_1309, _2384, _2412);
        float _2416 = fma(_1311, _2402, _2414);
        float _2418 = _2416 + _2410;
        float _2420 = precise::clamp(_2418, 0.0, 1.0);
        float _2422 = -_2420;
        float _2424 = _2422 + _1950;
        float _2426 = fma(_2424, 500.0, 1.5);
        float _2428 = exp2(_2426);
        float _2430 = 0.0 + _2428;
        float _2432 = precise::clamp(_2430, 0.0, 1.0);
        _2256 = _2432;
    }
    float _2434 = _2256;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2438 = _2238 + _2436;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2442 = _2240 + _2440;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2446 = _2242 + _2444;
    float _2448 = _2438 * _2438;
    float _2450 = fma(_2442, _2442, _2448);
    float _2452 = fma(_2446, _2446, _2450);
    float _2454 = rsqrt(_2452);
    float _2456 = sqrt(_2452);
    float _2458 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2460 = _2442 * _2458;
    float _2462 = _2446 * _2458;
    float _2464 = _2460 * _2460;
    float _2466 = _2462 * _2462;
    float _2468 = _2464 + _2466;
    float _2470 = sqrt(_2468);
    bool _2472 = _2470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2476 = _2470 + _2474;
    float _2478 = _2454;
    float _2480 = _2476;
    float _2482 = _2438;
    float _2484 = _2468;
    if (_2472)
    {
        float _2486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2478 = _2486;
    }
    float _2488 = _2478;
    if (_2472)
    {
        float _2490 = rsqrt(_2468);
        _2372 = _2490;
    }
    float _2492 = _2372;
    float _2494 = _2492;
    if (_2472)
    {
        float _2496 = _2476 * _2488;
        _2480 = _2496;
    }
    float _2498 = _2480;
    if (_2472)
    {
        float _2500 = _2498 * 0.15915493667125701904296875;
        _1984 = _2500;
    }
    float _2502 = _1984;
    float _2504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2506 = _2446;
    if (_2472)
    {
        float _2508 = _2502 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        _2506 = _2510;
    }
    float _2512 = _2506;
    float _2514 = precise::max(0.0, _2504);
    float _2516 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2518 = _2514;
    if (_2472)
    {
        float _2520 = _2502 * 6.283185482025146484375;
        float _2522 = cos(_2520);
        _2516 = _2522;
    }
    float _2524 = _2516;
    float _2526 = -_2458;
    float _2528 = -_2514;
    float _2530 = fma(_2438, _2526, _2528);
    if (_2472)
    {
        float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2482 = _2532;
    }
    float _2534 = _2482;
    float _2536 = _2534;
    float _2538 = _2512;
    if (_2472)
    {
        float _2540 = fma(_2512, _2534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2536 = _2540;
    }
    float _2542 = _2536;
    float _2544 = _2542;
    if (!_2472)
    {
        _2538 = _2530;
    }
    float _2546 = _2538;
    float _2548 = _2546;
    if (_2472)
    {
        float _2550 = _2492 * _2542;
        _1922 = _2550;
    }
    float _2552 = _1922;
    if (!_2472)
    {
        _2494 = _2460;
    }
    float _2554 = _2494;
    float _2556 = _2554;
    float _2558 = _2524;
    if (_2472)
    {
        float _2560 = _2524 + (-1.0);
        _2518 = _2560;
    }
    float _2562 = _2518;
    float _2564 = _2562;
    if (_2472)
    {
        float _2566 = _2460 * _2552;
        _2556 = _2566;
    }
    float _2568 = _2556;
    if (!_2472)
    {
        _2544 = _2464;
    }
    float _2570 = _2544;
    float _2572 = _2570;
    if (_2472)
    {
        float _2574 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2484 = _2574;
    }
    float _2576 = _2484;
    if (!_2472)
    {
        _2564 = _2462;
    }
    float _2578 = _2564;
    float _2580 = _2578;
    if (_2472)
    {
        float _2582 = _2462 * _2552;
        _2580 = _2582;
    }
    float _2584 = _2580;
    if (_2472)
    {
        float _2586 = _2568 * _2568;
        _2572 = _2586;
    }
    float _2588 = _2572;
    if (_2472)
    {
        float _2590 = fma(_2530, _2524, _2576);
        _2548 = _2590;
    }
    float _2592 = _2548;
    if (!_2472)
    {
        _2558 = _2466;
    }
    float _2594 = _2558;
    float _2596 = _2594;
    if (_2472)
    {
        float _2598 = _2584 * _2584;
        _2596 = _2598;
    }
    float _2600 = _2596;
    float _2602 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2604 = fma(_2592, _2592, _2588);
    float _2606 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2608 = _2604 + _2600;
    float _2610 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2606);
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2614 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2612);
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2620 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2622 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2610);
    float _2624 = rsqrt(_2608);
    float _2626 = -_2616;
    float _2628 = _2626 + 1.0;
    float _2630 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2632 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2618);
    float _2634 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2636 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2620);
    float _2638 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2630);
    float _2640 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2632);
    float _2642 = abs(_2628);
    float _2644 = log2(_2642);
    float _2646 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2636);
    float _2648 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2638);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2652 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2654 = _2646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2656 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2660 = _2624 * _2568;
    float _2662 = _2624 * _2592;
    float _2664 = _2624 * _2584;
    float _2666 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2658);
    float _2668 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2670 = -_2652;
    float _2672 = fma(_2670, _2602, 1.0);
    float _2674 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2666);
    float _2676 = -_2668;
    float _2678 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2676);
    float _2680 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2682 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2684 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2674);
    float _2686 = -_2664;
    float _2688 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2678);
    float _2690 = log2(_2672);
    float _2692 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2694 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2682);
    float _2696 = fma(_2688, -0.5, 0.5);
    float _2698 = fma(_2688, 0.5, 0.5);
    float _2700 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2692);
    float _2702 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2694);
    float _2704 = _2662 + 1.0;
    float _2706 = 1.0 / _2684;
    float _2708 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2700);
    float _2710 = fma(_2698, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2712 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2708);
    float _2714 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2702);
    float _2716 = fma(_2698, _2710, -0.212114393711090087890625);
    float _2718 = exp2(_2680);
    float _2720 = _2690 * 0.693147182464599609375;
    float _2722 = fma(_2698, _2716, 1.570728778839111328125);
    float _2724 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2726 = sqrt(_2696);
    float _2728 = _2712 * _2706;
    float _2730 = _2714 * _2706;
    float _2732 = fma(_2730, -0.5, 0.5);
    float _2734 = -_2662;
    float _2736 = fma(_2718, _2704, _2734);
    float _2738 = fma(_2736, 0.5, 0.5);
    float _2740 = _2726 * 0.636619746685028076171875;
    float _2742 = fma(_2728, 0.5, 0.5);
    float _2744 = -_2722;
    float _2746 = fma(_2740, _2744, 1.0);
    float3 _7753 = float3(_2742, _2732, _2724);
    float _2748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7753, float3(0.0), isnan(_7753)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7753, float3(0.0), isnan(_7753)), level(0.0)).x;
    float3 _7762 = float3(_2742, _2732, _2724);
    float4 _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7762, float3(0.0), isnan(_7762)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7762, float3(0.0), isnan(_7762)), level(0.0)).xyzw;
    float _2753 = _2751.x;
    float _2755 = _2751.y;
    float _2757 = _2751.z;
    float _2759 = _2751.w;
    float2 _7778 = float2(_2746, _2738);
    float3 _2763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7778, float2(0.0), isnan(_7778)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7778, float2(0.0), isnan(_7778)), level(0.0)).xyz;
    float _2765 = _2763.x;
    float _2767 = _2763.y;
    float _2769 = _2763.z;
    float _2771 = abs(_1555);
    float _2773 = log2(_2771);
    float _2775 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2777 = -_1944;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2775);
    float _2783 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_92.y = 1.0;
    float _2785 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2787 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2789 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2791 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2783);
    float _2793 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2785);
    float _2795 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2787);
    float _2797 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2789);
    float _2799 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2791);
    float _2801 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2803 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2793);
    float _2805 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2795);
    float _2807 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2781);
    float _2809 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2797);
    float _2811 = _2799 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2813 = exp2(_2801);
    float _2815 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2807);
    float _2817 = _2803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2819 = _2805 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2821 = _2809 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2823 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2825 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2827 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _2829 = _1555 <= 8000.0;
    bool _2831 = isnan(_1555);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan(8000.0);
    bool _2837 = _2833 || _2835;
    float _2839 = float(_2837);
    float _2841 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2823);
    float _2843 = -_319;
    float _2845 = _2843 + _2242;
    float _2847 = _2817;
    float _2849 = _2714;
    float _2851 = _2684;
    if (!_2060)
    {
        _1583 = 0.0;
    }
    float _2853 = _1583;
    float _2855 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2841);
    float _2857 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2859 = precise::clamp(_2857, 0.0, 1.0);
    float _2861 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2863 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2855);
    float _2865 = fma(_2859, -2.0, 3.0);
    float _2867 = _2859 * _2859;
    float _2869 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2861);
    float _2871 = _2867 * _2865;
    float _2873 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2875 = -_2871;
    float _2877 = _2875 + 1.0;
    float _2879 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2873);
    float _2881 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2825);
    float _2883 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2871);
    float _2885 = _2827 + _2879;
    float _2887 = _2815 + _2684;
    if (!_1880)
    {
        _2847 = 1.0;
    }
    float _2889 = _2847;
    float _2891 = _2839 * _2883;
    float _2893 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2885);
    float _2895 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2897 = _2887 * 0.5;
    float _2899 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2901 = 1.0 / _2893;
    float _2903 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2905 = _2889;
    if (_1880)
    {
        bool _2907 = _1956 >= _1942;
        bool _2909 = isnan(_1956);
        bool _2911 = _2907 || _2909;
        bool _2913 = isnan(_1942);
        bool _2915 = _2911 || _2913;
        float _2917 = float(_2915);
        _2905 = _2917;
    }
    float _2919 = _2905;
    out.m_94.z = _2897;
    out.m_94.w = _2684;
    float _2921 = _2779 * _2899;
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = _2903 + _2881;
    float _2927 = -_317;
    float _2929 = _2927 + _2240;
    float _2931 = _2919 * _2434;
    float _2933 = exp2(_2895);
    float _2935 = -_2923;
    float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _2712;
    out.gl_Position.y = _2714;
    out.gl_Position.z = _2815;
    out.gl_Position.w = _2684;
    float _2939 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2941 = -_291;
    float _2943 = _2941 + _2238;
    float _2945 = -_2931;
    float _2947 = fma(_2945, _2937, 1.0);
    float _2949 = precise::clamp(_2947, 0.0, 1.0);
    float _2951 = _2863 * _2901;
    float _2953 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2955 = _2949 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2957 = _2951 > 0.0;
    out.m_92.x = _2955;
    float _2959 = -_2933;
    float _2961 = _2959 + 1.0;
    float _2963 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2925);
    bool _2965 = _2951 < 1.0;
    bool _2967 = _2965 && _2957;
    float _2969 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2953);
    float _2971 = _2961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2973 = _2939 + _2869;
    bool _2975 = _2728 > (-1.0);
    bool _2977 = _2975 && _2967;
    float _2979 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2969);
    float _2981 = -_2971;
    float _2983 = _2981 + 1.0;
    float _2985 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2973);
    bool _2987 = _2730 > (-1.0);
    bool _2989 = _2987 && _2977;
    float _2991 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2993 = _2963 * _2901;
    float _2995 = _2985 * _2901;
    bool _2997 = _2728 < 1.0;
    bool _2999 = _2997 && _2989;
    bool _3001 = _2730 < 1.0;
    bool _3003 = _3001 && _2999;
    float _3005 = _2971 * _2748;
    float _3007 = 1.0 / _2991;
    float _3009 = _2759 * _3005;
    float _3011 = _2769 * _3005;
    float _3013 = fma(_2765, _3009, _2753);
    float _3015 = fma(_2767, _3009, _2755);
    float _3017 = _2759 * _2983;
    float _3019 = fma(_2759, _3011, _2757);
    float _3021 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3023 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    out.m_96.x = _3013;
    out.m_96.y = _3015;
    out.m_96.z = _3019;
    out.m_96.w = _3017;
    float _3025 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3021);
    float _3027 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3023);
    float _3029 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3025);
    float _3031 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3027);
    float _3033 = _2312 * _2370;
    float _3035 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3037 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3039 = _3033 * _2853;
    float _3041 = _3035 * _3007;
    float _3043 = _3037 * _3007;
    float _3045 = _3039 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3047 = !_3003;
    float _3049 = _3041;
    float _3051 = _3045;
    float _3053 = _3007;
    float _3081;
    float _3083;
    if (!_3047)
    {
        float _3055 = -_2995;
        float _3057 = _2730 + _3055;
        float _3059 = -_2993;
        float _3061 = _2728 + _3059;
        float _3063 = -_3041;
        float _3065 = _2728 + _3063;
        float _3067 = -_3043;
        float _3069 = _2730 + _3067;
        float _3071 = _3057 * _3057;
        float _3073 = fma(_3061, _3061, _3071);
        float _3075 = sqrt(_3073);
        bool _3077 = _3075 > 0.0;
        bool _3079 = !_3077;
        _3053 = _3061;
        _3081 = _3073;
        _3083 = _3075;
        _3085 = _3079;
        if (!_3085)
        {
            float _3087 = _3069 * _3069;
            float _3089 = fma(_3065, _3065, _3087);
            float _3091 = rsqrt(_3073);
            float _3093 = sqrt(_3089);
            float _3095 = _3061 * _3091;
            float _3097 = _3057 * _3091;
            bool _3099 = _3093 > 0.0;
            bool _3101 = !_3099;
            _3049 = _3093;
            _3083 = _3091;
            _3085 = _3101;
            if (!_3085)
            {
                float _3103 = _747 * _2821;
                float _3105 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3107 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2827);
                float _3109 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2939);
                float _3111 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2903);
                float _3113 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3107);
                float _3115 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3109);
                float _3117 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3111);
                float _3119 = rsqrt(_3089);
                float _3121 = _3105 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3123 = 1.0 / _3113;
                float _3125 = _3069 * _3121;
                float _3127 = _3065 * _3121;
                float _3129 = _3125 * _3125;
                float _3131 = fma(_3127, _3127, _3129);
                float _3133 = _3069 * _3119;
                float _3135 = _3065 * _3119;
                float _3137 = _3115 * _3123;
                float _3139 = _3117 * _3123;
                float _3141 = sqrt(_3131);
                float _3143 = _3137 * _3137;
                float _3145 = fma(_3139, _3139, _3143);
                float _3147 = _3097 * _3133;
                float _3149 = fma(_3095, _3135, _3147);
                float _3151 = sqrt(_3145);
                float _3153 = precise::min(0.0, _3149);
                float _3155 = _2684 * _3153;
                float _3157 = fma(_3127, _3155, _2712);
                float _3159 = fma(_3125, _3155, _2714);
                float _3161 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3151);
                out.gl_Position.x = _3157;
                out.gl_Position.y = _3159;
                float _3163 = 1.0 / _3161;
                float _3165 = _3151 * _3163;
                out.m_92.y = _3165;
                _3049 = _3125;
                _2849 = _3159;
                _3053 = _3163;
                _3081 = _3161;
                _2851 = _3155;
                _3083 = _3157;
                _3085 = true;
            }
        }
    }
    else
    {
        float _3167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3167;
        _2849 = 0.0;
        _3051 = 0.0;
        _3081 = _3167;
        _3083 = 0.0;
    }
    _3085 = false;
    float _3169 = _3049;
    float _3171 = _2849;
    float _3173 = _3051;
    float _3175 = _3053;
    float _3177 = _3081;
    float _3179 = _2851;
    float _3181 = _3083;
    bool _3183 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3185 = isnan(_2456);
    bool _3187 = _3183 || _3185;
    bool _3189 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3191 = _3187 || _3189;
    float _3193 = _3175;
    float _3195 = _3169;
    float _3197 = _3179;
    float _3199 = _3177;
    float _3201 = _3171;
    float _3203 = _3181;
    if (!_3191)
    {
        _3193 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3205 = _3193;
    float _3207 = _3205;
    float _3209 = _3205;
    if (!_3191)
    {
        _3195 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3211 = _3195;
    float _3213 = _3211;
    float _3215 = _3211;
    if (!_3191)
    {
        _3197 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3217 = _3197;
    float _3219 = _3217;
    float _3221 = _3217;
    if (!_3191)
    {
        _3199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3223 = _3199;
    float _3225 = _3223;
    float _3227 = _3223;
    if (!_3191)
    {
        _3201 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3229 = _3201;
    float _3231 = _3229;
    float _3233 = _3229;
    if (!_3191)
    {
        _3203 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3235 = _3203;
    bool _3237 = !_3191;
    float _3239 = _3235;
    float _3241 = _3235;
    if (!_3237)
    {
        bool _3243 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3245 = isnan(_2456);
        bool _3247 = _3243 || _3245;
        bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3251 = _3247 || _3249;
        if (!_3251)
        {
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3255 = _2456 + _3253;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3259 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3257;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3265 = 1.0 / _3259;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3283 = _3255 * _3265;
            float _3285 = precise::clamp(_3283, 0.0, 1.0);
            float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3291 = fma(_3285, _3263, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3293 = fma(_3285, _3289, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3295 = fma(_3285, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3297 = fma(_3285, _3273, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3299 = fma(_3285, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3301 = fma(_3285, _3281, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3215 = _3295;
            _3233 = _3299;
            _3209 = _3291;
            _3227 = _3297;
            _3221 = _3293;
            _3241 = _3301;
            _3303 = true;
        }
        else
        {
            bool _3305 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3307 = isnan(_2456);
            bool _3309 = _3305 || _3307;
            bool _3311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3313 = _3309 || _3311;
            if (!_3313)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3315 = _3207;
            _3209 = _3315;
            if (!_3313)
            {
                _3213 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3317 = _3213;
            _3215 = _3317;
            if (!_3313)
            {
                _3219 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3319 = _3219;
            _3221 = _3319;
            if (!_3313)
            {
                _3225 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3321 = _3225;
            _3227 = _3321;
            if (!_3313)
            {
                _3231 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3323 = _3231;
            _3233 = _3323;
            if (!_3313)
            {
                _3239 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3325 = _3239;
            bool _3327 = !_3313;
            _3241 = _3325;
            if (!_3327)
            {
                bool _3329 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3331 = isnan(_2456);
                bool _3333 = _3329 || _3331;
                bool _3335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3337 = _3333 || _3335;
                if (!_3337)
                {
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3341 = _2456 + _3339;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3345 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3343;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3351 = 1.0 / _3345;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3369 = _3341 * _3351;
                    float _3371 = precise::clamp(_3369, 0.0, 1.0);
                    float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3377 = fma(_3371, _3349, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3379 = fma(_3371, _3375, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3381 = fma(_3371, _3355, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3383 = fma(_3371, _3359, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3385 = fma(_3371, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3387 = fma(_3371, _3367, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3215 = _3381;
                    _3233 = _3385;
                    _3209 = _3377;
                    _3227 = _3383;
                    _3221 = _3379;
                    _3241 = _3387;
                    _3303 = true;
                }
                else
                {
                    _3215 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3233 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3227 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3221 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3241 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3303 = false;
    float _3389 = _3215;
    float _3391 = _3233;
    float _3393 = _3209;
    float _3395 = _3227;
    float _3397 = _3221;
    float _3399 = _3241;
    float _3401 = fma(_1275, -0.5, 0.5);
    float _3403 = precise::clamp(_3401, 0.0, 1.0);
    float _3405 = -_3389;
    float _3407 = _3405 + _3391;
    float _3409 = _3173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3411 = -_3393;
    float _3413 = _3411 + _3395;
    float _3415 = fma(_3403, _3407, _3389);
    out.m_98.x = 0.0;
    float _3417 = -_3397;
    float _3419 = _3417 + _3399;
    float _3421 = fma(_3403, _3413, _3393);
    float _3423 = _3415 * 0.586610972881317138671875;
    out.m_63.x = _3409;
    bool _3425 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3427 = fma(_3403, _3419, _3397);
    float _3429 = fma(_3421, 0.298911988735198974609375, _3423);
    bool _3431 = _2312 > 0.0;
    bool _3433 = isnan(_2312);
    bool _3435 = _3431 || _3433;
    bool _3437 = isnan(0.0);
    bool _3439 = _3435 || _3437;
    float _3441 = fma(_3427, 0.114477999508380889892578125, _3429);
    bool _3443 = _2370 <= 0.0;
    bool _3445 = !_3439;
    bool _3447 = _3443 || _3445;
    float _3449 = -_3441;
    float _3451 = _3421 + _3449;
    float _3453 = -_3441;
    float _3455 = _3415 + _3453;
    float _3457 = -_3441;
    float _3459 = _3427 + _3457;
    float _3461 = fma(_3451, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    float _3463 = fma(_3455, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    float _3465 = fma(_3459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    bool _3467 = !_3425;
    if (!_3467)
    {
        float _3469 = -_2238;
        float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3473 = -_2240;
        float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3477 = -_2242;
        float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3481 = _3471 * _3471;
        float _3483 = fma(_3475, _3475, _3481);
        float _3485 = fma(_3479, _3479, _3483);
        float _3487 = sqrt(_3485);
        float _3489 = rsqrt(_3485);
        float _3491 = -_3487;
        float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3495 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3497 = precise::clamp(_3495, 0.0, 1.0);
        float _3499 = _3475 * _3489;
        float _3501 = _3471 * _3489;
        float _3503 = abs(_3497);
        float _3505 = log2(_3503);
        float _3507 = _3479 * _3489;
        float _3509 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3511 = _1275 * _3501;
        float _3513 = -_3501;
        float _3515 = -_3509;
        float _3517 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3515);
        float _3519 = fma(_1273, _3499, _3511);
        float _3521 = -_3507;
        float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3517);
        float _3525 = fma(_1277, _3507, _3519);
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3531 = _3523 + _3529;
        float _3533 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3537 = precise::clamp(_3535, 0.0, 1.0);
        float _3539 = exp2(_3533);
        float _3541 = _3539 * _3537;
        float _3543 = _3527 * _3541;
        float _3545 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3549 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3545;
        out.m_98.y = _3547;
        out.m_98.z = _3549;
    }
    out.m_100.x = _3461;
    out.m_100.y = _3463;
    out.m_100.z = _3465;
    if (!_3447)
    {
        return out;
    }
    float _3551 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3551;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3303 = false;
    bool _3085 = false;
    bool _1365 = false;
    bool _1353 = false;
    bool _535 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3608 = as_type<float>(_135);
        out.gl_Position.z = _3608;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3678 = as_type<float>(_173);
        out.gl_Position.z = _3678;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = in.m_67.x;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_72.x;
    float _185 = in.m_72.y;
    float _187 = in.m_72.z;
    float _189 = in.m_74.x;
    float _191 = in.m_74.y;
    float _193 = in.m_74.z;
    float _195 = in.m_76.x;
    float _197 = in.m_76.y;
    float _199 = in.m_76.z;
    float _201 = _179 * _177;
    float _203 = in.m_78.x;
    float _205 = in.m_78.y;
    float _207 = in.m_78.z;
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _201);
    int _211 = as_type<int>(_181) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_181) & 2;
    bool _217 = _215 != 0;
    float _219 = _209 * 6.283185482025146484375;
    float _221 = floor(_209);
    int _223 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _225 = _223 != 0;
    float _227 = _219 * 0.15915493667125701904296875;
    bool _229 = !_217;
    int _231 = _229 ? (-1090519040) : 1056964608;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = _185 * _191;
    bool _243 = !_213;
    int _245 = _243 ? (-1090519040) : 1056964608;
    float _247 = _227 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_225;
    int _253 = _251 ? 0 : 1;
    float _255 = _185 * _197;
    bool _257 = !_235;
    int _259 = _257 ? 0 : 1;
    out.m_80.x = as_type<float>(_245);
    out.m_80.y = as_type<float>(_231);
    float _261 = _185 * _205;
    float _263 = fma(_183, _189, _241);
    int _265 = abs(_259);
    float _267 = -_221;
    float _269 = _209 + _267;
    int _271 = abs(_253);
    float _273 = fma(_183, _195, _255);
    float _275 = fma(_183, _203, _261);
    bool _277 = !_239;
    int _279 = _277 ? 0 : 1;
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_265);
    float _287 = fma(_249, 0.5, 0.5);
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_187, _199, _273);
    int _293 = abs(_279);
    float _295 = abs(_283);
    float _297 = _285 * _295;
    bool _299 = _269 < 0.5;
    float _301 = float(_299);
    float _303 = -_287;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = float(_271);
    float _309 = -_301;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_307, _305, _297);
    float _315 = float(_293);
    float _317 = fma(_187, _193, _263);
    float _319 = fma(_187, _207, _275);
    float _321 = abs(_311);
    float _323 = fma(_315, _321, _313);
    bool _325 = !_289;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_119);
        float _347 = 1.0 / _345;
        float _349 = _153 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _351 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _351 + _357;
    bool _361 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_351);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _351 + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _375;
    float _393 = 1.0 / _383;
    float _395 = 1.0 / _379;
    float _397 = _355 * _391;
    bool _399 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _401 = isnan(_351);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_371;
    float _413 = _411 + 1.0;
    bool _415 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_351);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _409 * _413;
    float _429 = _359 * _393;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = _387 * _395;
    bool _441 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_351);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = _425 * _433;
    float _459 = -_425;
    float _461 = _459 + 1.0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_455, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _451 * _461;
    float _475 = fma(_465, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_437, _439, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _439, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = -_451;
    float _483 = _481 + 1.0;
    float _485 = _471 * _473;
    float _487 = _475 * _473;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _501 = fma(_491, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _503 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = fma(_477, _457, _497);
    float _507 = fma(_479, _457, _499);
    float _509 = fma(_501, _427, _505);
    float _511 = fma(_503, _427, _507);
    float _513 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _509);
    float _515 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _511);
    bool _517 = !_389;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _521 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_119);
        float _539 = 1.0 / _537;
        float _541 = _153 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_60.x;
    float _547 = in.m_60.y;
    float _549 = in.m_60.z;
    float _551 = _175 * 2.0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _563 = _561 != 0;
    float _565 = in.m_67.y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = floor(_551);
    float _573 = in.m_67.z;
    bool _575 = !_559;
    int _577 = _575 ? 0 : 1;
    float _579 = in.m_82.x;
    float _581 = in.m_82.y;
    bool _583 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _591 = _587 || _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _597 = 1.0 / _569;
    float _599 = in.m_76.w;
    float _601 = in.m_74.w;
    bool _603 = _571 > 0.0;
    float _605 = _197 * _547;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _611 = _191 * _547;
    float _613 = _205 * _547;
    float _615 = fma(_195, _545, _605);
    float _617 = 1.0 / _609;
    float _619 = fma(_203, _545, _613);
    float _621 = fma(_189, _545, _611);
    float _623 = fma(_199, _549, _615);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _625;
    float _629 = fma(_207, _549, _619);
    float _631 = fma(_193, _549, _621);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _639 = log2(_637);
    float _641 = _627 * _597;
    float _643 = _175 + _565;
    float _645 = _573 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _647;
    float _651 = _643 + (-1.0);
    float _653 = _565 * 2.0;
    bool _655 = _571 >= 0.0;
    bool _657 = isnan(_571);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    float _665 = _649 * _617;
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _669 = floor(_653);
    float _671 = _565 + _573;
    float _673 = _513 * _579;
    float _675 = _175 + _573;
    float _677 = _671 + (-1.0);
    float _679 = in.m_78.w;
    float _681 = floor(_645);
    float _683 = _639 * _153;
    float _685 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _687 = _675 + (-1.0);
    bool _689 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _691 = isnan(_543);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = _623 + _599;
    float _703 = _565 + (-0.5);
    float _705 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _707 = 1.0 / _595;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _543 + _709;
    bool _713 = _669 >= 0.0;
    bool _715 = isnan(_669);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = _175 + (-0.5);
    float _725 = _573 + (-0.5);
    float _727 = _515 * _581;
    float _729 = _323 * _673;
    float _731 = exp2(_683);
    int _733 = _663 ? 0 : 1;
    float _735 = _323 * _727;
    bool _737 = _681 >= 0.0;
    bool _739 = isnan(_681);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = _729 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _749 = ~_733;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _757 = _753;
    int _759 = as_type<int>(_601);
    if (!_603)
    {
        int _761 = ~_733;
        int _763 = _761 + 1;
        _757 = _763;
    }
    int _765 = _757;
    float _767 = _635 * _707;
    bool _769 = _681 > 0.0;
    float _771 = fma(_641, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _773 = _629 + _679;
    bool _775 = _669 > 0.0;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _779 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _781 = isnan(_543);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _793 = 1.0 + _791;
    float _795 = -_731;
    float _797 = _795 + 1.0;
    bool _799 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _801 = isnan(_543);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    bool _811 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = isnan(_543);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_789;
    float _825 = _823 + 1.0;
    float _827 = 1.0 / _793;
    float _829 = _591 ? _797 : 0.0;
    float _831 = -_809;
    float _833 = _831 + 1.0;
    bool _835 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _837 = isnan(1.0);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _843 = _839 || _841;
    float _845 = _809 * _825;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _849 = _543 + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = _543 + _851;
    float _855 = _821 * _833;
    float _857 = -_821;
    float _859 = _857 + 1.0;
    float _861 = fma(_767, _849, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _863 = fma(_665, _853, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _865 = _745 ? 0 : 1;
    float _867 = _699 * _859;
    float _869 = _631 + _601;
    int _871 = abs(_577);
    float _873 = -_699;
    float _875 = _873 + 1.0;
    if (_843)
    {
        float _877 = _829 * _827;
        _155 = _877;
    }
    float _879 = _155;
    float _881 = _771 * _867;
    int _883 = _721 ? 0 : 1;
    float _885 = _869 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _887 = ~_865;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[115].x, _881);
    int _895 = _891;
    if (!_769)
    {
        int _897 = ~_865;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _701 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _905 = ~_883;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = fma(_861, _855, _893);
    float _913 = float(_871);
    float _915 = _773 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _917 = float(_765);
    float _919 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _921 = _909;
    if (!_775)
    {
        int _923 = ~_883;
        int _925 = _923 + 1;
        _921 = _925;
    }
    int _927 = _921;
    float _929 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _933 = _913 * _917;
    float _935 = _903 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _937 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].x, _929);
    float _939 = fma(_863, _845, _911);
    bool _941 = !_555;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].y, _935);
    float _947 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].x, _937);
    float _949 = fma(_885, (*spvDescriptorSet0.vp_c12)._m0[6].z, _919);
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _953 = in.m_84.x;
    float _955 = in.m_84.y;
    float _957 = in.m_84.z;
    float _959 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].y, _945);
    float _961 = _947 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _963 = fma(_915, (*spvDescriptorSet0.vp_c12)._m0[8].z, _949);
    bool _965 = !_563;
    int _967 = _965 ? 0 : 1;
    float _969 = _959 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _971 = _961 * _931;
    float _973 = _963 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _975 = abs(_967);
    float _977 = _969 * _777;
    int _979 = abs(_943);
    float _981 = fma(_971, 0.5, 0.5);
    float _983 = float(_975);
    float _985 = float(_927);
    float _987 = _973 * _951;
    float _989 = _933 * (-2.0);
    float _991 = float(_979);
    float _993 = fma(_977, 0.5, 0.5);
    float _995 = float(_901);
    float _997 = _983 * _985;
    float _999 = fma(_685, _989, _685);
    float _1001 = floor(_981);
    bool _1003 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1005 = isnan(1.0);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_989, _955, _955);
    float _1015 = _991 * _995;
    float _1017 = _997 * (-2.0);
    float _1019 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1013);
    float _1021 = _1015 * (-2.0);
    float _1023 = floor(_993);
    float _1025 = fma(_987, 0.5, 0.5);
    float _1027 = fma(_999, _879, _1019);
    float _1029 = fma(_705, _1017, _705);
    float _1031 = fma(_1017, _957, _957);
    float _1033 = fma(_1021, _953, _953);
    float _1035 = fma(_667, _1021, _667);
    float _1037 = _1027 * 0.15915493667125701904296875;
    float _1039 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1031);
    float _1041 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1033);
    float _1043 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[118].x, _939);
    float _1045 = fma(_1029, _879, _1039);
    float _1047 = fma(_1035, _879, _1041);
    float _1049 = _1037 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _1047 * 0.15915493667125701904296875;
    float _1055 = _1045 * 0.15915493667125701904296875;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1059 = _1037 * 6.283185482025146484375;
    float _1061 = cos(_1059);
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_1023;
    float _1067 = _993 + _1065;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_231));
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1053 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1053 * 6.283185482025146484375;
    float _1097 = cos(_1095);
    float _1099 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _755 * _1071;
    out.m_86.x = _1075;
    out.m_86.y = _1091;
    out.m_86.z = _1093;
    out.m_86.w = _1087;
    float _1105 = as_type<float>(_231) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1107 = _1055 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = -_1001;
    float _1113 = _981 + _1111;
    float _1115 = _1079 * _1061;
    out.m_88.x = _1089;
    out.m_88.y = _1099;
    out.m_88.z = _1101;
    out.m_88.w = _1057;
    float _1117 = _1079 * _1051;
    float _1119 = _1055 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    float _1123 = _1097 * _1061;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_245));
    float _1127 = fma(_1113, 2.0, -1.0);
    float _1129 = as_type<float>(_245) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1131 = floor(_1025);
    float _1133 = _1061 * _1109;
    float _1135 = _1097 * _1051;
    float _1137 = _1097 * _1109;
    float _1139 = _1079 * _1109;
    float _1141 = _1051 * _1109;
    float _1143 = _747 * _1125;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = fma(_1121, _1123, _1117);
    float _1153 = fma(_1121, _1117, _1123);
    float _1155 = fma(_1067, 2.0, -1.0);
    float _1157 = -_1135;
    float _1159 = fma(_1121, _1115, _1157);
    float _1161 = -_1115;
    float _1163 = fma(_1121, _1135, _1161);
    float _1165 = -_1121;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1145);
    float _1169 = -_1121;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1147);
    float _1173 = -_1121;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1177 = -_1103;
    float _1179 = _1121 * _1177;
    float _1181 = _1155 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1183 = -_1131;
    float _1185 = _1025 + _1183;
    float _1187 = _1127 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1189 = fma(_1133, _1143, _1179);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1195 = _1181 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1197 = _1137 * _1103;
    float _1199 = _1139 * _1103;
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1191);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1193);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1195);
    float _1207 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1209 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1211 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = fma(_1151, _1143, _1197);
    float _1215 = fma(_1159, _1143, _1199);
    float _1217 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1167);
    float _1219 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1221 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1223 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1225 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1227 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1207);
    float _1229 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1209);
    float _1231 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1233 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1235 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1171);
    float _1237 = fma(_1141, _1219, _1189);
    float _1239 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1221);
    float _1241 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1223);
    float _1243 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1225);
    float _1245 = _1105 * _1217;
    float _1247 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1227);
    float _1249 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1229);
    float _1251 = _1105 * _1231;
    float _1253 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1233);
    float _1255 = _1105 * _1235;
    float _1257 = fma(_1129, _1247, _1245);
    float _1259 = fma(_1163, _1219, _1213);
    float _1261 = fma(_1129, _1253, _1251);
    float _1263 = fma(_1129, _1249, _1255);
    float _1265 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1239);
    float _1267 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1241);
    float _1269 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1271 = fma(_1153, _1219, _1215);
    float _1273 = _1265 + _1257;
    float _1275 = _1267 + _1263;
    float _1277 = _1269 + _1261;
    float _1279 = fma(_1185, 2.0, -1.0);
    float _1281 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1283 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1285 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_90.x = _1273;
    out.m_90.y = _1275;
    out.m_90.z = _1277;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1289 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1281);
    float _1291 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1283);
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1285);
    float _1295 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1203);
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1201);
    float _1299 = fma(_1287, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1205);
    float _1301 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1289);
    float _1303 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1291);
    float _1305 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1293);
    float _1307 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1309 = _1297 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1311 = _1299 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1313 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1315 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1319 = _1313 + _1309;
    float _1321 = _1315 + _1307;
    float _1323 = _1317 + _1311;
    float _1325 = _1287;
    float _1327 = _1233;
    float _1329 = _1271;
    float _1331 = _1129;
    float _1333 = _1271;
    float _1335 = _1315;
    float _1337 = _1129;
    float _1339 = _1297;
    float _1341 = _1155;
    float _1343 = _1279;
    float _1345 = _1127;
    int _1347 = as_type<int>(_987);
    float _1357;
    float _1359;
    float _1361;
    float _1363;
    if (!_1011)
    {
        bool _1349 = _1307 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1351 = !_1349;
        _1353 = _1351;
        if (!_1353)
        {
            float _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1357 = _1355;
            _1359 = 0.0;
            _1361 = 0.0;
            _1363 = 0.0;
            _1365 = true;
        }
    }
    if ((!_1365) || _1353)
    {
        bool _1401;
        if (!_1353)
        {
            bool _1367 = _1307 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1369 = isnan(_1307);
            bool _1371 = _1367 || _1369;
            bool _1373 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1375 = _1371 || _1373;
            bool _1377 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1379 = !_1375;
            bool _1381 = _1377 && _1379;
            bool _1383 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1335 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1381)
            {
                _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1385 = _1325;
            float _1387 = _1385;
            if (_1381)
            {
                _1327 = 0.0;
            }
            float _1389 = _1327;
            _1359 = _1389;
            if (_1381)
            {
                _1329 = 0.0;
            }
            float _1391 = _1329;
            _1333 = _1391;
            _1361 = _1391;
            if (_1381)
            {
                float _1393 = _1385 * 5.0;
                _1387 = _1393;
            }
            float _1395 = _1387;
            _1357 = _1395;
            if (_1381)
            {
                _1331 = 0.0;
            }
            float _1397 = _1331;
            bool _1399 = !_1375;
            _1401 = _1399 && _1383;
            _1337 = _1397;
            _1363 = _1397;
        }
        if ((!_1401) || _1353)
        {
            _1353 = false;
            float _1403 = _1333;
            float _1405 = _1335;
            float _1407 = _1337;
            bool _1409 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1411 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1413 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1415 = _1281;
            float _1417 = _1405;
            float _1419 = _1407;
            _1357 = _1323;
            _1359 = _1319;
            if (_1409)
            {
                float _1421 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1415 = _1421;
            }
            float _1423 = _1415;
            if (_1409)
            {
                float _1425 = abs(_1127);
                float _1427 = -_1425;
                float _1429 = _1427 + 1.0;
                _1339 = _1429;
            }
            float _1431 = _1339;
            if (_1411)
            {
                float _1433 = abs(_1155);
                float _1435 = -_1433;
                float _1437 = _1435 + 1.0;
                _1341 = _1437;
            }
            float _1439 = _1341;
            if (!_1409)
            {
                _1417 = 1.0;
            }
            float _1441 = _1417;
            float _1443 = _1441;
            if (_1413)
            {
                float _1445 = abs(_1279);
                float _1447 = -_1445;
                float _1449 = _1447 + 1.0;
                _1343 = _1449;
            }
            float _1451 = _1343;
            if (!_1411)
            {
                _1345 = 1.0;
            }
            float _1453 = _1345;
            float _1455 = _1453;
            if (!_1413)
            {
                _1419 = 1.0;
            }
            float _1457 = _1419;
            float _1459 = _1313;
            float _1461 = _1457;
            if (_1411)
            {
                float _1463 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1459 = _1463;
            }
            float _1465 = _1459;
            float _1467 = _1403;
            if (_1413)
            {
                float _1469 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1467 = _1469;
            }
            float _1471 = _1467;
            if (_1409)
            {
                float _1473 = _1431 * _1423;
                float _1475 = precise::clamp(_1473, 0.0, 1.0);
                _1443 = _1475;
            }
            float _1477 = _1443;
            if (_1411)
            {
                float _1479 = _1439 * _1465;
                float _1481 = precise::clamp(_1479, 0.0, 1.0);
                _1455 = _1481;
            }
            float _1483 = _1455;
            float _1485 = _1477 * _1483;
            if (_1413)
            {
                float _1487 = _1451 * _1471;
                float _1489 = precise::clamp(_1487, 0.0, 1.0);
                _1461 = _1489;
            }
            float _1491 = _1461;
            float _1493 = _1485 * _1491;
            _1361 = _1321;
            _1363 = _1493;
        }
    }
    _1365 = false;
    float _1495 = _1357;
    float _1497 = _1359;
    float _1499 = _1361;
    float _1501 = _1363;
    float _1503 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1505 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1503);
    float _1507 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1505);
    float _1509 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1511 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1513 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1509);
    float _1515 = 1.0 / _1511;
    float _1517 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1513);
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1521 = _1519 + _1511;
    float _1523 = _1521 * _1515;
    float _1525 = _1523 * 0.5;
    float _1527 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1531 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1529);
    float _1533 = _1307 + _1527;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1537 = 1.0 / _1531;
    float _1539 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1541 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1535);
    float _1543 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1539);
    float _1545 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1541);
    float _1547 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1543);
    float _1549 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1551 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1555 = _1537 * _1553;
    float _1557 = trunc(_1551);
    int _1559 = int(_1557);
    bool _1561 = _1555 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1563 = _1555 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1565 = !_1561;
    int _1567 = _1565 ? 0 : 1;
    int _1569 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1571 = _1559 + _1569;
    int _1573 = _1571 + 1;
    int _1575 = 2;
    float _1577 = _1499;
    float _1579 = _1497;
    float _1581 = _1495;
    float _1583 = _1501;
    if (!_1561)
    {
        _1575 = 1;
    }
    int _1585 = _1575;
    int _1587 = _1585;
    if (!_1563)
    {
        _1587 = _1567;
    }
    int _1589 = _1587;
    float _1591 = trunc(_1549);
    int _1593 = int(_1591);
    int _1595 = _1589 << 6;
    int _1597 = _1595 + 96;
    uint _1600 = uint(int(uint(_1597) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    int _1616 = _1595 + 104;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
    int _1622 = int(_1618) & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    int _1626 = int(_1618) + 1;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    int _1630 = _1626 & 3;
    float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
    int _1634 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1636 = _1593 + _1634;
    int _1638 = _1636 + 1;
    bool _1640 = _1638 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1642 = _1595 + 48;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    int _1660 = _1638 | _1573;
    bool _1662 = _1660 < 0;
    bool _1664 = _1662 || _1640;
    int _1666 = _1595 + 64;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c15)._m0[int(_1678)][_1680];
    bool _1684 = _1573 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1686 = _1684 || _1664;
    int _1688 = _1595 + 56;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
    uint _1706 = uint(_1638);
    float _1708 = as_type<float>(_1589);
    if (!_1686)
    {
        int _1710 = _1573 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1712 = _1710 + _1638;
        _1706 = uint(_1712);
    }
    uint _1714 = _1706;
    int _1716 = _1595 + 72;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
    int _1722 = int(_1718) & 3;
    float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
    int _1726 = int(_1718) + 1;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    int _1730 = _1726 & 3;
    float _1732 = (*spvDescriptorSet0.vp_c15)._m0[int(_1728)][_1730];
    if (!_1686)
    {
        uint _1734 = uint(int(uint(int(_1714)) >> uint(2)));
        _1347 = int(_1734);
    }
    int _1736 = _1347;
    float _1738 = _1533 * _1614;
    int _1740 = as_type<int>(_1614);
    int _1742 = as_type<int>(_1738);
    if (!_1686)
    {
        int _1744 = int(_1714) << 2;
        _1740 = _1744;
    }
    int _1746 = _1740;
    float _1748 = fma(_1309, _1606, _1738);
    if (!_1686)
    {
        int _1750 = 12 & _1746;
        _1742 = _1750;
    }
    int _1752 = _1742;
    float _1754 = fma(_1311, _1624, _1748);
    if (!_1686)
    {
        int _1756 = _1736 << 4;
        int _1758 = _1756 + _1752;
        _759 = _1758;
    }
    int _1760 = _759;
    float _1762 = _1754 + _1632;
    float _1764 = _599;
    if (!_1686)
    {
        int _1766 = _1760 + 400;
        uint _1768 = uint(int(uint(_1766) >> uint(2)));
        uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
        int _1772 = int(_1768) & 3;
        float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
        _1764 = _1774;
    }
    float _1776 = _1764;
    float _1778 = _1533 * _1658;
    float _1780 = 1.0 / _1762;
    float _1782 = fma(_1309, _1650, _1778);
    int _1784 = _1595 + 80;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c15)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c15)._m0[int(_1796)][_1798];
    float _1802 = _1533 * _1682;
    float _1804 = fma(_1309, _1674, _1802);
    int _1806 = _1595 + 88;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c15)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    float _1824 = _1802;
    float _1826 = _1782;
    if (!_1686)
    {
        float _1828 = floor(_1551);
        _1824 = _1828;
    }
    float _1830 = _1824;
    float _1832 = fma(_1311, _1696, _1782);
    float _1834 = _1832 + _1704;
    float _1836 = fma(_1311, _1724, _1804);
    float _1838 = _1834 * _1780;
    float _1840 = _1804;
    float _1842 = _1830;
    float _1844 = _1838;
    if (!_1686)
    {
        float _1846 = floor(_1549);
        _1840 = _1846;
    }
    float _1848 = _1840;
    float _1850 = _1836 + _1732;
    float _1852 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1854 = _1838 >= 0.0;
    if (!_1686)
    {
        float _1856 = -_1830;
        float _1858 = _1551 + _1856;
        _1842 = _1858;
    }
    float _1860 = _1842;
    float _1862 = _1850 * _1780;
    float _1864 = floor(_1852);
    bool _1866 = _1838 <= 1.0;
    bool _1868 = _1866 && _1854;
    float _1870 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1872 = _1862 >= 0.0;
    bool _1874 = _1872 && _1868;
    float _1876 = floor(_1870);
    bool _1878 = _1862 <= 1.0;
    bool _1880 = _1878 && _1874;
    float _1882 = _1848;
    if (!_1686)
    {
        float _1884 = -_1848;
        float _1886 = _1549 + _1884;
        _1882 = _1886;
    }
    float _1888 = _1882;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_1686)
    {
        float _1892 = rint(_1776);
        float _1894 = precise::max(_1892, 0.0);
        uint _1896 = uint(_1894);
        uint _1898 = clamp(_1896, 0u, 65535u);
        _1890 = as_type<float>(_1898);
    }
    float _1900 = _1890;
    float _1902 = _1533 * _1800;
    float _1904 = fma(_1309, 6.2500002968590706586837768554688e-05, 0.5);
    if (_1880)
    {
        float _1906 = float(_1589);
        _1826 = _1906;
    }
    float _1908 = _1826;
    float _1910 = fma(_1309, _1792, _1902);
    float _1912 = fma(_1311, 6.2500002968590706586837768554688e-05, 0.5);
    float _1914 = -_1876;
    float _1916 = _1870 + _1914;
    float _1918 = fma(_1311, _1814, _1910);
    float _1920 = _1908;
    float _1922 = _1916;
    if (_1880)
    {
        float _1924 = rint(_1908);
        float _1926 = precise::max(_1924, 0.0);
        uint _1928 = uint(_1926);
        uint _1930 = clamp(_1928, 0u, 65535u);
        _1920 = as_type<float>(_1930);
    }
    float _1932 = _1920;
    float _1934 = -_1864;
    float _1936 = _1852 + _1934;
    float _1938 = _1918 + _1822;
    float2 _6498 = float2(_1904, _1912);
    float _1940 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_6498, float2(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_6498, float2(0.0), isnan(_6498)), level(0.0)).x;
    float _1942 = _1938 * _1780;
    float2 _6511 = float2(_1936, _1916);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6511, float2(0.0), isnan(_6511)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6511, float2(0.0), isnan(_6511)), level(0.0)).x;
    float _1946 = _1900;
    if (!_1686)
    {
        float3 _6526 = float3(_1888, _1860, float(as_type<int>(_1900)));
        float3 _6530 = select(_6526, float3(0.0), isnan(_6526));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6530.xy, uint(rint(_6530.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6530.xy, uint(rint(_6530.z)), level(0.0)).x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = _1932;
    if (_1880)
    {
        float3 _6545 = float3(_1838, _1862, float(as_type<int>(_1932)));
        float3 _6547 = select(_6545, float3(0.0), isnan(_6545));
        float _1954 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6547.xy, uint(rint(_6547.z)), _1942, level(0.0));
        _1952 = _1954;
    }
    float _1956 = _1952;
    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1960 = _1495 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1964 = _1497 + _1962;
    float _1966 = _1960 * _1960;
    float _1968 = fma(_1964, _1964, _1966);
    float _1970 = sqrt(_1968);
    bool _1972 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1974 = !_1972;
    float _1976 = _1970;
    float _1978 = _1968;
    float _1980 = _1960;
    float _1982 = _1964;
    float _1984 = _1950;
    if (!_1974)
    {
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1990 = _1970 + _1988;
        float _1992 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1994 = rsqrt(_1968);
        float _1996 = _1990 * _1986;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = _1998 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        float _2004 = _1998 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        float _2008 = _2002 + (-1.0);
        float _2010 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2012 = fma(_2006, _1992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2014 = fma(_2002, _1499, _2010);
        float _2016 = _1994 * _2012;
        float _2018 = fma(_1964, _2016, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2020 = fma(_1960, _2016, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1577 = _2014;
        _1579 = _2018;
        _1581 = _2020;
        _1976 = _2002;
    }
    float _2022 = _1577;
    float _2024 = _1579;
    float _2026 = _1581;
    float _2028 = _1976;
    float _2030 = _1940 * 2000.0;
    bool _2032 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2034 = isnan(0.5);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2040 = _2036 || _2038;
    bool _2042 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2044 = isnan(0.5);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = _1307 >= _2030;
    bool _2054 = isnan(_1307);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(_2030);
    bool _2060 = _2056 || _2058;
    float _2062 = _2028;
    if (_2060)
    {
        _1708 = _2022;
    }
    float _2064 = _1708;
    float _2066 = _2064;
    if (!_2060)
    {
        _2066 = 0.0;
    }
    float _2068 = _2066;
    float _2070 = _2068;
    if (_2060)
    {
        _1978 = _2024;
    }
    float _2072 = _1978;
    float _2074 = _2072;
    if (!_2060)
    {
        _2062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2076 = _2062;
    float _2078 = -_1307;
    float _2080 = _2078 + _2068;
    if (!_2060)
    {
        _2074 = 0.0;
    }
    float _2082 = _2074;
    float _2084 = _2082;
    if (_2060)
    {
        _1980 = _2026;
    }
    float _2086 = _1980;
    float _2088 = _2086;
    if (!_2060)
    {
        float _2090 = _2076 * 5.0;
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = _2080 * _2080;
    float _2096 = -_1309;
    float _2098 = _2096 + _2082;
    float _2100 = -_1311;
    float _2102 = _2100 + _2092;
    float _2104 = fma(_2098, _2098, _2094);
    float _2106 = fma(_2102, _2102, _2104);
    float _2108 = sqrt(_2106);
    bool _2110 = _2108 > 0.0;
    bool _2112 = !_2110;
    float _2114 = _2092;
    float _2116 = _2098;
    float _2118 = _2106;
    if (!_2112)
    {
        float _2120 = _291 * _291;
        float _2122 = fma(_317, _317, _2120);
        float _2124 = fma(_319, _319, _2122);
        float _2126 = rsqrt(_2106);
        float _2128 = sqrt(_2124);
        float _2130 = _2080 * _2126;
        float _2132 = _2102 * _2126;
        bool _2134 = _2128 > 0.0;
        float _2136 = _2098 * _2126;
        bool _2138 = !_2134;
        if (!_2138)
        {
            float _2140 = rsqrt(_2124);
            float _2142 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2144 = _291 * _2140;
            float _2146 = _317 * _2140;
            float _2148 = _319 * _2140;
            float _2150 = _2130 * _2144;
            float _2152 = fma(_2136, _2146, _2150);
            float _2154 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2156 = fma(_2132, _2148, _2152);
            float _2158 = _2156 * _2154;
            float _2160 = fma(_317, _2158, _2082);
            float _2162 = fma(_291, _2158, _2068);
            float _2164 = fma(_319, _2158, _2092);
            _2114 = _2164;
            _2084 = _2160;
            _2070 = _2162;
            _2116 = _2152;
            _2118 = _2146;
        }
    }
    float _2166 = _2114;
    float _2168 = _2084;
    float _2170 = _2070;
    float _2172 = _2116;
    float _2174 = _2118;
    float _2176 = _2172;
    float _2178 = _2170;
    float _2180 = _2168;
    float _2182 = _2166;
    float _2184 = _2174;
    if (!_2040)
    {
        float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2188 = _1307 + _2186;
        float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2192 = _1309 + _2190;
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2196 = -_1311;
        float _2198 = _2196 + _2166;
        float _2200 = _2188 * _2188;
        float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2204 = _1311 + _2202;
        float _2206 = fma(_2192, _2192, _2200);
        float _2208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2210 = fma(_2204, _2204, _2206);
        float _2212 = sqrt(_2210);
        float _2214 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2216 = precise::min(_2212, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2218 = _2216 * _2208;
        float _2220 = -_1309;
        float _2222 = _2220 + _2168;
        float _2224 = _2214 * _2218;
        float _2226 = -_1307;
        float _2228 = _2226 + _2170;
        float _2230 = fma(_2222, _2224, _1309);
        float _2232 = fma(_2228, _2224, _1307);
        float _2234 = fma(_2198, _2224, _1311);
        _2176 = _2208;
        _2178 = _2232;
        _2180 = _2230;
        _2182 = _2234;
        _2184 = _2222;
    }
    float _2236 = _2176;
    float _2238 = _2178;
    float _2240 = _2180;
    float _2242 = _2182;
    float _2244 = _2184;
    float _2246 = _2244;
    float _2248 = _2236;
    if (_2050)
    {
        _1982 = 1.0;
    }
    float _2250 = _1982;
    float _2252 = _2250;
    if (_1686)
    {
        _1844 = 1.0;
    }
    float _2254 = _1844;
    float _2256 = _2254;
    if (_2050)
    {
        _2246 = 1.0;
    }
    float _2258 = _2246;
    float _2260 = _2258;
    if (!_2050)
    {
        float _2262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2270 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2268;
        float _2272 = _2264 * 6.283185482025146484375;
        float _2274 = cos(_2272);
        float _2276 = _2266 * 0.15915493667125701904296875;
        float _2278 = _2264 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = 1.0 / _2274;
        float _2284 = _2276 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = _2276 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = 1.0 / _2270;
        float _2298 = 1.0 / _2294;
        float _2300 = _2292 * _2298;
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2304 = fma(_1555, _2300, _2302);
        float _2306 = _2304 * _2296;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2248 = _2282;
        _2260 = _2308;
    }
    float _2310 = _2248;
    float _2312 = _2260;
    float _2314 = _2310;
    if (!_2050)
    {
        float _2316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2318 = _2316 * 0.15915493667125701904296875;
        float _2320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2322 = _2318 * 6.283185482025146484375;
        float _2324 = cos(_2322);
        float _2326 = _2320 * 0.15915493667125701904296875;
        float _2328 = _2318 * 6.283185482025146484375;
        float _2330 = sin(_2328);
        float _2332 = 1.0 / _2324;
        float _2334 = _2326 * 6.283185482025146484375;
        float _2336 = cos(_2334);
        float _2338 = _2330 * _2332;
        float _2340 = _2326 * 6.283185482025146484375;
        float _2342 = sin(_2340);
        float _2344 = _2336 * _2338;
        float _2346 = 1.0 / _2344;
        float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2350 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2348;
        float _2352 = 1.0 / _2350;
        float _2354 = _2342 * _2346;
        float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2358 = fma(_1555, _2354, _2356);
        float _2360 = _2358 * _2352;
        float _2362 = precise::clamp(_2360, 0.0, 1.0);
        float _2364 = -_2362;
        float _2366 = _2364 + 1.0;
        _2314 = _2326;
        _2252 = _2366;
    }
    float _2368 = _2314;
    float _2370 = _2252;
    float _2372 = _2368;
    if (!_1686)
    {
        int _2374 = int(_1714) << 4;
        int _2376 = _2374 + 2048;
        uint _2378 = uint(int(uint(_2376) >> uint(2)));
        uint _2380 = uint(int(uint(int(_2378)) >> uint(2)));
        int _2382 = int(_2378) & 3;
        float _2384 = (*spvDescriptorSet0.vp_c15)._m0[int(_2380)][_2382];
        int _2386 = int(_2378) + 1;
        uint _2388 = uint(int(uint(_2386) >> uint(2)));
        int _2390 = _2386 & 3;
        float _2392 = (*spvDescriptorSet0.vp_c15)._m0[int(_2388)][_2390];
        int _2394 = _2376 + 8;
        uint _2396 = uint(int(uint(_2394) >> uint(2)));
        uint _2398 = uint(int(uint(int(_2396)) >> uint(2)));
        int _2400 = int(_2396) & 3;
        float _2402 = (*spvDescriptorSet0.vp_c15)._m0[int(_2398)][_2400];
        int _2404 = int(_2396) + 1;
        uint _2406 = uint(int(uint(_2404) >> uint(2)));
        int _2408 = _2404 & 3;
        float _2410 = (*spvDescriptorSet0.vp_c15)._m0[int(_2406)][_2408];
        float _2412 = _1533 * _2392;
        float _2414 = fma(_1309, _2384, _2412);
        float _2416 = fma(_1311, _2402, _2414);
        float _2418 = _2416 + _2410;
        float _2420 = precise::clamp(_2418, 0.0, 1.0);
        float _2422 = -_2420;
        float _2424 = _2422 + _1950;
        float _2426 = fma(_2424, 500.0, 1.5);
        float _2428 = exp2(_2426);
        float _2430 = 0.0 + _2428;
        float _2432 = precise::clamp(_2430, 0.0, 1.0);
        _2256 = _2432;
    }
    float _2434 = _2256;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2438 = _2238 + _2436;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2442 = _2240 + _2440;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2446 = _2242 + _2444;
    float _2448 = _2438 * _2438;
    float _2450 = fma(_2442, _2442, _2448);
    float _2452 = fma(_2446, _2446, _2450);
    float _2454 = rsqrt(_2452);
    float _2456 = sqrt(_2452);
    float _2458 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2460 = _2442 * _2458;
    float _2462 = _2446 * _2458;
    float _2464 = _2460 * _2460;
    float _2466 = _2462 * _2462;
    float _2468 = _2464 + _2466;
    float _2470 = sqrt(_2468);
    bool _2472 = _2470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2476 = _2470 + _2474;
    float _2478 = _2454;
    float _2480 = _2476;
    float _2482 = _2438;
    float _2484 = _2468;
    if (_2472)
    {
        float _2486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2478 = _2486;
    }
    float _2488 = _2478;
    if (_2472)
    {
        float _2490 = rsqrt(_2468);
        _2372 = _2490;
    }
    float _2492 = _2372;
    float _2494 = _2492;
    if (_2472)
    {
        float _2496 = _2476 * _2488;
        _2480 = _2496;
    }
    float _2498 = _2480;
    if (_2472)
    {
        float _2500 = _2498 * 0.15915493667125701904296875;
        _1984 = _2500;
    }
    float _2502 = _1984;
    float _2504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2506 = _2446;
    if (_2472)
    {
        float _2508 = _2502 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        _2506 = _2510;
    }
    float _2512 = _2506;
    float _2514 = precise::max(0.0, _2504);
    float _2516 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2518 = _2514;
    if (_2472)
    {
        float _2520 = _2502 * 6.283185482025146484375;
        float _2522 = cos(_2520);
        _2516 = _2522;
    }
    float _2524 = _2516;
    float _2526 = -_2458;
    float _2528 = -_2514;
    float _2530 = fma(_2438, _2526, _2528);
    if (_2472)
    {
        float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2482 = _2532;
    }
    float _2534 = _2482;
    float _2536 = _2534;
    float _2538 = _2512;
    if (_2472)
    {
        float _2540 = fma(_2512, _2534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2536 = _2540;
    }
    float _2542 = _2536;
    float _2544 = _2542;
    if (!_2472)
    {
        _2538 = _2530;
    }
    float _2546 = _2538;
    float _2548 = _2546;
    if (_2472)
    {
        float _2550 = _2492 * _2542;
        _1922 = _2550;
    }
    float _2552 = _1922;
    if (!_2472)
    {
        _2494 = _2460;
    }
    float _2554 = _2494;
    float _2556 = _2554;
    float _2558 = _2524;
    if (_2472)
    {
        float _2560 = _2524 + (-1.0);
        _2518 = _2560;
    }
    float _2562 = _2518;
    float _2564 = _2562;
    if (_2472)
    {
        float _2566 = _2460 * _2552;
        _2556 = _2566;
    }
    float _2568 = _2556;
    if (!_2472)
    {
        _2544 = _2464;
    }
    float _2570 = _2544;
    float _2572 = _2570;
    if (_2472)
    {
        float _2574 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2484 = _2574;
    }
    float _2576 = _2484;
    if (!_2472)
    {
        _2564 = _2462;
    }
    float _2578 = _2564;
    float _2580 = _2578;
    if (_2472)
    {
        float _2582 = _2462 * _2552;
        _2580 = _2582;
    }
    float _2584 = _2580;
    if (_2472)
    {
        float _2586 = _2568 * _2568;
        _2572 = _2586;
    }
    float _2588 = _2572;
    if (_2472)
    {
        float _2590 = fma(_2530, _2524, _2576);
        _2548 = _2590;
    }
    float _2592 = _2548;
    if (!_2472)
    {
        _2558 = _2466;
    }
    float _2594 = _2558;
    float _2596 = _2594;
    if (_2472)
    {
        float _2598 = _2584 * _2584;
        _2596 = _2598;
    }
    float _2600 = _2596;
    float _2602 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2604 = fma(_2592, _2592, _2588);
    float _2606 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2608 = _2604 + _2600;
    float _2610 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2606);
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2614 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2612);
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2620 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2622 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2610);
    float _2624 = rsqrt(_2608);
    float _2626 = -_2616;
    float _2628 = _2626 + 1.0;
    float _2630 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2632 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2618);
    float _2634 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2636 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2620);
    float _2638 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2630);
    float _2640 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2632);
    float _2642 = abs(_2628);
    float _2644 = log2(_2642);
    float _2646 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2636);
    float _2648 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2638);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2652 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2654 = _2646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2656 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2660 = _2624 * _2568;
    float _2662 = _2624 * _2592;
    float _2664 = _2624 * _2584;
    float _2666 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2658);
    float _2668 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2670 = -_2652;
    float _2672 = fma(_2670, _2602, 1.0);
    float _2674 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2666);
    float _2676 = -_2668;
    float _2678 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2676);
    float _2680 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2682 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2684 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2674);
    float _2686 = -_2664;
    float _2688 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2678);
    float _2690 = log2(_2672);
    float _2692 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2694 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2682);
    float _2696 = fma(_2688, -0.5, 0.5);
    float _2698 = fma(_2688, 0.5, 0.5);
    float _2700 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2692);
    float _2702 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2694);
    float _2704 = _2662 + 1.0;
    float _2706 = 1.0 / _2684;
    float _2708 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2700);
    float _2710 = fma(_2698, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2712 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2708);
    float _2714 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2702);
    float _2716 = fma(_2698, _2710, -0.212114393711090087890625);
    float _2718 = exp2(_2680);
    float _2720 = _2690 * 0.693147182464599609375;
    float _2722 = fma(_2698, _2716, 1.570728778839111328125);
    float _2724 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2726 = sqrt(_2696);
    float _2728 = _2712 * _2706;
    float _2730 = _2714 * _2706;
    float _2732 = fma(_2730, -0.5, 0.5);
    float _2734 = -_2662;
    float _2736 = fma(_2718, _2704, _2734);
    float _2738 = fma(_2736, 0.5, 0.5);
    float _2740 = _2726 * 0.636619746685028076171875;
    float _2742 = fma(_2728, 0.5, 0.5);
    float _2744 = -_2722;
    float _2746 = fma(_2740, _2744, 1.0);
    float3 _7753 = float3(_2742, _2732, _2724);
    float _2748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7753, float3(0.0), isnan(_7753)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7753, float3(0.0), isnan(_7753)), level(0.0)).x;
    float3 _7762 = float3(_2742, _2732, _2724);
    float4 _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7762, float3(0.0), isnan(_7762)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7762, float3(0.0), isnan(_7762)), level(0.0)).xyzw;
    float _2753 = _2751.x;
    float _2755 = _2751.y;
    float _2757 = _2751.z;
    float _2759 = _2751.w;
    float2 _7778 = float2(_2746, _2738);
    float3 _2763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7778, float2(0.0), isnan(_7778)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7778, float2(0.0), isnan(_7778)), level(0.0)).xyz;
    float _2765 = _2763.x;
    float _2767 = _2763.y;
    float _2769 = _2763.z;
    float _2771 = abs(_1555);
    float _2773 = log2(_2771);
    float _2775 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2777 = -_1944;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2775);
    float _2783 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_92.y = 1.0;
    float _2785 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2787 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2789 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2791 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2783);
    float _2793 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2785);
    float _2795 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2787);
    float _2797 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2789);
    float _2799 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2791);
    float _2801 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2803 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2793);
    float _2805 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2795);
    float _2807 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2781);
    float _2809 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2797);
    float _2811 = _2799 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2813 = exp2(_2801);
    float _2815 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2807);
    float _2817 = _2803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2819 = _2805 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2821 = _2809 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2823 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2825 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2827 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _2829 = _1555 <= 8000.0;
    bool _2831 = isnan(_1555);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan(8000.0);
    bool _2837 = _2833 || _2835;
    float _2839 = float(_2837);
    float _2841 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2823);
    float _2843 = -_319;
    float _2845 = _2843 + _2242;
    float _2847 = _2817;
    float _2849 = _2714;
    float _2851 = _2684;
    if (!_2060)
    {
        _1583 = 0.0;
    }
    float _2853 = _1583;
    float _2855 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2841);
    float _2857 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2859 = precise::clamp(_2857, 0.0, 1.0);
    float _2861 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2863 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2855);
    float _2865 = fma(_2859, -2.0, 3.0);
    float _2867 = _2859 * _2859;
    float _2869 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2861);
    float _2871 = _2867 * _2865;
    float _2873 = _2811 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2875 = -_2871;
    float _2877 = _2875 + 1.0;
    float _2879 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2873);
    float _2881 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2825);
    float _2883 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2871);
    float _2885 = _2827 + _2879;
    float _2887 = _2815 + _2684;
    if (!_1880)
    {
        _2847 = 1.0;
    }
    float _2889 = _2847;
    float _2891 = _2839 * _2883;
    float _2893 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2885);
    float _2895 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2897 = _2887 * 0.5;
    float _2899 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2901 = 1.0 / _2893;
    float _2903 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2905 = _2889;
    if (_1880)
    {
        bool _2907 = _1956 >= _1942;
        bool _2909 = isnan(_1956);
        bool _2911 = _2907 || _2909;
        bool _2913 = isnan(_1942);
        bool _2915 = _2911 || _2913;
        float _2917 = float(_2915);
        _2905 = _2917;
    }
    float _2919 = _2905;
    out.m_94.z = _2897;
    out.m_94.w = _2684;
    float _2921 = _2779 * _2899;
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = _2903 + _2881;
    float _2927 = -_317;
    float _2929 = _2927 + _2240;
    float _2931 = _2919 * _2434;
    float _2933 = exp2(_2895);
    float _2935 = -_2923;
    float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _2712;
    out.gl_Position.y = _2714;
    out.gl_Position.z = _2815;
    out.gl_Position.w = _2684;
    float _2939 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2941 = -_291;
    float _2943 = _2941 + _2238;
    float _2945 = -_2931;
    float _2947 = fma(_2945, _2937, 1.0);
    float _2949 = precise::clamp(_2947, 0.0, 1.0);
    float _2951 = _2863 * _2901;
    float _2953 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2955 = _2949 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2957 = _2951 > 0.0;
    out.m_92.x = _2955;
    float _2959 = -_2933;
    float _2961 = _2959 + 1.0;
    float _2963 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2925);
    bool _2965 = _2951 < 1.0;
    bool _2967 = _2965 && _2957;
    float _2969 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2953);
    float _2971 = _2961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2973 = _2939 + _2869;
    bool _2975 = _2728 > (-1.0);
    bool _2977 = _2975 && _2967;
    float _2979 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2969);
    float _2981 = -_2971;
    float _2983 = _2981 + 1.0;
    float _2985 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2973);
    bool _2987 = _2730 > (-1.0);
    bool _2989 = _2987 && _2977;
    float _2991 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2993 = _2963 * _2901;
    float _2995 = _2985 * _2901;
    bool _2997 = _2728 < 1.0;
    bool _2999 = _2997 && _2989;
    bool _3001 = _2730 < 1.0;
    bool _3003 = _3001 && _2999;
    float _3005 = _2971 * _2748;
    float _3007 = 1.0 / _2991;
    float _3009 = _2759 * _3005;
    float _3011 = _2769 * _3005;
    float _3013 = fma(_2765, _3009, _2753);
    float _3015 = fma(_2767, _3009, _2755);
    float _3017 = _2759 * _2983;
    float _3019 = fma(_2759, _3011, _2757);
    float _3021 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3023 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    out.m_96.x = _3013;
    out.m_96.y = _3015;
    out.m_96.z = _3019;
    out.m_96.w = _3017;
    float _3025 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3021);
    float _3027 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3023);
    float _3029 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3025);
    float _3031 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3027);
    float _3033 = _2312 * _2370;
    float _3035 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3037 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3039 = _3033 * _2853;
    float _3041 = _3035 * _3007;
    float _3043 = _3037 * _3007;
    float _3045 = _3039 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3047 = !_3003;
    float _3049 = _3041;
    float _3051 = _3045;
    float _3053 = _3007;
    float _3081;
    float _3083;
    if (!_3047)
    {
        float _3055 = -_2995;
        float _3057 = _2730 + _3055;
        float _3059 = -_2993;
        float _3061 = _2728 + _3059;
        float _3063 = -_3041;
        float _3065 = _2728 + _3063;
        float _3067 = -_3043;
        float _3069 = _2730 + _3067;
        float _3071 = _3057 * _3057;
        float _3073 = fma(_3061, _3061, _3071);
        float _3075 = sqrt(_3073);
        bool _3077 = _3075 > 0.0;
        bool _3079 = !_3077;
        _3053 = _3061;
        _3081 = _3073;
        _3083 = _3075;
        _3085 = _3079;
        if (!_3085)
        {
            float _3087 = _3069 * _3069;
            float _3089 = fma(_3065, _3065, _3087);
            float _3091 = rsqrt(_3073);
            float _3093 = sqrt(_3089);
            float _3095 = _3061 * _3091;
            float _3097 = _3057 * _3091;
            bool _3099 = _3093 > 0.0;
            bool _3101 = !_3099;
            _3049 = _3093;
            _3083 = _3091;
            _3085 = _3101;
            if (!_3085)
            {
                float _3103 = _747 * _2821;
                float _3105 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3107 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2827);
                float _3109 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2939);
                float _3111 = fma(_3103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2903);
                float _3113 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3107);
                float _3115 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3109);
                float _3117 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3111);
                float _3119 = rsqrt(_3089);
                float _3121 = _3105 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3123 = 1.0 / _3113;
                float _3125 = _3069 * _3121;
                float _3127 = _3065 * _3121;
                float _3129 = _3125 * _3125;
                float _3131 = fma(_3127, _3127, _3129);
                float _3133 = _3069 * _3119;
                float _3135 = _3065 * _3119;
                float _3137 = _3115 * _3123;
                float _3139 = _3117 * _3123;
                float _3141 = sqrt(_3131);
                float _3143 = _3137 * _3137;
                float _3145 = fma(_3139, _3139, _3143);
                float _3147 = _3097 * _3133;
                float _3149 = fma(_3095, _3135, _3147);
                float _3151 = sqrt(_3145);
                float _3153 = precise::min(0.0, _3149);
                float _3155 = _2684 * _3153;
                float _3157 = fma(_3127, _3155, _2712);
                float _3159 = fma(_3125, _3155, _2714);
                float _3161 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3151);
                out.gl_Position.x = _3157;
                out.gl_Position.y = _3159;
                float _3163 = 1.0 / _3161;
                float _3165 = _3151 * _3163;
                out.m_92.y = _3165;
                _3049 = _3125;
                _2849 = _3159;
                _3053 = _3163;
                _3081 = _3161;
                _2851 = _3155;
                _3083 = _3157;
                _3085 = true;
            }
        }
    }
    else
    {
        float _3167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3167;
        _2849 = 0.0;
        _3051 = 0.0;
        _3081 = _3167;
        _3083 = 0.0;
    }
    _3085 = false;
    float _3169 = _3049;
    float _3171 = _2849;
    float _3173 = _3051;
    float _3175 = _3053;
    float _3177 = _3081;
    float _3179 = _2851;
    float _3181 = _3083;
    bool _3183 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3185 = isnan(_2456);
    bool _3187 = _3183 || _3185;
    bool _3189 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3191 = _3187 || _3189;
    float _3193 = _3175;
    float _3195 = _3169;
    float _3197 = _3179;
    float _3199 = _3177;
    float _3201 = _3171;
    float _3203 = _3181;
    if (!_3191)
    {
        _3193 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3205 = _3193;
    float _3207 = _3205;
    float _3209 = _3205;
    if (!_3191)
    {
        _3195 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3211 = _3195;
    float _3213 = _3211;
    float _3215 = _3211;
    if (!_3191)
    {
        _3197 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3217 = _3197;
    float _3219 = _3217;
    float _3221 = _3217;
    if (!_3191)
    {
        _3199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3223 = _3199;
    float _3225 = _3223;
    float _3227 = _3223;
    if (!_3191)
    {
        _3201 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3229 = _3201;
    float _3231 = _3229;
    float _3233 = _3229;
    if (!_3191)
    {
        _3203 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3235 = _3203;
    bool _3237 = !_3191;
    float _3239 = _3235;
    float _3241 = _3235;
    if (!_3237)
    {
        bool _3243 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3245 = isnan(_2456);
        bool _3247 = _3243 || _3245;
        bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3251 = _3247 || _3249;
        if (!_3251)
        {
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3255 = _2456 + _3253;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3259 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3257;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3265 = 1.0 / _3259;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3283 = _3255 * _3265;
            float _3285 = precise::clamp(_3283, 0.0, 1.0);
            float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3291 = fma(_3285, _3263, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3293 = fma(_3285, _3289, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3295 = fma(_3285, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3297 = fma(_3285, _3273, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3299 = fma(_3285, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3301 = fma(_3285, _3281, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3215 = _3295;
            _3233 = _3299;
            _3209 = _3291;
            _3227 = _3297;
            _3221 = _3293;
            _3241 = _3301;
            _3303 = true;
        }
        else
        {
            bool _3305 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3307 = isnan(_2456);
            bool _3309 = _3305 || _3307;
            bool _3311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3313 = _3309 || _3311;
            if (!_3313)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3315 = _3207;
            _3209 = _3315;
            if (!_3313)
            {
                _3213 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3317 = _3213;
            _3215 = _3317;
            if (!_3313)
            {
                _3219 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3319 = _3219;
            _3221 = _3319;
            if (!_3313)
            {
                _3225 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3321 = _3225;
            _3227 = _3321;
            if (!_3313)
            {
                _3231 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3323 = _3231;
            _3233 = _3323;
            if (!_3313)
            {
                _3239 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3325 = _3239;
            bool _3327 = !_3313;
            _3241 = _3325;
            if (!_3327)
            {
                bool _3329 = _2456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3331 = isnan(_2456);
                bool _3333 = _3329 || _3331;
                bool _3335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3337 = _3333 || _3335;
                if (!_3337)
                {
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3341 = _2456 + _3339;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3345 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3343;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3351 = 1.0 / _3345;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3369 = _3341 * _3351;
                    float _3371 = precise::clamp(_3369, 0.0, 1.0);
                    float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3377 = fma(_3371, _3349, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3379 = fma(_3371, _3375, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3381 = fma(_3371, _3355, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3383 = fma(_3371, _3359, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3385 = fma(_3371, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3387 = fma(_3371, _3367, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3215 = _3381;
                    _3233 = _3385;
                    _3209 = _3377;
                    _3227 = _3383;
                    _3221 = _3379;
                    _3241 = _3387;
                    _3303 = true;
                }
                else
                {
                    _3215 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3233 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3227 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3221 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3241 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3303 = false;
    float _3389 = _3215;
    float _3391 = _3233;
    float _3393 = _3209;
    float _3395 = _3227;
    float _3397 = _3221;
    float _3399 = _3241;
    float _3401 = fma(_1275, -0.5, 0.5);
    float _3403 = precise::clamp(_3401, 0.0, 1.0);
    float _3405 = -_3389;
    float _3407 = _3405 + _3391;
    float _3409 = _3173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3411 = -_3393;
    float _3413 = _3411 + _3395;
    float _3415 = fma(_3403, _3407, _3389);
    out.m_98.x = 0.0;
    float _3417 = -_3397;
    float _3419 = _3417 + _3399;
    float _3421 = fma(_3403, _3413, _3393);
    float _3423 = _3415 * 0.586610972881317138671875;
    out.m_63.x = _3409;
    bool _3425 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3427 = fma(_3403, _3419, _3397);
    float _3429 = fma(_3421, 0.298911988735198974609375, _3423);
    bool _3431 = _2312 > 0.0;
    bool _3433 = isnan(_2312);
    bool _3435 = _3431 || _3433;
    bool _3437 = isnan(0.0);
    bool _3439 = _3435 || _3437;
    float _3441 = fma(_3427, 0.114477999508380889892578125, _3429);
    bool _3443 = _2370 <= 0.0;
    bool _3445 = !_3439;
    bool _3447 = _3443 || _3445;
    float _3449 = -_3441;
    float _3451 = _3421 + _3449;
    float _3453 = -_3441;
    float _3455 = _3415 + _3453;
    float _3457 = -_3441;
    float _3459 = _3427 + _3457;
    float _3461 = fma(_3451, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    float _3463 = fma(_3455, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    float _3465 = fma(_3459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3441);
    bool _3467 = !_3425;
    if (!_3467)
    {
        float _3469 = -_2238;
        float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3473 = -_2240;
        float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3477 = -_2242;
        float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3481 = _3471 * _3471;
        float _3483 = fma(_3475, _3475, _3481);
        float _3485 = fma(_3479, _3479, _3483);
        float _3487 = sqrt(_3485);
        float _3489 = rsqrt(_3485);
        float _3491 = -_3487;
        float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3495 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3497 = precise::clamp(_3495, 0.0, 1.0);
        float _3499 = _3475 * _3489;
        float _3501 = _3471 * _3489;
        float _3503 = abs(_3497);
        float _3505 = log2(_3503);
        float _3507 = _3479 * _3489;
        float _3509 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3511 = _1275 * _3501;
        float _3513 = -_3501;
        float _3515 = -_3509;
        float _3517 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3515);
        float _3519 = fma(_1273, _3499, _3511);
        float _3521 = -_3507;
        float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3517);
        float _3525 = fma(_1277, _3507, _3519);
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3531 = _3523 + _3529;
        float _3533 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3537 = precise::clamp(_3535, 0.0, 1.0);
        float _3539 = exp2(_3533);
        float _3541 = _3539 * _3537;
        float _3543 = _3527 * _3541;
        float _3545 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3549 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3545;
        out.m_98.y = _3547;
        out.m_98.z = _3549;
    }
    out.m_100.x = _3461;
    out.m_100.y = _3463;
    out.m_100.z = _3465;
    if (!_3447)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3551 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3551;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

