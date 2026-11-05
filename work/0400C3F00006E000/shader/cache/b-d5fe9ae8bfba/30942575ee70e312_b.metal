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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_66 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1320 = false;
    bool _295 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_105);
        out.gl_Position.z = _1922;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1991 = as_type<float>(_143);
        out.gl_Position.z = _1991;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_56.x;
    float _155 = in.m_56.y;
    float _157 = in.m_56.z;
    float _159 = _149 * _147;
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_151) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_151) & 2;
    bool _169 = _167 != 0;
    float _171 = floor(_161);
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = _161 * 6.283185482025146484375;
    float _179 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _181 = !_169;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _177 * 0.15915493667125701904296875;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _191 = _189 != 0;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _195 = _193 != 0;
    float _197 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_175;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _205 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_191;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    int _217 = abs(_201);
    float _219 = -_171;
    float _221 = _161 + _219;
    int _223 = abs(_213);
    float _225 = -_221;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = float(_223);
    bool _233 = !_195;
    int _235 = _233 ? 0 : 1;
    float _237 = fma(_209, 0.5, 0.5);
    bool _239 = _221 < 0.5;
    float _241 = float(_239);
    float _243 = abs(_227);
    float _245 = _231 * _243;
    int _247 = abs(_235);
    float _249 = -_237;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_217);
    float _255 = -_241;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = float(_247);
    float _261 = fma(_253, _251, _245);
    float _263 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _265 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _267 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _215);
    float _269 = abs(_257);
    float _271 = fma(_259, _269, _261);
    bool _273 = !_165;
    float _275 = _273 ? (-0.5) : 0.5;
    bool _277 = !_229;
    float _293;
    if (!_277)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_89);
        float _299 = 1.0 / _297;
        float _301 = _123 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _307 = log2(_305);
    float _309 = _145 * 2.0;
    bool _311 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _319 = _315 || _317;
    float _321 = in.m_51.y;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _303 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _303 + _327;
    float _331 = floor(_309);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _303 + _333;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _339 = _307 * _123;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _345 = _337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _347 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _349 = isnan(1.0);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _355 = _351 || _353;
    float _357 = exp2(_339);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    float _363 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = in.m_44.x;
    float _367 = in.m_44.y;
    float _369 = in.m_44.z;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _381 = _379 != 0;
    bool _383 = _145 > 0.5;
    float _385 = 1.0 / _361;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _389 = _387 != 0;
    bool _391 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_303);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -_357;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_303);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = _319 ? _405 : 0.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _425;
    float _429 = 1.0 / _409;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _433 = _431 != 0;
    if (_355)
    {
        float _435 = _423 * _385;
        _127 = _435;
    }
    float _437 = _127;
    float _439 = -_275;
    int _441 = _383 ? as_type<int>(_439) : as_type<int>(_275);
    float _443 = in.m_51.z;
    bool _445 = _331 > 0.0;
    float _447 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _449 = _331 >= 0.0;
    bool _451 = isnan(_331);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = 1.0 / _427;
    float _461 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _463 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _465 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _471 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    float _473 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
    float _475 = _329 * _429;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _477;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _483 = 1.0 / _469;
    float _485 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _471);
    float _487 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _489 = _325 * _459;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _493 = _303 + _491;
    float _495 = _485 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _497 = 1.0 / _479;
    float _499 = _321 + _443;
    out.m_58.x = _487;
    out.m_58.y = _345;
    out.m_58.z = _363;
    out.m_58.w = _343;
    float _501 = _145 + _443;
    float _503 = _499 + (-1.0);
    float _505 = _501 + (-1.0);
    float _507 = _493 * _483;
    float _509 = _461 * _145;
    float _511 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _513 = _145 + _321;
    float _515 = _321 * 2.0;
    float _517 = _443 * 2.0;
    float _519 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _521 = trunc(_509);
    int _523 = int(_521);
    float _525 = _513 + (-1.0);
    float _527 = _335 * _497;
    float _529 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _531;
    float _535 = floor(_515);
    int _537 = _523 << 4;
    int _539 = _537 + 1968;
    float _541 = floor(_517);
    bool _543 = !_389;
    float _545 = _543 ? _275 : as_type<float>(_441);
    float _547 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    uint _550 = uint(int(uint(_539) >> uint(2)));
    uint _552 = uint(int(uint(int(_550)) >> uint(2)));
    int _554 = int(_550) & 3;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[int(_552)][_554];
    int _558 = int(_550) + 1;
    uint _560 = uint(int(uint(_558) >> uint(2)));
    int _562 = _558 & 3;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[int(_560)][_562];
    int _566 = _457 ? 0 : 1;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _568;
    bool _572 = _535 >= 0.0;
    bool _574 = isnan(_535);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    int _582 = ~_566;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    float _588 = fma(_570, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _590 = _539 + 8;
    uint _592 = uint(int(uint(_590) >> uint(2)));
    uint _594 = uint(int(uint(int(_592)) >> uint(2)));
    int _596 = int(_592) & 3;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[int(_594)][_596];
    int _600 = _586;
    if (!_445)
    {
        int _602 = ~_566;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    int _608 = _580 ? 0 : 1;
    bool _610 = _541 > 0.0;
    bool _612 = _541 >= 0.0;
    bool _614 = isnan(_541);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _624 = isnan(_303);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    bool _634 = _535 > 0.0;
    float _636 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _511);
    float _638 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    float _640 = -_632;
    float _642 = _640 + 1.0;
    float _644 = fma(_533, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _646 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _648 = isnan(_303);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_401;
    float _660 = _658 + 1.0;
    float _662 = _401 * _642;
    float _664 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _666 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_303);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_656;
    float _680 = _678 + 1.0;
    float _682 = _656 * _660;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _696;
    float _700 = _676 * _680;
    float _702 = -_676;
    float _704 = _702 + 1.0;
    float _706 = fma(_686, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _708 = fma(_690, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _710 = fma(_694, _527, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _712 = fma(_698, _527, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _714 = _421 * _704;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _718 = -_421;
    float _720 = _718 + 1.0;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _730 = _644 * _714;
    float _732 = _588 * _714;
    int _734 = _620 ? 0 : 1;
    float _736 = fma(_724, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _738 = fma(_728, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _742 = _545 + 0.5;
    int _744 = ~_734;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    float _750 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _752 = ~_608;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    float _758 = _598 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _760 = _748;
    int _762 = _756;
    if (!_610)
    {
        int _764 = ~_734;
        int _766 = _764 + 1;
        _760 = _766;
    }
    int _768 = _760;
    float _770 = _564 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_634)
    {
        int _772 = ~_608;
        int _774 = _772 + 1;
        _762 = _774;
    }
    int _776 = _762;
    float _778 = _742 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _780 = _321 > 0.5;
    float _782 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _732);
    float _786 = _778 * _716;
    float _788 = -_183;
    int _790 = _780 ? as_type<int>(_788) : as_type<int>(_183);
    float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _794 = !_377;
    int _796 = _794 ? 0 : 1;
    float _798 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _802 = !_433;
    float _804 = _802 ? _183 : as_type<float>(_790);
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _664 + _806;
    int _810 = abs(_796);
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _814 = _495 + _812;
    out.m_60.x = _782;
    out.m_60.y = _798;
    out.m_60.z = _800;
    float _816 = fma(_706, _700, _740);
    float _818 = float(_606);
    float _820 = _321 + (-0.5);
    float _822 = in.m_62.x;
    float _824 = in.m_62.y;
    float _826 = in.m_62.z;
    float _828 = float(_768);
    float _830 = fma(_708, _700, _784);
    float _832 = float(_776);
    float _834 = -_804;
    float _836 = _834 + 0.5;
    float _838 = _638 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = _814 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _846 = _838 + _844;
    float _848 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _850 = _842 * _792;
    float _852 = float(_810);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _848);
    float _856 = _814 * _814;
    out.m_64.x = _786;
    out.m_64.y = _850;
    float _858 = _852 * _818;
    float _860 = fma(_808, _808, _856);
    bool _862 = _854 >= 0.0;
    bool _864 = !_373;
    int _866 = _864 ? 0 : 1;
    float _868 = fma(_846, _846, _860);
    float _870 = _858 * (-2.0);
    bool _872 = !_381;
    int _874 = _872 ? 0 : 1;
    float _876 = rsqrt(_868);
    int _878 = abs(_866);
    float _880 = fma(_870, _824, _824);
    float _882 = fma(_519, _870, _519);
    int _884 = abs(_874);
    float _886 = _870;
    if (_862)
    {
        _886 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _888 = _886;
    float _890 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _880);
    float _892 = float(_878);
    int _894 = as_type<int>(_888);
    if (_862)
    {
        out.m_47.x = 0.0;
    }
    if (_862)
    {
        float _896 = _888 * 5.0;
        _894 = as_type<int>(_896);
    }
    int _898 = _894;
    float _900 = _892 * _828;
    float _902 = float(_884);
    float _904 = fma(_882, _437, _890);
    float _906 = _814 * _876;
    if (_862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3190 = as_type<float>(_898);
        out.gl_Position.z = _3190;
    }
    float _908 = _808 * _876;
    float _910 = _902 * _832;
    float _912 = -_906;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    if (_862)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _920 = -_908;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _924 = _846 * _876;
    float _926 = _904 * 0.15915493667125701904296875;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _918 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _922 + _932;
    float _936 = -_924;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    float _940 = _900 * (-2.0);
    float _942 = _930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _944 = _910 * (-2.0);
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _948 = _938 + _946;
    float _950 = fma(_529, _940, _529);
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _942);
    float _954 = _145 + (-0.5);
    float _956 = fma(_940, _822, _822);
    float _958 = -_908;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _964 = _914 * _914;
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _956);
    float _968 = fma(_710, _682, _816);
    float _970 = in.m_66.x;
    float _972 = in.m_66.y;
    float _974 = fma(_944, _826, _826);
    float _976 = _443 + (-0.5);
    bool _978 = _962 >= 0.0;
    float _980 = fma(_960, _960, _964);
    float _982 = -_924;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _986 = fma(_547, _944, _547);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].z, _974);
    float _990 = fma(_712, _682, _830);
    float _992 = fma(_984, _984, _980);
    float _994 = fma(_950, _437, _966);
    float _996 = fma(_986, _437, _988);
    float _998 = fma(_738, _662, _990);
    float _1000 = sqrt(_992);
    float _1002 = fma(_736, _662, _968);
    float _1004 = _994 * 0.15915493667125701904296875;
    float _1006 = _996 * 0.15915493667125701904296875;
    float _1008 = _986;
    if (_978)
    {
        _1008 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1010 = _1008;
    float _1012 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[147].y, _998);
    float _1014 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1002);
    float _1016 = _926 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    int _1020 = as_type<int>(_1010);
    if (_978)
    {
        float _1022 = _1010 * 5.0;
        _1020 = as_type<int>(_1022);
    }
    int _1024 = _1020;
    if (_978)
    {
        out.m_47.x = 0.0;
    }
    float _1026 = _1012 * _972;
    if (_978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3406 = as_type<float>(_1024);
        out.gl_Position.z = _3406;
    }
    float _1028 = _926 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _876 * _1000;
    float _1034 = _271 * _1026;
    float _1036 = _1004 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1004 * 6.283185482025146484375;
    float _1042 = cos(_1040);
    float _1044 = _1006 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    if (_978)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1048 = _1006 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1054 = _1014 * _970;
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _275);
    float _1060 = _1032 * _1052;
    float _1062 = _271 * _1054;
    float _1064 = _1042 * _1030;
    float _1066 = _1056 * _1060;
    float _1068 = _1062 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1070 = _1038 * _1018;
    float _1072 = _1032 * _1068;
    float _1074 = fma(_1046, _1064, _1070);
    float _1076 = _1050 * _1066;
    float _1078 = _1038 * _1030;
    float _1080 = _1058 * _1072;
    float _1082 = _1042 * _1018;
    float _1084 = _1042 * _1076;
    float _1086 = _1018 * _1050;
    float _1088 = _1030 * _1050;
    float _1090 = _1038 * _1076;
    float _1092 = fma(_1074, _1080, _1084);
    float _1094 = -_1066;
    float _1096 = _1046 * _1094;
    float _1098 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1100 = _1098 * 0.5;
    float _1102 = -_1078;
    float _1104 = fma(_1046, _1082, _1102);
    float _1106 = -_1082;
    float _1108 = fma(_1046, _1078, _1106);
    float _1110 = fma(_1088, _1080, _1096);
    float _1112 = fma(_1046, _1070, _1064);
    float _1114 = fma(_1104, _1100, _1092);
    float _1116 = fma(_1108, _1080, _1090);
    float _1118 = fma(_1086, _1100, _1110);
    float _1120 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1124 = fma(_1112, _1100, _1116);
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1122);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1126);
    float _1134 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1136 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1138 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1132);
    float _1140 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1146 = _664 + _1140;
    float _1148 = _838 + _1142;
    float _1150 = _495 + _1144;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1146 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1158 = _1148 + _1156;
    float _1160 = _1154 * _1154;
    float _1162 = _1158 * _1158;
    float _1164 = _1160 + _1162;
    float _1166 = sqrt(_1164);
    bool _1168 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1144;
    float _1172 = _1160;
    float _1174 = _1126;
    float _1176 = _1146;
    float _1178 = _1124;
    float _1180 = _1162;
    if (!_1168)
    {
        _1170 = _1160;
    }
    float _1182 = _1170;
    float _1184 = _1182;
    if (!_1168)
    {
        _1172 = _1146;
    }
    float _1186 = _1172;
    float _1188 = _1186;
    if (!_1168)
    {
        _1174 = _1162;
    }
    float _1190 = _1174;
    float _1192 = _1190;
    if (!_1168)
    {
        _1176 = _1148;
    }
    float _1194 = _1176;
    float _1196 = _1194;
    if (!_1168)
    {
        _1178 = _1150;
    }
    float _1198 = _1178;
    bool _1200 = !_1168;
    float _1202 = _1198;
    if (!_1200)
    {
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1208 = _1166 + _1206;
        float _1210 = rsqrt(_1164);
        float _1212 = _1208 * _1204;
        float _1214 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = _1212 * 0.15915493667125701904296875;
        float _1218 = _1216 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        float _1222 = _1216 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = fma(_1220, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = _1210 * _1226;
        float _1230 = _1224 + (-1.0);
        float _1232 = fma(_1154, _1228, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1234 = fma(_1158, _1228, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1236 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1240 = _1232 + _1238;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1244 = _1234 + _1242;
        float _1246 = fma(_1150, _1224, _1236);
        float _1248 = _1240 * _1240;
        float _1250 = _1244 * _1244;
        _1202 = _1246;
        _1184 = _1248;
        _1192 = _1250;
        _1188 = _1232;
        _1196 = _1234;
    }
    float _1252 = _1202;
    float _1254 = _1184;
    float _1256 = _1192;
    float _1258 = _1188;
    float _1260 = _1196;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1264 = _1252 + _1262;
    float _1266 = fma(_1264, _1264, _1254);
    float _1268 = _1266 + _1256;
    float _1270 = sqrt(_1268);
    bool _1272 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1274 = isnan(_1270);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1280 = _1276 || _1278;
    float _1282 = _1254;
    float _1284 = _1252;
    if (!_1280)
    {
        _1282 = 1.0;
    }
    float _1286 = _1282;
    bool _1288 = !_1280;
    float _1290 = _1286;
    if (!_1288)
    {
        bool _1292 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1294 = isnan(_1270);
        bool _1296 = _1292 || _1294;
        bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1300 = _1296 || _1298;
        if (!_1300)
        {
            float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1304 = _1270 + _1302;
            float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1308 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1306;
            float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1312 = _1310 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1314 = 1.0 / _1308;
            float _1316 = _1304 * _1314;
            float _1318 = fma(_1316, _1312, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1290 = _1318;
            _1320 = true;
        }
        else
        {
            bool _1322 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1324 = isnan(_1270);
            bool _1326 = _1322 || _1324;
            bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1330 = _1326 || _1328;
            if (!_1330)
            {
                float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1334 = _1270 + _1332;
                float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1338 = _1336 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1344 = 1.0 / _1338;
                float _1346 = _1334 * _1344;
                float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1290 = _1348;
                _1320 = true;
            }
            else
            {
                _1290 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1320 = false;
    float _1350 = _1290;
    float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1354 = _1252 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1358 = _1258 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1362 = _1260 + _1360;
    float _1364 = fma(_1354, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1366 = fma(_1358, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1368 = fma(_1362, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1370 = -_495;
    float _1372 = _1370 + _1364;
    float _1374 = -_664;
    float _1376 = _1374 + _1366;
    float _1378 = -_838;
    float _1380 = _1378 + _1368;
    float _1382 = _1372 * _1372;
    float _1384 = fma(_1376, _1376, _1382);
    float _1386 = fma(_1380, _1380, _1384);
    float _1388 = sqrt(_1386);
    bool _1390 = _1388 > 0.0;
    float _1392 = _1362;
    float _1394 = _1388;
    float _1396 = _1368;
    if (!_1390)
    {
        _1284 = _1366;
    }
    float _1398 = _1284;
    float _1400 = _1398;
    float _1402 = _1398;
    if (!_1390)
    {
        _1392 = _1364;
    }
    float _1404 = _1392;
    float _1406 = _1404;
    if (!_1390)
    {
        _1394 = _1368;
    }
    float _1408 = _1394;
    bool _1410 = !_1390;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = _265 * _265;
        float _1416 = fma(_263, _263, _1414);
        float _1418 = rsqrt(_1386);
        float _1420 = fma(_267, _267, _1416);
        float _1422 = sqrt(_1420);
        float _1424 = _1376 * _1418;
        float _1426 = _1372 * _1418;
        float _1428 = _1380 * _1418;
        bool _1430 = _1422 > 0.0;
        float _1432 = _1422;
        float _1434 = _1418;
        _1180 = _1428;
        if (!_1430)
        {
            _1400 = _1366;
        }
        float _1436 = _1400;
        _1402 = _1436;
        if (!_1430)
        {
            _1432 = _1364;
        }
        float _1438 = _1432;
        _1406 = _1438;
        if (!_1430)
        {
            _1434 = _1368;
        }
        float _1440 = _1434;
        bool _1442 = !_1430;
        _1412 = _1440;
        if (!_1442)
        {
            float _1444 = rsqrt(_1420);
            float _1446 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1448 = _265 * _1444;
            float _1450 = _263 * _1444;
            float _1452 = _267 * _1444;
            float _1454 = _1426 * _1448;
            float _1456 = fma(_1424, _1450, _1454);
            float _1458 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1460 = fma(_1428, _1452, _1456);
            float _1462 = _1460 * _1458;
            float _1464 = fma(_263, _1462, _1366);
            float _1466 = fma(_265, _1462, _1364);
            float _1468 = fma(_267, _1462, _1368);
            _1406 = _1466;
            _1402 = _1464;
            _1412 = _1468;
        }
    }
    float _1470 = _1406;
    float _1472 = _1402;
    float _1474 = _1412;
    float _1476 = _1180;
    float _1478 = -_906;
    float _1480 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1470);
    float _1482 = -_908;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    float _1486 = -_924;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1492 = _1480 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1496 = _1484 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1500 = _1488 + _1498;
    float _1502 = _1492 * _1492;
    float _1504 = fma(_1496, _1496, _1502);
    float _1506 = fma(_1500, _1500, _1504);
    float _1508 = rsqrt(_1506);
    float _1510 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1512 = _1496 * _1510;
    float _1514 = _1500 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 * _1514;
    float _1520 = _1516 + _1518;
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1528 = _1522 + _1526;
    float _1530 = _1508;
    float _1532 = _1520;
    float _1534 = _1528;
    float _1536 = _1492;
    float _1538 = _1476;
    float _1540 = _1512;
    if (_1524)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1542;
    }
    float _1544 = _1530;
    if (_1524)
    {
        float _1546 = rsqrt(_1520);
        _1532 = _1546;
    }
    float _1548 = _1532;
    if (_1524)
    {
        float _1550 = _1528 * _1544;
        _1534 = _1550;
    }
    float _1552 = _1534;
    if (_1524)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1396 = _1554;
    }
    float _1556 = _1396;
    float _1558 = _1544;
    float _1560 = _1556;
    if (_1524)
    {
        float _1562 = _1556 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1500;
    float _1574 = _1570;
    if (_1524)
    {
        float _1576 = _1556 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1510;
    float _1584 = -_1570;
    float _1586 = fma(_1492, _1582, _1584);
    if (!_1524)
    {
        _1536 = _1514;
    }
    float _1588 = _1536;
    float _1590 = _1588;
    if (_1524)
    {
        float _1592 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1592;
    }
    float _1594 = _1574;
    float _1596 = _1566;
    float _1598 = _1594;
    if (_1524)
    {
        float _1600 = fma(_1566, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = _1602;
    float _1606 = _1580;
    if (_1524)
    {
        float _1608 = _1580 + (-1.0);
        _1598 = _1608;
    }
    float _1610 = _1598;
    float _1612 = _1610;
    if (_1524)
    {
        float _1614 = _1548 * _1602;
        _1538 = _1614;
    }
    float _1616 = _1538;
    if (!_1524)
    {
        _1604 = _1586;
    }
    float _1618 = _1604;
    float _1620 = sqrt(_1506);
    float _1622 = _1618;
    if (_1524)
    {
        float _1624 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1624;
    }
    float _1626 = _1560;
    if (_1524)
    {
        float _1628 = _1512 * _1616;
        _1540 = _1628;
    }
    float _1630 = _1540;
    if (!_1524)
    {
        _1612 = _1516;
    }
    float _1632 = _1612;
    float _1634 = _1632;
    if (_1524)
    {
        float _1636 = _1514 * _1616;
        _1590 = _1636;
    }
    float _1638 = _1590;
    if (_1524)
    {
        float _1640 = fma(_1586, _1580, _1626);
        _1622 = _1640;
    }
    float _1642 = _1622;
    if (_1524)
    {
        float _1644 = _1630 * _1630;
        _1634 = _1644;
    }
    float _1646 = _1634;
    if (!_1524)
    {
        _1606 = _1518;
    }
    float _1648 = _1606;
    float _1650 = _1648;
    if (_1524)
    {
        float _1652 = _1638 * _1638;
        _1650 = _1652;
    }
    float _1654 = _1650;
    float _1656 = fma(_1642, _1642, _1646);
    float _1658 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1660 = _1656 + _1654;
    float _1662 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1658);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1666 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1664);
    float _1668 = precise::clamp(_1666, 0.0, 1.0);
    float _1670 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1672 = rsqrt(_1660);
    float _1674 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1662);
    float _1676 = -_1668;
    float _1678 = _1676 + 1.0;
    float _1680 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1670);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1686 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1696 = abs(_1678);
    float _1698 = log2(_1696);
    float _1700 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1702 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1688);
    float _1704 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1706 = -_1694;
    float _1708 = fma(_1706, _1690, 1.0);
    float _1710 = _1672 * _1630;
    float _1712 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1700);
    float _1714 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1718 = _1672 * _1642;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1722 = _1672 * _1638;
    float _1724 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1716);
    float _1726 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1728 = -_1720;
    float _1730 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1728);
    float _1732 = log2(_1708);
    float _1734 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1736 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1738 = -_1722;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1730);
    float _1742 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1734);
    float _1746 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1748 = fma(_1740, -0.5, 0.5);
    float _1750 = exp2(_1736);
    float _1752 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1754 = fma(_1740, 0.5, 0.5);
    float _1756 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1746);
    float _1758 = _1718 + 1.0;
    float _1760 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1752);
    float _1762 = 1.0 / _1744;
    float _1764 = fma(_1754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1766 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1756);
    float _1768 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1760);
    float _1770 = fma(_1754, _1764, -0.212114393711090087890625);
    float _1772 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1766);
    float _1774 = sqrt(_1748);
    float _1776 = -_1718;
    float _1778 = fma(_1750, _1758, _1776);
    float _1780 = _1732 * 0.693147182464599609375;
    float _1782 = fma(_1754, _1770, 1.570728778839111328125);
    float _1784 = fma(_1778, 0.5, 0.5);
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1788 = _1768 * _1762;
    float _1790 = _1772 * _1762;
    float _1792 = fma(_1788, 0.5, 0.5);
    float _1794 = fma(_1790, -0.5, 0.5);
    float _1796 = _1774 * 0.636619746685028076171875;
    float3 _4661 = float3(_1792, _1794, _1786);
    float _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4661, float3(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4661, float3(0.0), isnan(_4661)), level(0.0)).x;
    float _1800 = -_1782;
    float _1802 = fma(_1796, _1800, 1.0);
    float3 _4677 = float3(_1792, _1794, _1786);
    float4 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4677, float3(0.0), isnan(_4677)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4677, float3(0.0), isnan(_4677)), level(0.0)).xyzw;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = _1805.w;
    float2 _4694 = float2(_1802, _1784);
    float3 _1817 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).xyz;
    float _1819 = _1817.x;
    float _1821 = _1817.y;
    float _1823 = _1817.z;
    float _1825 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1827 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1829);
    float _1835 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1833);
    float _1837 = _1835 + _1744;
    float _1839 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1768;
    out.gl_Position.y = _1772;
    out.gl_Position.z = _1835;
    out.gl_Position.w = _1744;
    float _1841 = _1837 * 0.5;
    float _1843 = -_1831;
    float _1845 = _1843 + 1.0;
    out.m_47.x = _1839;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1841;
    out.m_68.w = _1744;
    float _1849 = _1847 * _1798;
    float _1851 = -_1847;
    float _1853 = _1851 + 1.0;
    float _1855 = _1813 * _1849;
    float _1857 = _1813 * _1853;
    float _1859 = _1823 * _1849;
    float _1861 = fma(_1819, _1855, _1807);
    float _1863 = fma(_1821, _1855, _1809);
    float _1865 = fma(_1813, _1859, _1811);
    out.m_70.x = _1861;
    out.m_70.y = _1863;
    out.m_70.z = _1865;
    out.m_70.w = _1857;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1320 = false;
    bool _295 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_105);
        out.gl_Position.z = _1922;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1991 = as_type<float>(_143);
        out.gl_Position.z = _1991;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_56.x;
    float _155 = in.m_56.y;
    float _157 = in.m_56.z;
    float _159 = _149 * _147;
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_151) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_151) & 2;
    bool _169 = _167 != 0;
    float _171 = floor(_161);
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = _161 * 6.283185482025146484375;
    float _179 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _181 = !_169;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _177 * 0.15915493667125701904296875;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _191 = _189 != 0;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _195 = _193 != 0;
    float _197 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_175;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _205 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_191;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    int _217 = abs(_201);
    float _219 = -_171;
    float _221 = _161 + _219;
    int _223 = abs(_213);
    float _225 = -_221;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = float(_223);
    bool _233 = !_195;
    int _235 = _233 ? 0 : 1;
    float _237 = fma(_209, 0.5, 0.5);
    bool _239 = _221 < 0.5;
    float _241 = float(_239);
    float _243 = abs(_227);
    float _245 = _231 * _243;
    int _247 = abs(_235);
    float _249 = -_237;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_217);
    float _255 = -_241;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = float(_247);
    float _261 = fma(_253, _251, _245);
    float _263 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _265 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _267 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _215);
    float _269 = abs(_257);
    float _271 = fma(_259, _269, _261);
    bool _273 = !_165;
    float _275 = _273 ? (-0.5) : 0.5;
    bool _277 = !_229;
    float _293;
    if (!_277)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_89);
        float _299 = 1.0 / _297;
        float _301 = _123 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _307 = log2(_305);
    float _309 = _145 * 2.0;
    bool _311 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _319 = _315 || _317;
    float _321 = in.m_51.y;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _303 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _303 + _327;
    float _331 = floor(_309);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _303 + _333;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _339 = _307 * _123;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _345 = _337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _347 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _349 = isnan(1.0);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _355 = _351 || _353;
    float _357 = exp2(_339);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    float _363 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = in.m_44.x;
    float _367 = in.m_44.y;
    float _369 = in.m_44.z;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _381 = _379 != 0;
    bool _383 = _145 > 0.5;
    float _385 = 1.0 / _361;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _389 = _387 != 0;
    bool _391 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_303);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -_357;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_303);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = _319 ? _405 : 0.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _425;
    float _429 = 1.0 / _409;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _433 = _431 != 0;
    if (_355)
    {
        float _435 = _423 * _385;
        _127 = _435;
    }
    float _437 = _127;
    float _439 = -_275;
    int _441 = _383 ? as_type<int>(_439) : as_type<int>(_275);
    float _443 = in.m_51.z;
    bool _445 = _331 > 0.0;
    float _447 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _449 = _331 >= 0.0;
    bool _451 = isnan(_331);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = 1.0 / _427;
    float _461 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _463 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _465 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _471 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    float _473 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
    float _475 = _329 * _429;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _477;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _483 = 1.0 / _469;
    float _485 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _471);
    float _487 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _489 = _325 * _459;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _493 = _303 + _491;
    float _495 = _485 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _497 = 1.0 / _479;
    float _499 = _321 + _443;
    out.m_58.x = _487;
    out.m_58.y = _345;
    out.m_58.z = _363;
    out.m_58.w = _343;
    float _501 = _145 + _443;
    float _503 = _499 + (-1.0);
    float _505 = _501 + (-1.0);
    float _507 = _493 * _483;
    float _509 = _461 * _145;
    float _511 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _513 = _145 + _321;
    float _515 = _321 * 2.0;
    float _517 = _443 * 2.0;
    float _519 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _521 = trunc(_509);
    int _523 = int(_521);
    float _525 = _513 + (-1.0);
    float _527 = _335 * _497;
    float _529 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _531;
    float _535 = floor(_515);
    int _537 = _523 << 4;
    int _539 = _537 + 1968;
    float _541 = floor(_517);
    bool _543 = !_389;
    float _545 = _543 ? _275 : as_type<float>(_441);
    float _547 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    uint _550 = uint(int(uint(_539) >> uint(2)));
    uint _552 = uint(int(uint(int(_550)) >> uint(2)));
    int _554 = int(_550) & 3;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[int(_552)][_554];
    int _558 = int(_550) + 1;
    uint _560 = uint(int(uint(_558) >> uint(2)));
    int _562 = _558 & 3;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[int(_560)][_562];
    int _566 = _457 ? 0 : 1;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _568;
    bool _572 = _535 >= 0.0;
    bool _574 = isnan(_535);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    int _582 = ~_566;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    float _588 = fma(_570, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _590 = _539 + 8;
    uint _592 = uint(int(uint(_590) >> uint(2)));
    uint _594 = uint(int(uint(int(_592)) >> uint(2)));
    int _596 = int(_592) & 3;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[int(_594)][_596];
    int _600 = _586;
    if (!_445)
    {
        int _602 = ~_566;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    int _608 = _580 ? 0 : 1;
    bool _610 = _541 > 0.0;
    bool _612 = _541 >= 0.0;
    bool _614 = isnan(_541);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _624 = isnan(_303);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    bool _634 = _535 > 0.0;
    float _636 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _511);
    float _638 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    float _640 = -_632;
    float _642 = _640 + 1.0;
    float _644 = fma(_533, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _646 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _648 = isnan(_303);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_401;
    float _660 = _658 + 1.0;
    float _662 = _401 * _642;
    float _664 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _666 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_303);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_656;
    float _680 = _678 + 1.0;
    float _682 = _656 * _660;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _696;
    float _700 = _676 * _680;
    float _702 = -_676;
    float _704 = _702 + 1.0;
    float _706 = fma(_686, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _708 = fma(_690, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _710 = fma(_694, _527, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _712 = fma(_698, _527, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _714 = _421 * _704;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _718 = -_421;
    float _720 = _718 + 1.0;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _730 = _644 * _714;
    float _732 = _588 * _714;
    int _734 = _620 ? 0 : 1;
    float _736 = fma(_724, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _738 = fma(_728, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _742 = _545 + 0.5;
    int _744 = ~_734;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    float _750 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _752 = ~_608;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    float _758 = _598 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _760 = _748;
    int _762 = _756;
    if (!_610)
    {
        int _764 = ~_734;
        int _766 = _764 + 1;
        _760 = _766;
    }
    int _768 = _760;
    float _770 = _564 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_634)
    {
        int _772 = ~_608;
        int _774 = _772 + 1;
        _762 = _774;
    }
    int _776 = _762;
    float _778 = _742 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _780 = _321 > 0.5;
    float _782 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _732);
    float _786 = _778 * _716;
    float _788 = -_183;
    int _790 = _780 ? as_type<int>(_788) : as_type<int>(_183);
    float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _794 = !_377;
    int _796 = _794 ? 0 : 1;
    float _798 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _802 = !_433;
    float _804 = _802 ? _183 : as_type<float>(_790);
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _664 + _806;
    int _810 = abs(_796);
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _814 = _495 + _812;
    out.m_60.x = _782;
    out.m_60.y = _798;
    out.m_60.z = _800;
    float _816 = fma(_706, _700, _740);
    float _818 = float(_606);
    float _820 = _321 + (-0.5);
    float _822 = in.m_62.x;
    float _824 = in.m_62.y;
    float _826 = in.m_62.z;
    float _828 = float(_768);
    float _830 = fma(_708, _700, _784);
    float _832 = float(_776);
    float _834 = -_804;
    float _836 = _834 + 0.5;
    float _838 = _638 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = _814 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _846 = _838 + _844;
    float _848 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _850 = _842 * _792;
    float _852 = float(_810);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _848);
    float _856 = _814 * _814;
    out.m_64.x = _786;
    out.m_64.y = _850;
    float _858 = _852 * _818;
    float _860 = fma(_808, _808, _856);
    bool _862 = _854 >= 0.0;
    bool _864 = !_373;
    int _866 = _864 ? 0 : 1;
    float _868 = fma(_846, _846, _860);
    float _870 = _858 * (-2.0);
    bool _872 = !_381;
    int _874 = _872 ? 0 : 1;
    float _876 = rsqrt(_868);
    int _878 = abs(_866);
    float _880 = fma(_870, _824, _824);
    float _882 = fma(_519, _870, _519);
    int _884 = abs(_874);
    float _886 = _870;
    if (_862)
    {
        _886 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _888 = _886;
    float _890 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _880);
    float _892 = float(_878);
    int _894 = as_type<int>(_888);
    if (_862)
    {
        out.m_47.x = 0.0;
    }
    if (_862)
    {
        float _896 = _888 * 5.0;
        _894 = as_type<int>(_896);
    }
    int _898 = _894;
    float _900 = _892 * _828;
    float _902 = float(_884);
    float _904 = fma(_882, _437, _890);
    float _906 = _814 * _876;
    if (_862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3190 = as_type<float>(_898);
        out.gl_Position.z = _3190;
    }
    float _908 = _808 * _876;
    float _910 = _902 * _832;
    float _912 = -_906;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    if (_862)
    {
        return out;
    }
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _920 = -_908;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _924 = _846 * _876;
    float _926 = _904 * 0.15915493667125701904296875;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _918 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _922 + _932;
    float _936 = -_924;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    float _940 = _900 * (-2.0);
    float _942 = _930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _944 = _910 * (-2.0);
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _948 = _938 + _946;
    float _950 = fma(_529, _940, _529);
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _942);
    float _954 = _145 + (-0.5);
    float _956 = fma(_940, _822, _822);
    float _958 = -_908;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _964 = _914 * _914;
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _956);
    float _968 = fma(_710, _682, _816);
    float _970 = in.m_66.x;
    float _972 = in.m_66.y;
    float _974 = fma(_944, _826, _826);
    float _976 = _443 + (-0.5);
    bool _978 = _962 >= 0.0;
    float _980 = fma(_960, _960, _964);
    float _982 = -_924;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _986 = fma(_547, _944, _547);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].z, _974);
    float _990 = fma(_712, _682, _830);
    float _992 = fma(_984, _984, _980);
    float _994 = fma(_950, _437, _966);
    float _996 = fma(_986, _437, _988);
    float _998 = fma(_738, _662, _990);
    float _1000 = sqrt(_992);
    float _1002 = fma(_736, _662, _968);
    float _1004 = _994 * 0.15915493667125701904296875;
    float _1006 = _996 * 0.15915493667125701904296875;
    float _1008 = _986;
    if (_978)
    {
        _1008 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1010 = _1008;
    float _1012 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[147].y, _998);
    float _1014 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1002);
    float _1016 = _926 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    int _1020 = as_type<int>(_1010);
    if (_978)
    {
        float _1022 = _1010 * 5.0;
        _1020 = as_type<int>(_1022);
    }
    int _1024 = _1020;
    if (_978)
    {
        out.m_47.x = 0.0;
    }
    float _1026 = _1012 * _972;
    if (_978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3406 = as_type<float>(_1024);
        out.gl_Position.z = _3406;
    }
    float _1028 = _926 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _876 * _1000;
    float _1034 = _271 * _1026;
    float _1036 = _1004 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1004 * 6.283185482025146484375;
    float _1042 = cos(_1040);
    float _1044 = _1006 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    if (_978)
    {
        return out;
    }
    float _1048 = _1006 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1054 = _1014 * _970;
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _275);
    float _1060 = _1032 * _1052;
    float _1062 = _271 * _1054;
    float _1064 = _1042 * _1030;
    float _1066 = _1056 * _1060;
    float _1068 = _1062 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1070 = _1038 * _1018;
    float _1072 = _1032 * _1068;
    float _1074 = fma(_1046, _1064, _1070);
    float _1076 = _1050 * _1066;
    float _1078 = _1038 * _1030;
    float _1080 = _1058 * _1072;
    float _1082 = _1042 * _1018;
    float _1084 = _1042 * _1076;
    float _1086 = _1018 * _1050;
    float _1088 = _1030 * _1050;
    float _1090 = _1038 * _1076;
    float _1092 = fma(_1074, _1080, _1084);
    float _1094 = -_1066;
    float _1096 = _1046 * _1094;
    float _1098 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1100 = _1098 * 0.5;
    float _1102 = -_1078;
    float _1104 = fma(_1046, _1082, _1102);
    float _1106 = -_1082;
    float _1108 = fma(_1046, _1078, _1106);
    float _1110 = fma(_1088, _1080, _1096);
    float _1112 = fma(_1046, _1070, _1064);
    float _1114 = fma(_1104, _1100, _1092);
    float _1116 = fma(_1108, _1080, _1090);
    float _1118 = fma(_1086, _1100, _1110);
    float _1120 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1124 = fma(_1112, _1100, _1116);
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1122);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1126);
    float _1134 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1136 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1138 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1132);
    float _1140 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1146 = _664 + _1140;
    float _1148 = _838 + _1142;
    float _1150 = _495 + _1144;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1146 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1158 = _1148 + _1156;
    float _1160 = _1154 * _1154;
    float _1162 = _1158 * _1158;
    float _1164 = _1160 + _1162;
    float _1166 = sqrt(_1164);
    bool _1168 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1144;
    float _1172 = _1160;
    float _1174 = _1126;
    float _1176 = _1146;
    float _1178 = _1124;
    float _1180 = _1162;
    if (!_1168)
    {
        _1170 = _1160;
    }
    float _1182 = _1170;
    float _1184 = _1182;
    if (!_1168)
    {
        _1172 = _1146;
    }
    float _1186 = _1172;
    float _1188 = _1186;
    if (!_1168)
    {
        _1174 = _1162;
    }
    float _1190 = _1174;
    float _1192 = _1190;
    if (!_1168)
    {
        _1176 = _1148;
    }
    float _1194 = _1176;
    float _1196 = _1194;
    if (!_1168)
    {
        _1178 = _1150;
    }
    float _1198 = _1178;
    bool _1200 = !_1168;
    float _1202 = _1198;
    if (!_1200)
    {
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1208 = _1166 + _1206;
        float _1210 = rsqrt(_1164);
        float _1212 = _1208 * _1204;
        float _1214 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = _1212 * 0.15915493667125701904296875;
        float _1218 = _1216 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        float _1222 = _1216 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = fma(_1220, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = _1210 * _1226;
        float _1230 = _1224 + (-1.0);
        float _1232 = fma(_1154, _1228, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1234 = fma(_1158, _1228, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1236 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1240 = _1232 + _1238;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1244 = _1234 + _1242;
        float _1246 = fma(_1150, _1224, _1236);
        float _1248 = _1240 * _1240;
        float _1250 = _1244 * _1244;
        _1202 = _1246;
        _1184 = _1248;
        _1192 = _1250;
        _1188 = _1232;
        _1196 = _1234;
    }
    float _1252 = _1202;
    float _1254 = _1184;
    float _1256 = _1192;
    float _1258 = _1188;
    float _1260 = _1196;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1264 = _1252 + _1262;
    float _1266 = fma(_1264, _1264, _1254);
    float _1268 = _1266 + _1256;
    float _1270 = sqrt(_1268);
    bool _1272 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1274 = isnan(_1270);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1280 = _1276 || _1278;
    float _1282 = _1254;
    float _1284 = _1252;
    if (!_1280)
    {
        _1282 = 1.0;
    }
    float _1286 = _1282;
    bool _1288 = !_1280;
    float _1290 = _1286;
    if (!_1288)
    {
        bool _1292 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1294 = isnan(_1270);
        bool _1296 = _1292 || _1294;
        bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1300 = _1296 || _1298;
        if (!_1300)
        {
            float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1304 = _1270 + _1302;
            float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1308 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1306;
            float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1312 = _1310 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1314 = 1.0 / _1308;
            float _1316 = _1304 * _1314;
            float _1318 = fma(_1316, _1312, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1290 = _1318;
            _1320 = true;
        }
        else
        {
            bool _1322 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1324 = isnan(_1270);
            bool _1326 = _1322 || _1324;
            bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1330 = _1326 || _1328;
            if (!_1330)
            {
                float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1334 = _1270 + _1332;
                float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1338 = _1336 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1344 = 1.0 / _1338;
                float _1346 = _1334 * _1344;
                float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1290 = _1348;
                _1320 = true;
            }
            else
            {
                _1290 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1320 = false;
    float _1350 = _1290;
    float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1354 = _1252 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1358 = _1258 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1362 = _1260 + _1360;
    float _1364 = fma(_1354, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1366 = fma(_1358, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1368 = fma(_1362, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1370 = -_495;
    float _1372 = _1370 + _1364;
    float _1374 = -_664;
    float _1376 = _1374 + _1366;
    float _1378 = -_838;
    float _1380 = _1378 + _1368;
    float _1382 = _1372 * _1372;
    float _1384 = fma(_1376, _1376, _1382);
    float _1386 = fma(_1380, _1380, _1384);
    float _1388 = sqrt(_1386);
    bool _1390 = _1388 > 0.0;
    float _1392 = _1362;
    float _1394 = _1388;
    float _1396 = _1368;
    if (!_1390)
    {
        _1284 = _1366;
    }
    float _1398 = _1284;
    float _1400 = _1398;
    float _1402 = _1398;
    if (!_1390)
    {
        _1392 = _1364;
    }
    float _1404 = _1392;
    float _1406 = _1404;
    if (!_1390)
    {
        _1394 = _1368;
    }
    float _1408 = _1394;
    bool _1410 = !_1390;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = _265 * _265;
        float _1416 = fma(_263, _263, _1414);
        float _1418 = rsqrt(_1386);
        float _1420 = fma(_267, _267, _1416);
        float _1422 = sqrt(_1420);
        float _1424 = _1376 * _1418;
        float _1426 = _1372 * _1418;
        float _1428 = _1380 * _1418;
        bool _1430 = _1422 > 0.0;
        float _1432 = _1422;
        float _1434 = _1418;
        _1180 = _1428;
        if (!_1430)
        {
            _1400 = _1366;
        }
        float _1436 = _1400;
        _1402 = _1436;
        if (!_1430)
        {
            _1432 = _1364;
        }
        float _1438 = _1432;
        _1406 = _1438;
        if (!_1430)
        {
            _1434 = _1368;
        }
        float _1440 = _1434;
        bool _1442 = !_1430;
        _1412 = _1440;
        if (!_1442)
        {
            float _1444 = rsqrt(_1420);
            float _1446 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1448 = _265 * _1444;
            float _1450 = _263 * _1444;
            float _1452 = _267 * _1444;
            float _1454 = _1426 * _1448;
            float _1456 = fma(_1424, _1450, _1454);
            float _1458 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1460 = fma(_1428, _1452, _1456);
            float _1462 = _1460 * _1458;
            float _1464 = fma(_263, _1462, _1366);
            float _1466 = fma(_265, _1462, _1364);
            float _1468 = fma(_267, _1462, _1368);
            _1406 = _1466;
            _1402 = _1464;
            _1412 = _1468;
        }
    }
    float _1470 = _1406;
    float _1472 = _1402;
    float _1474 = _1412;
    float _1476 = _1180;
    float _1478 = -_906;
    float _1480 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1470);
    float _1482 = -_908;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    float _1486 = -_924;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1492 = _1480 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1496 = _1484 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1500 = _1488 + _1498;
    float _1502 = _1492 * _1492;
    float _1504 = fma(_1496, _1496, _1502);
    float _1506 = fma(_1500, _1500, _1504);
    float _1508 = rsqrt(_1506);
    float _1510 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1512 = _1496 * _1510;
    float _1514 = _1500 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 * _1514;
    float _1520 = _1516 + _1518;
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1528 = _1522 + _1526;
    float _1530 = _1508;
    float _1532 = _1520;
    float _1534 = _1528;
    float _1536 = _1492;
    float _1538 = _1476;
    float _1540 = _1512;
    if (_1524)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1542;
    }
    float _1544 = _1530;
    if (_1524)
    {
        float _1546 = rsqrt(_1520);
        _1532 = _1546;
    }
    float _1548 = _1532;
    if (_1524)
    {
        float _1550 = _1528 * _1544;
        _1534 = _1550;
    }
    float _1552 = _1534;
    if (_1524)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1396 = _1554;
    }
    float _1556 = _1396;
    float _1558 = _1544;
    float _1560 = _1556;
    if (_1524)
    {
        float _1562 = _1556 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1500;
    float _1574 = _1570;
    if (_1524)
    {
        float _1576 = _1556 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1510;
    float _1584 = -_1570;
    float _1586 = fma(_1492, _1582, _1584);
    if (!_1524)
    {
        _1536 = _1514;
    }
    float _1588 = _1536;
    float _1590 = _1588;
    if (_1524)
    {
        float _1592 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1592;
    }
    float _1594 = _1574;
    float _1596 = _1566;
    float _1598 = _1594;
    if (_1524)
    {
        float _1600 = fma(_1566, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = _1602;
    float _1606 = _1580;
    if (_1524)
    {
        float _1608 = _1580 + (-1.0);
        _1598 = _1608;
    }
    float _1610 = _1598;
    float _1612 = _1610;
    if (_1524)
    {
        float _1614 = _1548 * _1602;
        _1538 = _1614;
    }
    float _1616 = _1538;
    if (!_1524)
    {
        _1604 = _1586;
    }
    float _1618 = _1604;
    float _1620 = sqrt(_1506);
    float _1622 = _1618;
    if (_1524)
    {
        float _1624 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1624;
    }
    float _1626 = _1560;
    if (_1524)
    {
        float _1628 = _1512 * _1616;
        _1540 = _1628;
    }
    float _1630 = _1540;
    if (!_1524)
    {
        _1612 = _1516;
    }
    float _1632 = _1612;
    float _1634 = _1632;
    if (_1524)
    {
        float _1636 = _1514 * _1616;
        _1590 = _1636;
    }
    float _1638 = _1590;
    if (_1524)
    {
        float _1640 = fma(_1586, _1580, _1626);
        _1622 = _1640;
    }
    float _1642 = _1622;
    if (_1524)
    {
        float _1644 = _1630 * _1630;
        _1634 = _1644;
    }
    float _1646 = _1634;
    if (!_1524)
    {
        _1606 = _1518;
    }
    float _1648 = _1606;
    float _1650 = _1648;
    if (_1524)
    {
        float _1652 = _1638 * _1638;
        _1650 = _1652;
    }
    float _1654 = _1650;
    float _1656 = fma(_1642, _1642, _1646);
    float _1658 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1660 = _1656 + _1654;
    float _1662 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1658);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1666 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1664);
    float _1668 = precise::clamp(_1666, 0.0, 1.0);
    float _1670 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1672 = rsqrt(_1660);
    float _1674 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1662);
    float _1676 = -_1668;
    float _1678 = _1676 + 1.0;
    float _1680 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1670);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1686 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1696 = abs(_1678);
    float _1698 = log2(_1696);
    float _1700 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1702 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1688);
    float _1704 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1706 = -_1694;
    float _1708 = fma(_1706, _1690, 1.0);
    float _1710 = _1672 * _1630;
    float _1712 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1700);
    float _1714 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1718 = _1672 * _1642;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1722 = _1672 * _1638;
    float _1724 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1716);
    float _1726 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1728 = -_1720;
    float _1730 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1728);
    float _1732 = log2(_1708);
    float _1734 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1736 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1738 = -_1722;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1730);
    float _1742 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1734);
    float _1746 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1748 = fma(_1740, -0.5, 0.5);
    float _1750 = exp2(_1736);
    float _1752 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1754 = fma(_1740, 0.5, 0.5);
    float _1756 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1746);
    float _1758 = _1718 + 1.0;
    float _1760 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1752);
    float _1762 = 1.0 / _1744;
    float _1764 = fma(_1754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1766 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1756);
    float _1768 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1760);
    float _1770 = fma(_1754, _1764, -0.212114393711090087890625);
    float _1772 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1766);
    float _1774 = sqrt(_1748);
    float _1776 = -_1718;
    float _1778 = fma(_1750, _1758, _1776);
    float _1780 = _1732 * 0.693147182464599609375;
    float _1782 = fma(_1754, _1770, 1.570728778839111328125);
    float _1784 = fma(_1778, 0.5, 0.5);
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1788 = _1768 * _1762;
    float _1790 = _1772 * _1762;
    float _1792 = fma(_1788, 0.5, 0.5);
    float _1794 = fma(_1790, -0.5, 0.5);
    float _1796 = _1774 * 0.636619746685028076171875;
    float3 _4661 = float3(_1792, _1794, _1786);
    float _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4661, float3(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4661, float3(0.0), isnan(_4661)), level(0.0)).x;
    float _1800 = -_1782;
    float _1802 = fma(_1796, _1800, 1.0);
    float3 _4677 = float3(_1792, _1794, _1786);
    float4 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4677, float3(0.0), isnan(_4677)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4677, float3(0.0), isnan(_4677)), level(0.0)).xyzw;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = _1805.w;
    float2 _4694 = float2(_1802, _1784);
    float3 _1817 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).xyz;
    float _1819 = _1817.x;
    float _1821 = _1817.y;
    float _1823 = _1817.z;
    float _1825 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1827 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1829);
    float _1835 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1833);
    float _1837 = _1835 + _1744;
    float _1839 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1768;
    out.gl_Position.y = _1772;
    out.gl_Position.z = _1835;
    out.gl_Position.w = _1744;
    float _1841 = _1837 * 0.5;
    float _1843 = -_1831;
    float _1845 = _1843 + 1.0;
    out.m_47.x = _1839;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1841;
    out.m_68.w = _1744;
    float _1849 = _1847 * _1798;
    float _1851 = -_1847;
    float _1853 = _1851 + 1.0;
    float _1855 = _1813 * _1849;
    float _1857 = _1813 * _1853;
    float _1859 = _1823 * _1849;
    float _1861 = fma(_1819, _1855, _1807);
    float _1863 = fma(_1821, _1855, _1809);
    float _1865 = fma(_1813, _1859, _1811);
    out.m_70.x = _1861;
    out.m_70.y = _1863;
    out.m_70.z = _1865;
    out.m_70.w = _1857;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1320 = false;
    bool _295 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_105);
        out.gl_Position.z = _1922;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1991 = as_type<float>(_143);
        out.gl_Position.z = _1991;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_56.x;
    float _155 = in.m_56.y;
    float _157 = in.m_56.z;
    float _159 = _149 * _147;
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_151) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_151) & 2;
    bool _169 = _167 != 0;
    float _171 = floor(_161);
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = _161 * 6.283185482025146484375;
    float _179 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _181 = !_169;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _177 * 0.15915493667125701904296875;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _191 = _189 != 0;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _195 = _193 != 0;
    float _197 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_175;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _205 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_191;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    int _217 = abs(_201);
    float _219 = -_171;
    float _221 = _161 + _219;
    int _223 = abs(_213);
    float _225 = -_221;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = float(_223);
    bool _233 = !_195;
    int _235 = _233 ? 0 : 1;
    float _237 = fma(_209, 0.5, 0.5);
    bool _239 = _221 < 0.5;
    float _241 = float(_239);
    float _243 = abs(_227);
    float _245 = _231 * _243;
    int _247 = abs(_235);
    float _249 = -_237;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_217);
    float _255 = -_241;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = float(_247);
    float _261 = fma(_253, _251, _245);
    float _263 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _265 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _267 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _215);
    float _269 = abs(_257);
    float _271 = fma(_259, _269, _261);
    bool _273 = !_165;
    float _275 = _273 ? (-0.5) : 0.5;
    bool _277 = !_229;
    float _293;
    if (!_277)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_89);
        float _299 = 1.0 / _297;
        float _301 = _123 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _307 = log2(_305);
    float _309 = _145 * 2.0;
    bool _311 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _319 = _315 || _317;
    float _321 = in.m_51.y;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _303 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _303 + _327;
    float _331 = floor(_309);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _303 + _333;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _339 = _307 * _123;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _345 = _337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _347 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _349 = isnan(1.0);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _355 = _351 || _353;
    float _357 = exp2(_339);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    float _363 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = in.m_44.x;
    float _367 = in.m_44.y;
    float _369 = in.m_44.z;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _381 = _379 != 0;
    bool _383 = _145 > 0.5;
    float _385 = 1.0 / _361;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _389 = _387 != 0;
    bool _391 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_303);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -_357;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_303);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = _319 ? _405 : 0.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _425;
    float _429 = 1.0 / _409;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _433 = _431 != 0;
    if (_355)
    {
        float _435 = _423 * _385;
        _127 = _435;
    }
    float _437 = _127;
    float _439 = -_275;
    int _441 = _383 ? as_type<int>(_439) : as_type<int>(_275);
    float _443 = in.m_51.z;
    bool _445 = _331 > 0.0;
    float _447 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _449 = _331 >= 0.0;
    bool _451 = isnan(_331);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = 1.0 / _427;
    float _461 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _463 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _465 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _471 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    float _473 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
    float _475 = _329 * _429;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _477;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _483 = 1.0 / _469;
    float _485 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _471);
    float _487 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _489 = _325 * _459;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _493 = _303 + _491;
    float _495 = _485 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _497 = 1.0 / _479;
    float _499 = _321 + _443;
    out.m_58.x = _487;
    out.m_58.y = _345;
    out.m_58.z = _363;
    out.m_58.w = _343;
    float _501 = _145 + _443;
    float _503 = _499 + (-1.0);
    float _505 = _501 + (-1.0);
    float _507 = _493 * _483;
    float _509 = _461 * _145;
    float _511 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _513 = _145 + _321;
    float _515 = _321 * 2.0;
    float _517 = _443 * 2.0;
    float _519 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _521 = trunc(_509);
    int _523 = int(_521);
    float _525 = _513 + (-1.0);
    float _527 = _335 * _497;
    float _529 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _531;
    float _535 = floor(_515);
    int _537 = _523 << 4;
    int _539 = _537 + 1968;
    float _541 = floor(_517);
    bool _543 = !_389;
    float _545 = _543 ? _275 : as_type<float>(_441);
    float _547 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    uint _550 = uint(int(uint(_539) >> uint(2)));
    uint _552 = uint(int(uint(int(_550)) >> uint(2)));
    int _554 = int(_550) & 3;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[int(_552)][_554];
    int _558 = int(_550) + 1;
    uint _560 = uint(int(uint(_558) >> uint(2)));
    int _562 = _558 & 3;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[int(_560)][_562];
    int _566 = _457 ? 0 : 1;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _568;
    bool _572 = _535 >= 0.0;
    bool _574 = isnan(_535);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    int _582 = ~_566;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    float _588 = fma(_570, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _590 = _539 + 8;
    uint _592 = uint(int(uint(_590) >> uint(2)));
    uint _594 = uint(int(uint(int(_592)) >> uint(2)));
    int _596 = int(_592) & 3;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[int(_594)][_596];
    int _600 = _586;
    if (!_445)
    {
        int _602 = ~_566;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    int _608 = _580 ? 0 : 1;
    bool _610 = _541 > 0.0;
    bool _612 = _541 >= 0.0;
    bool _614 = isnan(_541);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _624 = isnan(_303);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    bool _634 = _535 > 0.0;
    float _636 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _511);
    float _638 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    float _640 = -_632;
    float _642 = _640 + 1.0;
    float _644 = fma(_533, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _646 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _648 = isnan(_303);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_401;
    float _660 = _658 + 1.0;
    float _662 = _401 * _642;
    float _664 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _666 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_303);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_656;
    float _680 = _678 + 1.0;
    float _682 = _656 * _660;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _696;
    float _700 = _676 * _680;
    float _702 = -_676;
    float _704 = _702 + 1.0;
    float _706 = fma(_686, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _708 = fma(_690, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _710 = fma(_694, _527, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _712 = fma(_698, _527, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _714 = _421 * _704;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _718 = -_421;
    float _720 = _718 + 1.0;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _730 = _644 * _714;
    float _732 = _588 * _714;
    int _734 = _620 ? 0 : 1;
    float _736 = fma(_724, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _738 = fma(_728, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _742 = _545 + 0.5;
    int _744 = ~_734;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    float _750 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _752 = ~_608;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    float _758 = _598 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _760 = _748;
    int _762 = _756;
    if (!_610)
    {
        int _764 = ~_734;
        int _766 = _764 + 1;
        _760 = _766;
    }
    int _768 = _760;
    float _770 = _564 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_634)
    {
        int _772 = ~_608;
        int _774 = _772 + 1;
        _762 = _774;
    }
    int _776 = _762;
    float _778 = _742 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _780 = _321 > 0.5;
    float _782 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _732);
    float _786 = _778 * _716;
    float _788 = -_183;
    int _790 = _780 ? as_type<int>(_788) : as_type<int>(_183);
    float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _794 = !_377;
    int _796 = _794 ? 0 : 1;
    float _798 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _802 = !_433;
    float _804 = _802 ? _183 : as_type<float>(_790);
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _664 + _806;
    int _810 = abs(_796);
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _814 = _495 + _812;
    out.m_60.x = _782;
    out.m_60.y = _798;
    out.m_60.z = _800;
    float _816 = fma(_706, _700, _740);
    float _818 = float(_606);
    float _820 = _321 + (-0.5);
    float _822 = in.m_62.x;
    float _824 = in.m_62.y;
    float _826 = in.m_62.z;
    float _828 = float(_768);
    float _830 = fma(_708, _700, _784);
    float _832 = float(_776);
    float _834 = -_804;
    float _836 = _834 + 0.5;
    float _838 = _638 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = _814 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _846 = _838 + _844;
    float _848 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _850 = _842 * _792;
    float _852 = float(_810);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _848);
    float _856 = _814 * _814;
    out.m_64.x = _786;
    out.m_64.y = _850;
    float _858 = _852 * _818;
    float _860 = fma(_808, _808, _856);
    bool _862 = _854 >= 0.0;
    bool _864 = !_373;
    int _866 = _864 ? 0 : 1;
    float _868 = fma(_846, _846, _860);
    float _870 = _858 * (-2.0);
    bool _872 = !_381;
    int _874 = _872 ? 0 : 1;
    float _876 = rsqrt(_868);
    int _878 = abs(_866);
    float _880 = fma(_870, _824, _824);
    float _882 = fma(_519, _870, _519);
    int _884 = abs(_874);
    float _886 = _870;
    if (_862)
    {
        _886 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _888 = _886;
    float _890 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _880);
    float _892 = float(_878);
    int _894 = as_type<int>(_888);
    if (_862)
    {
        out.m_47.x = 0.0;
    }
    if (_862)
    {
        float _896 = _888 * 5.0;
        _894 = as_type<int>(_896);
    }
    int _898 = _894;
    float _900 = _892 * _828;
    float _902 = float(_884);
    float _904 = fma(_882, _437, _890);
    float _906 = _814 * _876;
    if (_862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3190 = as_type<float>(_898);
        out.gl_Position.z = _3190;
    }
    float _908 = _808 * _876;
    float _910 = _902 * _832;
    float _912 = -_906;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    if (_862)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _920 = -_908;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _924 = _846 * _876;
    float _926 = _904 * 0.15915493667125701904296875;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _918 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _922 + _932;
    float _936 = -_924;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    float _940 = _900 * (-2.0);
    float _942 = _930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _944 = _910 * (-2.0);
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _948 = _938 + _946;
    float _950 = fma(_529, _940, _529);
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _942);
    float _954 = _145 + (-0.5);
    float _956 = fma(_940, _822, _822);
    float _958 = -_908;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _964 = _914 * _914;
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _956);
    float _968 = fma(_710, _682, _816);
    float _970 = in.m_66.x;
    float _972 = in.m_66.y;
    float _974 = fma(_944, _826, _826);
    float _976 = _443 + (-0.5);
    bool _978 = _962 >= 0.0;
    float _980 = fma(_960, _960, _964);
    float _982 = -_924;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _986 = fma(_547, _944, _547);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].z, _974);
    float _990 = fma(_712, _682, _830);
    float _992 = fma(_984, _984, _980);
    float _994 = fma(_950, _437, _966);
    float _996 = fma(_986, _437, _988);
    float _998 = fma(_738, _662, _990);
    float _1000 = sqrt(_992);
    float _1002 = fma(_736, _662, _968);
    float _1004 = _994 * 0.15915493667125701904296875;
    float _1006 = _996 * 0.15915493667125701904296875;
    float _1008 = _986;
    if (_978)
    {
        _1008 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1010 = _1008;
    float _1012 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[147].y, _998);
    float _1014 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1002);
    float _1016 = _926 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    int _1020 = as_type<int>(_1010);
    if (_978)
    {
        float _1022 = _1010 * 5.0;
        _1020 = as_type<int>(_1022);
    }
    int _1024 = _1020;
    if (_978)
    {
        out.m_47.x = 0.0;
    }
    float _1026 = _1012 * _972;
    if (_978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3406 = as_type<float>(_1024);
        out.gl_Position.z = _3406;
    }
    float _1028 = _926 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _876 * _1000;
    float _1034 = _271 * _1026;
    float _1036 = _1004 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1004 * 6.283185482025146484375;
    float _1042 = cos(_1040);
    float _1044 = _1006 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    if (_978)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1048 = _1006 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1054 = _1014 * _970;
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _275);
    float _1060 = _1032 * _1052;
    float _1062 = _271 * _1054;
    float _1064 = _1042 * _1030;
    float _1066 = _1056 * _1060;
    float _1068 = _1062 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1070 = _1038 * _1018;
    float _1072 = _1032 * _1068;
    float _1074 = fma(_1046, _1064, _1070);
    float _1076 = _1050 * _1066;
    float _1078 = _1038 * _1030;
    float _1080 = _1058 * _1072;
    float _1082 = _1042 * _1018;
    float _1084 = _1042 * _1076;
    float _1086 = _1018 * _1050;
    float _1088 = _1030 * _1050;
    float _1090 = _1038 * _1076;
    float _1092 = fma(_1074, _1080, _1084);
    float _1094 = -_1066;
    float _1096 = _1046 * _1094;
    float _1098 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1100 = _1098 * 0.5;
    float _1102 = -_1078;
    float _1104 = fma(_1046, _1082, _1102);
    float _1106 = -_1082;
    float _1108 = fma(_1046, _1078, _1106);
    float _1110 = fma(_1088, _1080, _1096);
    float _1112 = fma(_1046, _1070, _1064);
    float _1114 = fma(_1104, _1100, _1092);
    float _1116 = fma(_1108, _1080, _1090);
    float _1118 = fma(_1086, _1100, _1110);
    float _1120 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1124 = fma(_1112, _1100, _1116);
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1122);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1126);
    float _1134 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1136 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1138 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1132);
    float _1140 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1146 = _664 + _1140;
    float _1148 = _838 + _1142;
    float _1150 = _495 + _1144;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1146 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1158 = _1148 + _1156;
    float _1160 = _1154 * _1154;
    float _1162 = _1158 * _1158;
    float _1164 = _1160 + _1162;
    float _1166 = sqrt(_1164);
    bool _1168 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1144;
    float _1172 = _1160;
    float _1174 = _1126;
    float _1176 = _1146;
    float _1178 = _1124;
    float _1180 = _1162;
    if (!_1168)
    {
        _1170 = _1160;
    }
    float _1182 = _1170;
    float _1184 = _1182;
    if (!_1168)
    {
        _1172 = _1146;
    }
    float _1186 = _1172;
    float _1188 = _1186;
    if (!_1168)
    {
        _1174 = _1162;
    }
    float _1190 = _1174;
    float _1192 = _1190;
    if (!_1168)
    {
        _1176 = _1148;
    }
    float _1194 = _1176;
    float _1196 = _1194;
    if (!_1168)
    {
        _1178 = _1150;
    }
    float _1198 = _1178;
    bool _1200 = !_1168;
    float _1202 = _1198;
    if (!_1200)
    {
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1208 = _1166 + _1206;
        float _1210 = rsqrt(_1164);
        float _1212 = _1208 * _1204;
        float _1214 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = _1212 * 0.15915493667125701904296875;
        float _1218 = _1216 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        float _1222 = _1216 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = fma(_1220, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = _1210 * _1226;
        float _1230 = _1224 + (-1.0);
        float _1232 = fma(_1154, _1228, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1234 = fma(_1158, _1228, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1236 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1240 = _1232 + _1238;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1244 = _1234 + _1242;
        float _1246 = fma(_1150, _1224, _1236);
        float _1248 = _1240 * _1240;
        float _1250 = _1244 * _1244;
        _1202 = _1246;
        _1184 = _1248;
        _1192 = _1250;
        _1188 = _1232;
        _1196 = _1234;
    }
    float _1252 = _1202;
    float _1254 = _1184;
    float _1256 = _1192;
    float _1258 = _1188;
    float _1260 = _1196;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1264 = _1252 + _1262;
    float _1266 = fma(_1264, _1264, _1254);
    float _1268 = _1266 + _1256;
    float _1270 = sqrt(_1268);
    bool _1272 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1274 = isnan(_1270);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1280 = _1276 || _1278;
    float _1282 = _1254;
    float _1284 = _1252;
    if (!_1280)
    {
        _1282 = 1.0;
    }
    float _1286 = _1282;
    bool _1288 = !_1280;
    float _1290 = _1286;
    if (!_1288)
    {
        bool _1292 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1294 = isnan(_1270);
        bool _1296 = _1292 || _1294;
        bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1300 = _1296 || _1298;
        if (!_1300)
        {
            float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1304 = _1270 + _1302;
            float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1308 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1306;
            float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1312 = _1310 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1314 = 1.0 / _1308;
            float _1316 = _1304 * _1314;
            float _1318 = fma(_1316, _1312, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1290 = _1318;
            _1320 = true;
        }
        else
        {
            bool _1322 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1324 = isnan(_1270);
            bool _1326 = _1322 || _1324;
            bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1330 = _1326 || _1328;
            if (!_1330)
            {
                float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1334 = _1270 + _1332;
                float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1338 = _1336 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1344 = 1.0 / _1338;
                float _1346 = _1334 * _1344;
                float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1290 = _1348;
                _1320 = true;
            }
            else
            {
                _1290 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1320 = false;
    float _1350 = _1290;
    float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1354 = _1252 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1358 = _1258 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1362 = _1260 + _1360;
    float _1364 = fma(_1354, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1366 = fma(_1358, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1368 = fma(_1362, _1350, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1370 = -_495;
    float _1372 = _1370 + _1364;
    float _1374 = -_664;
    float _1376 = _1374 + _1366;
    float _1378 = -_838;
    float _1380 = _1378 + _1368;
    float _1382 = _1372 * _1372;
    float _1384 = fma(_1376, _1376, _1382);
    float _1386 = fma(_1380, _1380, _1384);
    float _1388 = sqrt(_1386);
    bool _1390 = _1388 > 0.0;
    float _1392 = _1362;
    float _1394 = _1388;
    float _1396 = _1368;
    if (!_1390)
    {
        _1284 = _1366;
    }
    float _1398 = _1284;
    float _1400 = _1398;
    float _1402 = _1398;
    if (!_1390)
    {
        _1392 = _1364;
    }
    float _1404 = _1392;
    float _1406 = _1404;
    if (!_1390)
    {
        _1394 = _1368;
    }
    float _1408 = _1394;
    bool _1410 = !_1390;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = _265 * _265;
        float _1416 = fma(_263, _263, _1414);
        float _1418 = rsqrt(_1386);
        float _1420 = fma(_267, _267, _1416);
        float _1422 = sqrt(_1420);
        float _1424 = _1376 * _1418;
        float _1426 = _1372 * _1418;
        float _1428 = _1380 * _1418;
        bool _1430 = _1422 > 0.0;
        float _1432 = _1422;
        float _1434 = _1418;
        _1180 = _1428;
        if (!_1430)
        {
            _1400 = _1366;
        }
        float _1436 = _1400;
        _1402 = _1436;
        if (!_1430)
        {
            _1432 = _1364;
        }
        float _1438 = _1432;
        _1406 = _1438;
        if (!_1430)
        {
            _1434 = _1368;
        }
        float _1440 = _1434;
        bool _1442 = !_1430;
        _1412 = _1440;
        if (!_1442)
        {
            float _1444 = rsqrt(_1420);
            float _1446 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1448 = _265 * _1444;
            float _1450 = _263 * _1444;
            float _1452 = _267 * _1444;
            float _1454 = _1426 * _1448;
            float _1456 = fma(_1424, _1450, _1454);
            float _1458 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1460 = fma(_1428, _1452, _1456);
            float _1462 = _1460 * _1458;
            float _1464 = fma(_263, _1462, _1366);
            float _1466 = fma(_265, _1462, _1364);
            float _1468 = fma(_267, _1462, _1368);
            _1406 = _1466;
            _1402 = _1464;
            _1412 = _1468;
        }
    }
    float _1470 = _1406;
    float _1472 = _1402;
    float _1474 = _1412;
    float _1476 = _1180;
    float _1478 = -_906;
    float _1480 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1470);
    float _1482 = -_908;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    float _1486 = -_924;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1492 = _1480 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1496 = _1484 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1500 = _1488 + _1498;
    float _1502 = _1492 * _1492;
    float _1504 = fma(_1496, _1496, _1502);
    float _1506 = fma(_1500, _1500, _1504);
    float _1508 = rsqrt(_1506);
    float _1510 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1512 = _1496 * _1510;
    float _1514 = _1500 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 * _1514;
    float _1520 = _1516 + _1518;
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1528 = _1522 + _1526;
    float _1530 = _1508;
    float _1532 = _1520;
    float _1534 = _1528;
    float _1536 = _1492;
    float _1538 = _1476;
    float _1540 = _1512;
    if (_1524)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1542;
    }
    float _1544 = _1530;
    if (_1524)
    {
        float _1546 = rsqrt(_1520);
        _1532 = _1546;
    }
    float _1548 = _1532;
    if (_1524)
    {
        float _1550 = _1528 * _1544;
        _1534 = _1550;
    }
    float _1552 = _1534;
    if (_1524)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1396 = _1554;
    }
    float _1556 = _1396;
    float _1558 = _1544;
    float _1560 = _1556;
    if (_1524)
    {
        float _1562 = _1556 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1500;
    float _1574 = _1570;
    if (_1524)
    {
        float _1576 = _1556 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1510;
    float _1584 = -_1570;
    float _1586 = fma(_1492, _1582, _1584);
    if (!_1524)
    {
        _1536 = _1514;
    }
    float _1588 = _1536;
    float _1590 = _1588;
    if (_1524)
    {
        float _1592 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1592;
    }
    float _1594 = _1574;
    float _1596 = _1566;
    float _1598 = _1594;
    if (_1524)
    {
        float _1600 = fma(_1566, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = _1602;
    float _1606 = _1580;
    if (_1524)
    {
        float _1608 = _1580 + (-1.0);
        _1598 = _1608;
    }
    float _1610 = _1598;
    float _1612 = _1610;
    if (_1524)
    {
        float _1614 = _1548 * _1602;
        _1538 = _1614;
    }
    float _1616 = _1538;
    if (!_1524)
    {
        _1604 = _1586;
    }
    float _1618 = _1604;
    float _1620 = sqrt(_1506);
    float _1622 = _1618;
    if (_1524)
    {
        float _1624 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1624;
    }
    float _1626 = _1560;
    if (_1524)
    {
        float _1628 = _1512 * _1616;
        _1540 = _1628;
    }
    float _1630 = _1540;
    if (!_1524)
    {
        _1612 = _1516;
    }
    float _1632 = _1612;
    float _1634 = _1632;
    if (_1524)
    {
        float _1636 = _1514 * _1616;
        _1590 = _1636;
    }
    float _1638 = _1590;
    if (_1524)
    {
        float _1640 = fma(_1586, _1580, _1626);
        _1622 = _1640;
    }
    float _1642 = _1622;
    if (_1524)
    {
        float _1644 = _1630 * _1630;
        _1634 = _1644;
    }
    float _1646 = _1634;
    if (!_1524)
    {
        _1606 = _1518;
    }
    float _1648 = _1606;
    float _1650 = _1648;
    if (_1524)
    {
        float _1652 = _1638 * _1638;
        _1650 = _1652;
    }
    float _1654 = _1650;
    float _1656 = fma(_1642, _1642, _1646);
    float _1658 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1660 = _1656 + _1654;
    float _1662 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1658);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1666 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1664);
    float _1668 = precise::clamp(_1666, 0.0, 1.0);
    float _1670 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1672 = rsqrt(_1660);
    float _1674 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1662);
    float _1676 = -_1668;
    float _1678 = _1676 + 1.0;
    float _1680 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1670);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1686 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1696 = abs(_1678);
    float _1698 = log2(_1696);
    float _1700 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1702 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1688);
    float _1704 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1706 = -_1694;
    float _1708 = fma(_1706, _1690, 1.0);
    float _1710 = _1672 * _1630;
    float _1712 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1700);
    float _1714 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1718 = _1672 * _1642;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1722 = _1672 * _1638;
    float _1724 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1716);
    float _1726 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1728 = -_1720;
    float _1730 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1728);
    float _1732 = log2(_1708);
    float _1734 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1736 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1738 = -_1722;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1730);
    float _1742 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1734);
    float _1746 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1748 = fma(_1740, -0.5, 0.5);
    float _1750 = exp2(_1736);
    float _1752 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1754 = fma(_1740, 0.5, 0.5);
    float _1756 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1746);
    float _1758 = _1718 + 1.0;
    float _1760 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1752);
    float _1762 = 1.0 / _1744;
    float _1764 = fma(_1754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1766 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1756);
    float _1768 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1760);
    float _1770 = fma(_1754, _1764, -0.212114393711090087890625);
    float _1772 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1766);
    float _1774 = sqrt(_1748);
    float _1776 = -_1718;
    float _1778 = fma(_1750, _1758, _1776);
    float _1780 = _1732 * 0.693147182464599609375;
    float _1782 = fma(_1754, _1770, 1.570728778839111328125);
    float _1784 = fma(_1778, 0.5, 0.5);
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1788 = _1768 * _1762;
    float _1790 = _1772 * _1762;
    float _1792 = fma(_1788, 0.5, 0.5);
    float _1794 = fma(_1790, -0.5, 0.5);
    float _1796 = _1774 * 0.636619746685028076171875;
    float3 _4661 = float3(_1792, _1794, _1786);
    float _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4661, float3(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4661, float3(0.0), isnan(_4661)), level(0.0)).x;
    float _1800 = -_1782;
    float _1802 = fma(_1796, _1800, 1.0);
    float3 _4677 = float3(_1792, _1794, _1786);
    float4 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4677, float3(0.0), isnan(_4677)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4677, float3(0.0), isnan(_4677)), level(0.0)).xyzw;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = _1805.w;
    float2 _4694 = float2(_1802, _1784);
    float3 _1817 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).xyz;
    float _1819 = _1817.x;
    float _1821 = _1817.y;
    float _1823 = _1817.z;
    float _1825 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1827 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1829);
    float _1835 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1833);
    float _1837 = _1835 + _1744;
    float _1839 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1768;
    out.gl_Position.y = _1772;
    out.gl_Position.z = _1835;
    out.gl_Position.w = _1744;
    float _1841 = _1837 * 0.5;
    float _1843 = -_1831;
    float _1845 = _1843 + 1.0;
    out.m_47.x = _1839;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1841;
    out.m_68.w = _1744;
    float _1849 = _1847 * _1798;
    float _1851 = -_1847;
    float _1853 = _1851 + 1.0;
    float _1855 = _1813 * _1849;
    float _1857 = _1813 * _1853;
    float _1859 = _1823 * _1849;
    float _1861 = fma(_1819, _1855, _1807);
    float _1863 = fma(_1821, _1855, _1809);
    float _1865 = fma(_1813, _1859, _1811);
    out.m_70.x = _1861;
    out.m_70.y = _1863;
    out.m_70.z = _1865;
    out.m_70.w = _1857;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

