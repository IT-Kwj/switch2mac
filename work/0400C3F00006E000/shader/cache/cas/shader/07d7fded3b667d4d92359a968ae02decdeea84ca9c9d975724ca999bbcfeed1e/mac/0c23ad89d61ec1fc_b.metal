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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _905 = false;
    bool _753 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3716 = as_type<float>(_105);
        out.gl_Position.z = _3716;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3786 = as_type<float>(_143);
        out.gl_Position.z = _3786;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    float _237 = 0.0;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _147 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _147);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _267;
        _237 = _245;
    }
    float _269 = _235;
    float _271 = _237;
    float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _275 = !_159;
    float _277 = _271;
    float _279 = _269;
    if (!_275)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = 1.0 / _287;
        float _291 = _147 * _283;
        float _293 = exp2(_291);
        float _295 = -_293;
        float _297 = _295 + 1.0;
        float _299 = _297 * _289;
        _277 = _289;
        _211 = _299;
    }
    float _301 = _277;
    float _303 = _211;
    float _305 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = _301;
    float _315 = _303;
    if (!_159)
    {
        float _317 = _123 * _123;
        float _319 = _317 * 0.5;
        _313 = _319;
    }
    float _321 = _313;
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _329 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _331 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _331;
    }
    float _333 = _279;
    bool _335 = !_159;
    float _337 = _333;
    if (!_335)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = _123 * _341;
        float _351 = 1.0 / _345;
        float _353 = _347 * 0.693147182464599609375;
        float _355 = exp2(_349);
        float _357 = 1.0 / _353;
        float _359 = _355 + (-1.0);
        float _361 = -_359;
        float _363 = fma(_361, _357, _123);
        float _365 = _363 * _351;
        float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _337 = _367;
    }
    float _369 = _337;
    float _371 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _373 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _375 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _325);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _381 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _383 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _327);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].x, _379);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].y, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].z, _383);
    float _393 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _395 = fma(_303, _161, _373);
    float _397 = fma(_303, _163, _375);
    float _399 = fma(_303, _165, _385);
    float _401 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].x, _387);
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].y, _389);
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _391);
    if (!_159)
    {
        _315 = _123;
    }
    float _407 = _315;
    bool _409 = !_159;
    float _411 = _407;
    if (!_409)
    {
        float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _415 = log2(_413);
        float _417 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _419 = _417 + 1.0;
        float _421 = 1.0 / _419;
        float _423 = _123 * _415;
        float _425 = exp2(_423);
        float _427 = -_425;
        float _429 = _427 + 1.0;
        float _431 = _429 * _421;
        _411 = _431;
    }
    float _433 = _411;
    float _435 = fma(_433, _163, _403);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = fma(_397, _149, _169);
    float _441 = fma(_433, _161, _401);
    float _443 = -_435;
    float _445 = _397 + _443;
    float _447 = fma(_433, _165, _405);
    float _449 = fma(_395, _149, _167);
    float _451 = -_441;
    float _453 = _395 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _445 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _461 = -_447;
    float _463 = _399 + _461;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _469 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].x, _459);
    float _471 = fma(_399, _149, _171);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    bool _479 = !_437;
    float _481 = _475;
    float _483 = _473;
    float _485 = _477;
    float _503;
    if (!_479)
    {
        float _487 = in.m_54.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_89);
        float _509 = 1.0 / _507;
        float _511 = _123 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = _513 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _513 + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _539 = 1.0 / _525;
    bool _541 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _543 = isnan(_513);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = 1.0 / _529;
    float _557 = 1.0 / _533;
    float _559 = _517 * _539;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _563 = _513 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _567 = _513 + _565;
    float _569 = 1.0 / _537;
    float _571 = _521 * _555;
    bool _573 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _575 = isnan(_513);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_551;
    float _587 = _585 + 1.0;
    float _589 = _583 * _587;
    float _591 = _563 * _557;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _593;
    bool _597 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _599 = isnan(_513);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = fma(_595, _559, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _615 = fma(_611, _571, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = _567 * _569;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _619;
    bool _623 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _625 = isnan(_513);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    bool _635 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _637 = isnan(_513);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_621, _559, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _649 = -_583;
    float _651 = _649 + 1.0;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = _633 * _651;
    float _659 = -_633;
    float _661 = _659 + 1.0;
    float _663 = fma(_655, _571, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = in.m_52.x;
    float _667 = in.m_52.y;
    float _669 = _607 * _661;
    float _671 = -_607;
    float _673 = _671 + 1.0;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = _645 * _673;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _685;
    float _689 = fma(_677, _591, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _691 = _613 * _679;
    float _693 = _647 * _679;
    float _695 = fma(_687, _591, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].x, _691);
    float _703 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _709 = fma(_699, _617, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _711 = fma(_663, _669, _701);
    float _713 = fma(_615, _669, _703);
    float _715 = fma(_707, _617, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _717 = fma(_695, _657, _711);
    float _719 = fma(_689, _657, _713);
    float _721 = fma(_709, _589, _717);
    float _723 = fma(_715, _589, _719);
    float _725 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[147].x, _721);
    float _727 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[147].y, _723);
    float _729 = _725 * _665;
    float _731 = _727 * _667;
    bool _733 = !_553;
    float _751;
    if (!_733)
    {
        float _735 = in.m_54.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_89);
        float _757 = 1.0 / _755;
        float _759 = _123 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _761 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _771 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _773 = isnan(_761);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _787 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _789 = isnan(_761);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _799;
    bool _803 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _805 = isnan(_761);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _769;
    float _817 = -_781;
    float _819 = _817 + 1.0;
    bool _821 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _823 = 1.0 / _785;
    float _825 = _801 * _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _831 = -_813;
    float _833 = _831 + 1.0;
    float _835 = fma(_825, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _837 = _797 * _819;
    float _839 = -_797;
    float _841 = _839 + 1.0;
    float _843 = _781 * _833;
    float _845 = _829 * _823;
    float _847 = _835 * _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _761 + _849;
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _847);
    float _855 = fma(_845, _851, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _857 = fma(_855, _843, _853);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _865 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[117].x, _857);
    float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _867;
    out.m_56.y = _869;
    out.m_56.z = _871;
    out.m_56.w = _873;
    bool _875 = !_821;
    float _899;
    float _901;
    float _903;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _881 = float(_89);
        float _883 = 1.0 / _881;
        float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = _123 * _883;
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _891 = _889 * _879;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = _881;
        _903 = _887;
        _905 = true;
    }
    else
    {
        float _907 = float(_89);
        float _909 = 1.0 / _907;
        float _911 = _123 * _909;
        _899 = _911;
        _901 = _907;
        _903 = _911;
    }
    _905 = false;
    float _913 = _899;
    float _915 = _901;
    float _917 = _903;
    float _919 = in.m_54.x;
    float _921 = in.m_54.y;
    float _923 = in.m_54.z;
    float _925 = in.m_54.w;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _929 = int(_927);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = _913 + _931;
    float _935 = _729 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _937 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _939 = int(_937);
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _947 = float(_929);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _955 = 1.0 / _947;
    float _957 = _919 * 2.0;
    bool _959 = _925 > 0.5;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _961;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _969 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[79].z, _941);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _985 = _983 != 0;
    float _987 = 1.0 / _963;
    float _989 = -_225;
    int _991 = _959 ? as_type<int>(_989) : as_type<int>(_225);
    float _993 = _921 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _997 = _995 != 0;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1001 = !_985;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1011 = _1009 != 0;
    float _1013 = floor(_957);
    bool _1015 = !_977;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = _919 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1021 = !_973;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = _921 + _923;
    bool _1027 = !_981;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = _923 * 2.0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1035 = _1033 != 0;
    float _1037 = 1.0 / _967;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1041 = _1039 != 0;
    float _1043 = _921 + (-0.5);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1047 = _1045 != 0;
    float _1049 = _921 * 2.0;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1057 = !_997;
    float _1059 = _1057 ? _225 : as_type<float>(_991);
    float _1061 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1063 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1065 = !_1011;
    int _1067 = _1065 ? 0 : 1;
    float _1069 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1055);
    bool _1071 = _919 > 0.5;
    float _1073 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1063);
    float _1075 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1061);
    float _1077 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1069);
    float _1079 = -_221;
    int _1081 = _1071 ? as_type<int>(_1079) : as_type<int>(_221);
    float _1083 = 1.0 / _945;
    bool _1085 = _921 > 0.5;
    float _1087 = _933 * _987;
    bool _1089 = !_1041;
    float _1091 = _1089 ? _221 : as_type<float>(_1081);
    float _1093 = _919 + (-0.5);
    float _1095 = -_225;
    int _1097 = _1085 ? as_type<int>(_1095) : as_type<int>(_225);
    bool _1099 = _923 > 0.5;
    float _1101 = 1.0 / _951;
    float _1103 = float(uint(_939));
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1111 = _1109 != 0;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1115 = _1113 != 0;
    float _1117 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    float _1119 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
    float _1121 = _123 * _955;
    float _1123 = -_221;
    int _1125 = _1099 ? as_type<int>(_1123) : as_type<int>(_221);
    float _1127 = 1.0 / _1103;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1131 = _1129 != 0;
    float _1133 = _923 + (-0.5);
    float _1135 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[78].w, _999);
    float _1137 = trunc(_1121);
    int _1139 = int(_1137);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1145 = !_1047;
    float _1147 = _1145 ? _225 : as_type<float>(_1097);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1153 = fma(_993, -2.0, _1141);
    float _1155 = -_1143;
    float _1157 = fma(_1019, 2.0, _1155);
    int _1159 = as_type<int>(_1127) + (-2);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1165 = _923 + _919;
    float _1167 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[78].z, _953);
    float _1169 = _955;
    float _1171 = _1069;
    float _1173 = _923;
    if (!_1131)
    {
        _1169 = _923;
    }
    float _1175 = _1169;
    float _1177 = _921 + _919;
    float _1179 = _1175;
    if (!_1131)
    {
        _1171 = _921;
    }
    float _1181 = _1171;
    float _1183 = 1.0 / _1007;
    float _1185 = float(uint(_1139));
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1191 = !_1131;
    float _1193 = _1191 ? _921 : _919;
    float _1195 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1135);
    float _1197 = _1181;
    if (_1131)
    {
        _1173 = _921;
    }
    float _1199 = _1173;
    float _1201 = as_type<float>(_1159) * _1185;
    if (_1131)
    {
        _1179 = _921;
    }
    float _1203 = _1179;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1207 = _913 + _1205;
    float _1209 = 1.0 / _1151;
    int _1211 = ~_939;
    int _1213 = _1211 + 1;
    float _1215 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1221 = _1013 >= 0.0;
    bool _1223 = isnan(_1013);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    if (_1131)
    {
        _1197 = _919;
    }
    float _1231 = _1197;
    float _1233 = trunc(_1201);
    float _1235 = precise::max(_1233, 0.0);
    uint _1238 = uint(_1235);
    float _1240 = _1207 * _1037;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1242;
    int _1246 = _1229 ? 0 : 1;
    float _1248 = _1244 * _1083;
    bool _1250 = _1013 > 0.0;
    float _1252 = 1.0 / _1163;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1266 = _1256 * _1183;
    float _1268 = _1260 * _1101;
    float _1270 = _1264 * _1209;
    int _1272 = _1213 * int(_1238);
    int _1274 = _1272 + _1139;
    float _1276 = 1.0 / _1189;
    int _1278 = ~_1246;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = float(uint(_1274));
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1286;
    int _1290 = _1282;
    if (!_1250)
    {
        int _1292 = ~_1246;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = 1.0 / _1219;
    bool _1300 = !_1131;
    float _1302 = _1300 ? 1.2345600128173828125 : 1.0;
    float _1304 = as_type<float>(_1159) * _1284;
    float _1306 = _1288 * _1252;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1312 = 1.0 / _915;
    float _1314 = _1310 * _1276;
    int _1316 = abs(_1017);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1318;
    int _1322 = ~_939;
    int _1324 = _1322 + 1;
    float _1326 = floor(_1049);
    int _1328 = abs(_1023);
    float _1330 = _1320 * _1298;
    float _1332 = _1165 + (-1.0);
    float _1334 = _1025 + (-1.0);
    bool _1336 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1338 = isnan(_917);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = trunc(_1304);
    float _1350 = precise::max(_1348, 0.0);
    uint _1352 = uint(_1350);
    float _1354 = float(_939);
    int _1356 = ~_939;
    int _1358 = _1356 + 1;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1362 = _123 * _1354;
    bool _1364 = _1326 >= 0.0;
    bool _1366 = isnan(_1326);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = floor(_1031);
    float _1376 = _1362 * _1312;
    float _1378 = _1302 * _1193;
    float _1380 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1382 = !_1053;
    float _1384 = _1382 ? _221 : as_type<float>(_1125);
    int _1386 = _1372 ? 0 : 1;
    float _1388 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1390 = log2(_1388);
    int _1392 = int(_1238) + int(_1352);
    bool _1394 = _1326 > 0.0;
    int _1396 = _1324 * _1392;
    int _1398 = _1396 + _1139;
    float _1400 = trunc(_1376);
    int _1402 = int(_1400);
    int _1404 = ~_1386;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1412 = uint(_1398) >= uint(_939);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1422;
    bool _1426 = !_1412;
    int _1428 = _1426 ? 0 : (-1);
    float _1430 = floor(_1378);
    float _1432 = _123 * _1390;
    int _1434 = _1408;
    if (!_1394)
    {
        int _1436 = ~_1386;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    float _1442 = fma(_1424, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1444 = _1374 > 0.0;
    float _1446 = fma(_1420, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1448 = _1374 >= 0.0;
    bool _1450 = isnan(_1374);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1458;
    float _1462 = fma(_1416, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1464 = exp2(_1432);
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1470 = float(_1139);
    float _1472 = fma(_1460, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1480 = _917 + _1478;
    bool _1482 = _1470 >= _1354;
    bool _1484 = isnan(_1470);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1354);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = -_1430;
    float _1496 = _1378 + _1494;
    int _1498 = ~_1392;
    int _1500 = _1498 + _1428;
    int _1502 = _1500 + 1;
    float _1504 = fma(_1248, _1480, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1506 = trunc(_1492);
    int _1508 = int(_1506);
    float _1510 = _1496 * _1354;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1514 = _917 + _1512;
    int _1516 = _1456 ? 0 : 1;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1520 = _917 + _1518;
    bool _1522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = -_1464;
    float _1534 = _1532 + 1.0;
    float _1536 = fma(_1268, _1514, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1540 = _917 + _1538;
    int _1542 = _939 * _1502;
    int _1544 = _1542 + _1139;
    float _1546 = fma(_1270, _1520, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1548 = _1530 ? _1534 : 0.0;
    float _1550 = fma(_1306, _1540, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1552 = _939 == 0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1556 = _917 + _1554;
    float _1558 = trunc(_1510);
    int _1560 = int(_1558);
    int _1562 = ~_1508;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    float _1568 = fma(_1476, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1570 = !_1552;
    int _1572 = _1570 ? _1544 : (-1);
    float _1574 = fma(_1468, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1576 = abs(_1067);
    float _1578 = fma(_1314, _1556, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    int _1580 = _939 + (-1);
    int _1582 = _1572 * _1566;
    int _1584 = abs(_1029);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1588 = _917 + _1586;
    int _1590 = _1508 * _1580;
    int _1592 = _1590 + _1582;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1596 = _917 + _1594;
    float _1598 = fma(_1266, _1588, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1600 = _1592 * _1316;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1604 = _1560 * _1576;
    int _1606 = _1604 + _1139;
    bool _1608 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1610 = isnan(_913);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    int _1620 = _1402 * _1328;
    int _1622 = _1620 + _1600;
    float _1624 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1602);
    bool _1626 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1628 = isnan(_917);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = fma(_1330, _1596, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1640 = _1606 * _1584;
    int _1642 = _1640 + _1622;
    bool _1644 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1646 = isnan(_913);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -_1618;
    float _1658 = _1656 + 1.0;
    bool _1660 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1662 = isnan(_917);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = -_1636;
    float _1674 = _1672 + 1.0;
    bool _1676 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1678 = isnan(_913);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1654 * _1658;
    float _1690 = -_1654;
    float _1692 = _1690 + 1.0;
    int _1694 = abs(_1003);
    float _1696 = _1670 * _1674;
    bool _1698 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1700 = isnan(_917);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = -_1670;
    float _1712 = _1710 + 1.0;
    float _1714 = _1686 * _1692;
    int _1716 = _1560 * _1694;
    int _1718 = _1716 + _1642;
    bool _1720 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1722 = isnan(_917);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1708 * _1712;
    float _1734 = -_1708;
    float _1736 = _1734 + 1.0;
    float _1738 = _1442 * _1714;
    float _1740 = _1462 * _1714;
    float _1742 = _1472 * _1714;
    bool _1744 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1746 = isnan(_917);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = _1730 * _1736;
    float _1758 = -_1730;
    float _1760 = _1758 + 1.0;
    float _1762 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _969);
    float _1764 = -_1754;
    float _1766 = _1764 + 1.0;
    float _1768 = _1754 * _1760;
    float _1770 = float(uint(_1718));
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1774 = 1.0 + _1772;
    bool _1776 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1778 = isnan(_917);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1624);
    bool _1790 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1792 = isnan(_917);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1798 = _1794 || _1796;
    float _1800 = float(_1798);
    float _1802 = as_type<float>(_1159) * _1770;
    float _1804 = 1.0 / _1774;
    float _1806 = _1800 * _1766;
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1814 = _1762 * (-0.15915493667125701904296875);
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1818 = _1346 * _1810;
    float _1820 = trunc(_1802);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    float _1826 = -_1346;
    float _1828 = _1826 + 1.0;
    float _1830 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1812);
    float _1832 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1834 = fma(_1215, -2.0, _1816);
    float _1836 = _1786 * _1828;
    float _1838 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1830);
    float _1840 = -_1360;
    float _1842 = fma(_1832, 2.0, _1840);
    float _1844 = _1814 * 6.283185482025146484375;
    float _1846 = sin(_1844);
    float _1848 = _1548 * _1804;
    float _1850 = -_1786;
    float _1852 = _1850 + 1.0;
    float _1854 = _1504 * _1836;
    float _1856 = -_1686;
    float _1858 = _1856 + 1.0;
    int _1860 = ~_1516;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1834);
    int _1868 = _1864;
    if (!_1444)
    {
        int _1870 = ~_1516;
        int _1872 = _1870 + 1;
        _1868 = _1872;
    }
    int _1874 = _1868;
    float _1876 = _1814 * 6.283185482025146484375;
    float _1878 = cos(_1876);
    int _1880 = _1358 * int(_1824);
    int _1882 = _1880 + _1718;
    float _1884 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1738);
    float _1886 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1740);
    float _1888 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1742);
    float _1890 = -_123;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1842);
    float _1894 = float(uint(_1882));
    float _1896 = fma(_1568, _1688, _1884);
    float _1898 = _1147 * _1846;
    float _1900 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1854);
    float _1902 = fma(_1446, _1688, _1886);
    float _1904 = as_type<float>(_1159) * _1894;
    float _1906 = fma(_1574, _1688, _1888);
    bool _1908 = !_1111;
    int _1910 = _1908 ? 0 : 1;
    float _1912 = fma(_1598, _1818, _1900);
    float _1914 = trunc(_1904);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1147 * _1878;
    float _1922 = -_1898;
    float _1924 = fma(_1091, _1878, _1922);
    int _1926 = abs(_1910);
    float _1928 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1902);
    float _1930 = fma(_1091, _1846, _1920);
    float _1932 = _1384 + 0.5;
    float _1934 = _1059 + (-0.5);
    float _1936 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1938 = fma(_1536, _1806, _1912);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1892);
    int _1942 = ~_939;
    int _1944 = _1942 + 1;
    float _1946 = -_1934;
    float _1948 = -_1866;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1948);
    float _1952 = float(_1926);
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1956 = _1936 + _1954;
    float _1958 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1906);
    int _1960 = int(_1824) + int(_1918);
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1964 = float(_1296);
    float _1966 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1896);
    bool _1968 = !_1107;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1944 * _1960;
    int _1974 = _1972 + _1718;
    float _1976 = _1117 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1978 = _1952 * _1964;
    bool _1980 = !_1115;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1986 = uint(_1974) >= uint(_939);
    float _1988 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1976 + _1990;
    float _1994 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1996 = abs(_1970);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2000 = _1988 + _1998;
    int _2002 = abs(_1982);
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1994);
    float _2006 = float(_1440);
    float _2008 = fma(_1546, _1768, _1938);
    bool _2010 = !_1986;
    int _2012 = _2010 ? 0 : (-1);
    float _2014 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2004);
    float _2016 = float(uint(_1606));
    float _2018 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2020 = ~_1960;
    int _2022 = _2020 + _2012;
    int _2024 = _2022 + 1;
    float _2026 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2028 = float(_2002);
    float _2030 = as_type<float>(_1159) * _2016;
    float _2032 = float(_1996);
    int _2034 = _939 * _2024;
    int _2036 = _2034 + _1718;
    float _2038 = float(_1874);
    float _2040 = _2028 * _2006;
    int _2042 = ~_939;
    int _2044 = _2042 + 1;
    float _2046 = trunc(_2030);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    bool _2052 = _2014 >= 0.0;
    float _2054 = _2032 * _2038;
    float _2056 = in.m_58.x;
    float _2058 = in.m_58.y;
    float _2060 = in.m_58.z;
    float _2062 = -_123;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1157);
    float _2066 = _1924 + 0.5;
    bool _2068 = !_1552;
    int _2070 = _2068 ? _2036 : (-1);
    float _2072 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1153);
    float _2074 = fma(_1550, _1756, _2008);
    float _2076 = fma(_2026, _2066, _2064);
    int _2078 = _2070 >> 31;
    float _2080 = _1978 * (-2.0);
    int _2082 = _2070 & 3;
    bool _2084 = _2082 != 0;
    float _2086 = _1930 + (-0.5);
    int _2088 = _2078 & 3;
    int _2090 = _2044 * int(_2050);
    int _2092 = _2090 + _1606;
    bool _2094 = uint(_2082) > 1u;
    float _2096 = fma(_1380, _2080, _1380);
    int _2098 = _2070 & 3;
    bool _2100 = _2098 != 0;
    float _2102 = -_2018;
    float _2104 = -_2072;
    float _2106 = fma(_2102, _2086, _2104);
    int _2108 = _2070 + _2088;
    float _2110 = -_1788;
    float _2112 = _2110 + 1.0;
    float _2114 = float(uint(_2092));
    float _2116 = -_1838;
    float _2118 = _2116 + 1.0;
    int _2120 = _2108 >> 2;
    float _2122 = -_1195;
    float _2124 = _2122 + 1.0;
    int _2126 = _2100 ? 0 : 1;
    float _2128 = fma(_2080, _2058, _2058);
    int _2130 = _2120 << 4;
    int _2132 = _2130 + 512;
    float _2134 = as_type<float>(_1159) * _2114;
    int _2136 = ~_2126;
    int _2138 = _2136 + 1;
    int _2140 = _2138 + 1;
    float _2142 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1167);
    int _2144 = _2140;
    if (!_2094)
    {
        int _2146 = ~_2126;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    int _2152 = _2132 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = -_2142;
    float _2172 = _2170 + 1.0;
    float _2174 = -_2118;
    float _2176 = fma(_1384, _2174, _1940);
    float _2178 = fma(_1930, _2124, _2106);
    float _2180 = fma(_1059, _2112, _1950);
    float _2182 = -_2172;
    float _2184 = fma(_1924, _2182, _2076);
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2188 = uint(int(uint(_2132) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    float _2204 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2206 = _1928 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2208 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2210 = trunc(_2134);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = _2040 * (-2.0);
    bool _2218 = _2082 != 3;
    float _2220 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2222 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2224 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2226 = uint(_2082) >= 2u;
    float _2228 = fma(_1410, _2216, _1410);
    int _2230 = abs(_2150);
    float _2232 = fma(_2216, _2060, _2060);
    bool _2234 = !_2084;
    int _2236 = _2234 ? 0 : 1;
    out.m_60.x = _2220;
    out.m_60.y = _2222;
    out.m_60.z = _2224;
    out.m_60.w = _2186;
    int _2238 = _2226 ? 0 : 1;
    float _2240 = fma(_1578, _1732, _2074);
    int _2242 = ~_939;
    int _2244 = _2242 + 1;
    out.m_62.x = _2184;
    out.m_62.y = _2178;
    out.m_62.z = _2176;
    out.m_62.w = _2180;
    int _2246 = ~_2238;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    float _2252 = fma(_1638, _1696, _2240);
    int _2254 = _2250;
    if (_2218)
    {
        int _2256 = ~_2238;
        int _2258 = _2256 + 1;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2128);
    int _2264 = int(_2050) + int(_2214);
    float _2266 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2252);
    bool _2268 = _2082 != 3;
    if (_2052)
    {
        out.m_45.x = 0.0;
    }
    float _2270 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2232);
    int _2272 = abs(_2236);
    int _2274 = _2244 * _2264;
    int _2276 = _2274 + _1606;
    out.m_64.x = _2266;
    int _2278 = ~_2230;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = abs(_2260);
    int _2286 = ~_2272;
    int _2288 = _2286 + 1;
    int _2290 = _2288 + 1;
    int _2292 = ~_2284;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    bool _2298 = !_2268;
    int _2300 = _2298 ? 0 : (-1);
    bool _2302 = uint(_2276) >= uint(_939);
    int _2304 = abs(_2300);
    int _2306 = _2282 * as_type<int>(_2202);
    bool _2308 = !_2302;
    int _2310 = _2308 ? 0 : (-1);
    int _2312 = _2290 * as_type<int>(_2194);
    int _2314 = _2312 + _2306;
    bool _2316 = !_1035;
    int _2318 = _2316 ? 0 : 1;
    int _2320 = ~_2264;
    int _2322 = _2320 + _2310;
    int _2324 = _2322 + 1;
    int _2326 = _2296 * as_type<int>(_2160);
    int _2328 = _2326 + _2314;
    float _2330 = _1956 * _1956;
    int _2332 = abs(_2318);
    int _2334 = ~_2304;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    float _2340 = fma(_1992, _1992, _2330);
    int _2342 = _939 * _2324;
    int _2344 = _2342 + _1606;
    int _2346 = ~_2332;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    float _2352 = fma(_2000, _2000, _2340);
    int _2354 = _2338 * as_type<int>(_2168);
    int _2356 = _2354 + _2328;
    bool _2358 = !_1552;
    int _2360 = _2358 ? _2344 : (-1);
    float _2362 = as_type<float>(_2304);
    if (_2052)
    {
        _2362 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2364 = _2362;
    int _2366 = _2356 * _2350;
    float _2368 = rsqrt(_2352);
    bool _2370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2372 = isnan(1.0);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2378 = _2374 || _2376;
    float _2380 = _935 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2382 = _2360 * _2332;
    int _2384 = _2382 + _2366;
    int _2386 = as_type<int>(_2364);
    if (_2052)
    {
        float _2388 = _2364 * 5.0;
        _2386 = as_type<int>(_2388);
    }
    int _2390 = _2386;
    bool _2392 = !_2378;
    float _2394 = _2392 ? _123 : _1848;
    float _2396 = float(_2384);
    if (_2052)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7239 = as_type<float>(_2390);
        out.gl_Position.z = _7239;
    }
    float _2398 = fma(_2394, _2096, _2262);
    out.m_66.y = _2396;
    float _2400 = _2398 * 0.15915493667125701904296875;
    float _2402 = _2380 * _2368;
    float _2404 = _1992 * _2402;
    float _2406 = _1956 * _2402;
    if (_2052)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2408 = -_2406;
    float _2410 = _1936 + _2408;
    float _2412 = _2000 * _2402;
    float _2414 = -_2404;
    float _2416 = _1976 + _2414;
    float _2418 = fma(_2394, _2228, _2270);
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2422 = _2410 + _2420;
    float _2424 = -_2412;
    float _2426 = _1988 + _2424;
    float _2428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2430 = _2416 + _2428;
    float _2432 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2436 = _2426 + _2434;
    float _2438 = _1177 + (-1.0);
    float _2440 = _2054 * (-2.0);
    float _2442 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2432);
    float _2444 = -_2406;
    float _2446 = _1956 + _2444;
    float _2448 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2450 = fma(_2440, _2056, _2056);
    float _2452 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2442);
    float _2454 = -_2404;
    float _2456 = _1992 + _2454;
    float _2458 = _2446 * _2446;
    float _2460 = fma(_2448, _2440, _2448);
    float _2462 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    bool _2464 = _2452 >= 0.0;
    float _2466 = fma(_2456, _2456, _2458);
    float _2468 = -_2412;
    float _2470 = _2000 + _2468;
    float _2472 = fma(_2394, _2460, _2462);
    float _2474 = _2418 * 0.15915493667125701904296875;
    float _2476 = _2400 * 6.283185482025146484375;
    float _2478 = sin(_2476);
    float _2480 = fma(_2470, _2470, _2466);
    float _2482 = _2472 * 0.15915493667125701904296875;
    float _2484 = _2432;
    float _2486 = _2426;
    if (_2464)
    {
        _2484 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2488 = _2484;
    float _2490 = _2400 * 6.283185482025146484375;
    float _2492 = cos(_2490);
    int _2494 = as_type<int>(_2488);
    if (_2464)
    {
        out.m_45.x = 0.0;
    }
    if (_2464)
    {
        float _2496 = _2488 * 5.0;
        _2494 = as_type<int>(_2496);
    }
    int _2498 = _2494;
    float _2500 = _2474 * 6.283185482025146484375;
    float _2502 = sin(_2500);
    if (_2464)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7415 = as_type<float>(_2498);
        out.gl_Position.z = _7415;
    }
    float _2504 = _2474 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    float _2508 = sqrt(_2480);
    float _2510 = _2482 * 6.283185482025146484375;
    float _2512 = sin(_2510);
    float _2514 = _2492;
    if (_2464)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2516 = _2482 * 6.283185482025146484375;
    float _2518 = cos(_2516);
    float _2520 = _2368 * _2508;
    float _2522 = _731 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2524 = _2492 * _2506;
    float _2526 = _2478 * _2502;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2530 = _2520 * _2522;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2534 = fma(_2512, _2526, _2524);
    float _2536 = fma(_2512, _2524, _2526);
    float _2538 = _935 * _2520;
    float _2540 = _2528 * _2530;
    float _2542 = _2492 * _2502;
    float _2544 = _2478 * _2506;
    float _2546 = _2532 * _2538;
    float _2548 = _2506 * _2518;
    float _2550 = -_2542;
    float _2552 = fma(_2512, _2544, _2550);
    float _2554 = _2502 * _2518;
    float _2556 = -_2544;
    float _2558 = fma(_2512, _2542, _2556);
    float _2560 = _2548 * _2540;
    float _2562 = _2552 * _2540;
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2566 = _2564 * 0.5;
    float _2568 = fma(_2554, _2546, _2560);
    float _2570 = _2536 * _2540;
    float _2572 = fma(_2534, _2546, _2562);
    float _2574 = _2518 * _2566;
    float _2576 = -_2512;
    float _2578 = fma(_2576, _2566, _2568);
    float _2580 = fma(_2558, _2546, _2570);
    float _2582 = fma(_2478, _2574, _2572);
    float _2584 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2586 = fma(_2492, _2574, _2580);
    float _2588 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2584);
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2596 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2598 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2600 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2594);
    float _2602 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2596);
    float _2604 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2606 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2608 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2610 = _1988 + _2604;
    float _2612 = _1976 + _2606;
    float _2614 = _1936 + _2608;
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2618 = _2610 + _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2622 = _2612 + _2620;
    float _2624 = _2618 * _2618;
    float _2626 = fma(_2622, _2622, _2624);
    float _2628 = sqrt(_2626);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = _2586;
    float _2634 = _2624;
    float _2636 = _2612;
    float _2638 = _2618;
    float _2640 = _2540;
    float _2642 = _2626;
    float _2644 = _2520;
    if (!_2630)
    {
        _2632 = _2612;
    }
    float _2646 = _2632;
    float _2648 = _2646;
    if (!_2630)
    {
        _2634 = _2610;
    }
    float _2650 = _2634;
    float _2652 = _2650;
    if (!_2630)
    {
        _2636 = _2614;
    }
    float _2654 = _2636;
    bool _2656 = !_2630;
    float _2658 = _2654;
    if (!_2656)
    {
        float _2660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2664 = _2628 + _2662;
        float _2666 = rsqrt(_2626);
        float _2668 = _2664 * _2660;
        float _2670 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2672 = _2668 * 0.15915493667125701904296875;
        float _2674 = _2672 * 6.283185482025146484375;
        float _2676 = cos(_2674);
        float _2678 = _2672 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        float _2682 = _2676 + (-1.0);
        float _2684 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2686 = fma(_2680, _2670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2688 = fma(_2614, _2676, _2684);
        float _2690 = _2666 * _2686;
        float _2692 = fma(_2622, _2690, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2694 = fma(_2618, _2690, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2658 = _2688;
        _2648 = _2692;
        _2652 = _2694;
    }
    float _2696 = _2658;
    float _2698 = _2648;
    float _2700 = _2652;
    float _2702 = -_1936;
    float _2704 = _2702 + _2696;
    float _2706 = -_1976;
    float _2708 = _2706 + _2698;
    float _2710 = -_1988;
    float _2712 = _2710 + _2700;
    float _2714 = _2704 * _2704;
    float _2716 = fma(_2708, _2708, _2714);
    float _2718 = fma(_2712, _2712, _2716);
    float _2720 = sqrt(_2718);
    bool _2722 = _2720 > 0.0;
    float _2724 = _2720;
    float _2726 = _2696;
    float _2728 = _2712;
    float _2730 = _2700;
    float _2732 = _2704;
    if (!_2722)
    {
        _2724 = _2698;
    }
    float _2734 = _2724;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2722)
    {
        _2638 = _2700;
    }
    float _2740 = _2638;
    bool _2742 = !_2722;
    float _2744 = _2740;
    if (!_2742)
    {
        bool _2746 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2748 = _2740;
        if (_2746)
        {
            float _2750 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2748 = _2750;
        }
        float _2752 = _2748;
        float _2754 = _2752;
        if (_2746)
        {
            float _2756 = _473 * _2752;
            _2514 = _2756;
        }
        float _2758 = _2514;
        float _2760 = _2758;
        if (_2746)
        {
            float _2762 = _475 * _2752;
            _2640 = _2762;
        }
        float _2764 = _2640;
        float _2766 = _2764;
        if (_2746)
        {
            float _2768 = _477 * _2752;
            _2642 = _2768;
        }
        float _2770 = _2642;
        float _2772 = _2770;
        if (!_2746)
        {
            bool _2774 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2778 = _2774 || _2776;
            bool _2780 = isnan(1.0);
            bool _2782 = _2778 || _2780;
            float _2784 = _123 + 1.0;
            if (!_2782)
            {
                float _2786 = _2784 * _2784;
                float _2788 = _2786 * 0.5;
                _125 = _2788;
            }
            float _2790 = _125;
            float _2792 = _2790;
            if (!_2782)
            {
                float _2794 = _2790 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2792 = _2794;
            }
            float _2796 = _2792;
            bool _2798 = !_2782;
            float _2800 = _2796;
            if (!_2798)
            {
                float _2802 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2804 = log2(_2802);
                float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2808 = 1.0 + _2806;
                float _2810 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2812 = _2804 * _2784;
                float _2814 = 1.0 / _2808;
                float _2816 = _2810 * 0.693147182464599609375;
                float _2818 = exp2(_2812);
                float _2820 = 1.0 / _2816;
                float _2822 = _2818 + (-1.0);
                float _2824 = -_2822;
                float _2826 = fma(_2824, _2820, _2784);
                float _2828 = _2826 * _2814;
                float _2830 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2800 = _2830;
            }
            float _2832 = _2800;
            float _2834 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2836 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2838 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2840 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2842 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2844 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2846 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2840);
            float _2848 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2842);
            float _2850 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2846);
            float _2852 = _2846;
            _2736 = _2838;
            if (!_2782)
            {
                _2852 = _2784;
            }
            float _2854 = _2852;
            bool _2856 = !_2782;
            float _2858 = _2854;
            if (!_2856)
            {
                float _2860 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2862 = log2(_2860);
                float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2866 = 1.0 + _2864;
                float _2868 = 1.0 / _2866;
                float _2870 = _2862 * _2784;
                float _2872 = exp2(_2870);
                float _2874 = -_2872;
                float _2876 = _2874 + 1.0;
                float _2878 = _2876 * _2868;
                _2858 = _2878;
            }
            float _2880 = _2858;
            float _2882 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2848);
            float _2884 = fma(_2880, _163, _2850);
            float _2886 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2844);
            float _2888 = fma(_2880, _161, _2882);
            float _2890 = -_435;
            float _2892 = _2890 + _2884;
            float _2894 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2886);
            float _2896 = -_441;
            float _2898 = _2896 + _2888;
            float _2900 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2902 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2904 = fma(_2880, _165, _2894);
            float _2906 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2908 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2900);
            float _2910 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2902);
            float _2912 = -_447;
            float _2914 = _2912 + _2904;
            float _2916 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2906);
            float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2908);
            float _2920 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2910);
            float _2922 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2916);
            _481 = _2920;
            _483 = _2918;
            _485 = _2922;
            _2760 = _2918;
            _2766 = _2920;
            _2772 = _2922;
            _2754 = _2892;
        }
        float _2924 = _481;
        float _2926 = _483;
        float _2928 = _485;
        float _2930 = _2760;
        float _2932 = _2766;
        float _2934 = _2772;
        float _2936 = _2754;
        float _2938 = _2736;
        float _2940 = _2924 * _2924;
        float _2942 = rsqrt(_2718);
        float _2944 = fma(_2926, _2926, _2940);
        float _2946 = fma(_2928, _2928, _2944);
        float _2948 = sqrt(_2946);
        float _2950 = _2708 * _2942;
        float _2952 = _2704 * _2942;
        float _2954 = _2712 * _2942;
        bool _2956 = _2948 > 0.0;
        float _2958 = _2938;
        float _2960 = _2936;
        _2728 = _2954;
        if (!_2956)
        {
            _2958 = _2698;
        }
        float _2962 = _2958;
        _2738 = _2962;
        if (!_2956)
        {
            _2960 = _2700;
        }
        float _2964 = _2960;
        bool _2966 = !_2956;
        _2744 = _2964;
        if (!_2966)
        {
            float _2968 = rsqrt(_2946);
            float _2970 = _2968 * _2924;
            float _2972 = _2968 * _2926;
            float _2974 = _2968 * _2928;
            float _2976 = _2952 * _2970;
            float _2978 = fma(_2950, _2972, _2976);
            float _2980 = fma(_2954, _2974, _2978);
            float _2982 = _2980 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2984 = fma(_2930, _2982, _2698);
            float _2986 = fma(_2932, _2982, _2696);
            float _2988 = fma(_2934, _2982, _2700);
            _2726 = _2986;
            _2744 = _2988;
            _2738 = _2984;
        }
    }
    float _2990 = _2726;
    float _2992 = _2744;
    float _2994 = _2738;
    float _2996 = _2728;
    float _2998 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3000 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3002 = isnan(0.5);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3008 = _3004 || _3006;
    float _3010 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2998);
    float _3012 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3014 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3016 = isnan(0.5);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3022 = _3018 || _3020;
    float _3024 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3010);
    float _3026 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3028 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3012);
    float _3030 = 1.0 / _3026;
    float _3032 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3028);
    float _3034 = _2996;
    if (_3022)
    {
        _2730 = 1.0;
    }
    float _3036 = _2730;
    float _3038 = _3032 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3040 = _3038 + _3026;
    float _3042 = -_2406;
    float _3044 = _3042 + _2990;
    float _3046 = _3040 * _3030;
    float _3048 = _3046 * 0.5;
    float _3050 = -_2412;
    float _3052 = _3050 + _2992;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3054);
    float _3058 = -_2404;
    float _3060 = _3058 + _2994;
    float _3062 = 1.0 / _3056;
    float _3064 = _3044;
    float _3066 = _3060;
    float _3068 = _3052;
    float _3070 = _3036;
    if (!_3008)
    {
        float _3072 = _2422 * _2422;
        float _3074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3076 = -_1988;
        float _3078 = _3076 + _2992;
        float _3080 = -_1976;
        float _3082 = _3080 + _2994;
        float _3084 = fma(_2430, _2430, _3072);
        float _3086 = -_1936;
        float _3088 = _3086 + _2990;
        float _3090 = fma(_2436, _2436, _3084);
        float _3092 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3094 = sqrt(_3090);
        float _3096 = 1.0 / _2520;
        float _3098 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3100 = precise::min(_3094, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3102 = _3100 * _3074;
        float _3104 = _3102 * _3096;
        float _3106 = _3098 * _3104;
        float _3108 = _3078 * _3104;
        float _3110 = fma(_3082, _3106, _2416);
        float _3112 = fma(_3088, _3106, _2410);
        float _3114 = fma(_3098, _3108, _2426);
        _3064 = _3112;
        _3066 = _3110;
        _3068 = _3114;
        _2644 = _3096;
    }
    float _3116 = _3064;
    float _3118 = _3066;
    float _3120 = _3068;
    float _3122 = _2644;
    float _3124 = _3122;
    if (_3022)
    {
        _2732 = 1.0;
    }
    float _3126 = _2732;
    float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3130 = _3062 * _3128;
    float _3132 = _3126;
    if (!_3022)
    {
        float _3134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3136 = _3134 * 0.15915493667125701904296875;
        float _3138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3140 = _3136 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        float _3144 = _3138 * 0.15915493667125701904296875;
        float _3146 = _3136 * 6.283185482025146484375;
        float _3148 = sin(_3146);
        float _3150 = 1.0 / _3142;
        float _3152 = _3144 * 6.283185482025146484375;
        float _3154 = cos(_3152);
        float _3156 = _3148 * _3150;
        float _3158 = _3144 * 6.283185482025146484375;
        float _3160 = sin(_3158);
        float _3162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3164 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3162;
        float _3166 = _3154 * _3156;
        float _3168 = 1.0 / _3164;
        float _3170 = 1.0 / _3166;
        float _3172 = _3160 * _3170;
        float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3176 = fma(_3130, _3172, _3174);
        float _3178 = _3176 * _3168;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        _2486 = _3168;
        _3124 = _3136;
        _3070 = _3180;
    }
    float _3182 = _2486;
    float _3184 = _3124;
    float _3186 = _3070;
    float _3188 = _3182;
    float _3190 = _3184;
    if (!_3022)
    {
        float _3192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3194 = _3192 * 0.15915493667125701904296875;
        float _3196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3198 = _3194 * 6.283185482025146484375;
        float _3200 = cos(_3198);
        float _3202 = _3196 * 0.15915493667125701904296875;
        float _3204 = _3194 * 6.283185482025146484375;
        float _3206 = sin(_3204);
        float _3208 = 1.0 / _3200;
        float _3210 = _3202 * 6.283185482025146484375;
        float _3212 = cos(_3210);
        float _3214 = _3206 * _3208;
        float _3216 = _3202 * 6.283185482025146484375;
        float _3218 = sin(_3216);
        float _3220 = _3212 * _3214;
        float _3222 = 1.0 / _3220;
        float _3224 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3226 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3224;
        float _3228 = 1.0 / _3226;
        float _3230 = _3218 * _3222;
        float _3232 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3234 = fma(_3130, _3230, _3232);
        float _3236 = _3234 * _3228;
        float _3238 = precise::clamp(_3236, 0.0, 1.0);
        float _3240 = -_3238;
        float _3242 = _3240 + 1.0;
        _3188 = _3222;
        _3190 = _3220;
        _3132 = _3242;
    }
    float _3244 = _3188;
    float _3246 = _3190;
    float _3248 = _3132;
    float _3250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3252 = _3116 + _3250;
    float _3254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3256 = _3118 + _3254;
    float _3258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3260 = _3120 + _3258;
    float _3262 = _3252 * _3252;
    float _3264 = fma(_3256, _3256, _3262);
    float _3266 = fma(_3260, _3260, _3264);
    float _3268 = rsqrt(_3266);
    float _3270 = sqrt(_3266);
    float _3272 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3274 = _3256 * _3272;
    float _3276 = _3260 * _3272;
    float _3278 = _3274 * _3274;
    float _3280 = _3276 * _3276;
    float _3282 = _3278 + _3280;
    float _3284 = sqrt(_3282);
    bool _3286 = _3284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3290 = _3284 + _3288;
    float _3292 = _3260;
    float _3294 = _3246;
    float _3296 = _3290;
    float _3298 = _3244;
    float _3300 = _3252;
    if (_3286)
    {
        float _3302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3292 = _3302;
    }
    float _3304 = _3292;
    if (_3286)
    {
        float _3306 = rsqrt(_3282);
        _3294 = _3306;
    }
    float _3308 = _3294;
    float _3310 = _3308;
    if (_3286)
    {
        float _3312 = _3290 * _3304;
        _3296 = _3312;
    }
    float _3314 = _3296;
    if (_3286)
    {
        float _3316 = _3314 * 0.15915493667125701904296875;
        _3298 = _3316;
    }
    float _3318 = _3298;
    float _3320 = _3268;
    if (_3286)
    {
        float _3322 = _3318 * 6.283185482025146484375;
        float _3324 = sin(_3322);
        _3320 = _3324;
    }
    float _3326 = _3320;
    float _3328 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3330 = precise::max(0.0, _3328);
    float _3332 = _3262;
    float _3334 = _3330;
    float _3336 = _3328;
    if (_3286)
    {
        float _3338 = _3318 * 6.283185482025146484375;
        float _3340 = cos(_3338);
        _3332 = _3340;
    }
    float _3342 = _3332;
    float _3344 = -_3272;
    float _3346 = -_3330;
    float _3348 = fma(_3252, _3344, _3346);
    if (!_3286)
    {
        _3300 = _3278;
    }
    float _3350 = _3300;
    float _3352 = _3350;
    if (_3286)
    {
        float _3354 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3334 = _3354;
    }
    float _3356 = _3334;
    float _3358 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3360 = _3356;
    float _3362 = _3326;
    if (_3286)
    {
        float _3364 = fma(_3326, _3356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3360 = _3364;
    }
    float _3366 = _3360;
    float _3368 = _3366;
    if (!_3286)
    {
        _3362 = _3274;
    }
    float _3370 = _3362;
    float _3372 = _3370;
    float _3374 = _3342;
    if (_3286)
    {
        float _3376 = _3342 + (-1.0);
        _3336 = _3376;
    }
    float _3378 = _3336;
    float _3380 = _3378;
    if (_3286)
    {
        float _3382 = _3308 * _3366;
        _3034 = _3382;
    }
    float _3384 = _3034;
    if (!_3286)
    {
        _3368 = _3348;
    }
    float _3386 = _3368;
    float _3388 = _3386;
    if (_3286)
    {
        float _3390 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3310 = _3390;
    }
    float _3392 = _3310;
    if (_3286)
    {
        float _3394 = _3274 * _3384;
        _3372 = _3394;
    }
    float _3396 = _3372;
    if (!_3286)
    {
        _3380 = _3276;
    }
    float _3398 = _3380;
    float _3400 = _3398;
    if (_3286)
    {
        float _3402 = _3276 * _3384;
        _3400 = _3402;
    }
    float _3404 = _3400;
    if (_3286)
    {
        float _3406 = fma(_3348, _3342, _3392);
        _3388 = _3406;
    }
    float _3408 = _3388;
    if (_3286)
    {
        float _3410 = _3396 * _3396;
        _3352 = _3410;
    }
    float _3412 = _3352;
    if (!_3286)
    {
        _3374 = _3280;
    }
    float _3414 = _3374;
    float _3416 = _3414;
    if (_3286)
    {
        float _3418 = _3404 * _3404;
        _3416 = _3418;
    }
    float _3420 = _3416;
    float _3422 = fma(_3408, _3408, _3412);
    float _3424 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3426 = _3422 + _3420;
    float _3428 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3358);
    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3432 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3430);
    float _3434 = precise::clamp(_3432, 0.0, 1.0);
    float _3436 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3438 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3440 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3442 = rsqrt(_3426);
    float _3444 = -_3434;
    float _3446 = _3444 + 1.0;
    float _3448 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3436);
    float _3450 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3438);
    float _3452 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3440);
    float _3454 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3428);
    float _3456 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3448);
    float _3458 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3450);
    float _3460 = abs(_3446);
    float _3462 = log2(_3460);
    float _3464 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3452);
    float _3466 = _3456 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3468 = _3454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3470 = _3458 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3472 = _3464 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3474 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3476 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3478 = _3442 * _3396;
    float _3480 = _3442 * _3408;
    float _3482 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3474);
    float _3484 = _3442 * _3404;
    float _3486 = _3478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3488 = -_3476;
    float _3490 = fma(_3488, _3424, 1.0);
    float _3492 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3482);
    float _3494 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3496 = -_3486;
    float _3498 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3496);
    float _3500 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3502 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3492);
    float _3504 = log2(_3490);
    float _3506 = -_3484;
    float _3508 = fma(_3506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3498);
    float _3510 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3512 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3494);
    float _3514 = _3480 + 1.0;
    float _3516 = fma(_3508, -0.5, 0.5);
    float _3518 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3510);
    float _3520 = fma(_3508, 0.5, 0.5);
    float _3522 = exp2(_3500);
    float _3524 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3512);
    float _3526 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3518);
    float _3528 = fma(_3520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3530 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3524);
    float _3532 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3526);
    float _3534 = fma(_3520, _3528, -0.212114393711090087890625);
    float _3536 = 1.0 / _3502;
    float _3538 = _3504 * 0.693147182464599609375;
    float _3540 = fma(_3520, _3534, 1.570728778839111328125);
    float _3542 = sqrt(_3516);
    float _3544 = -_3480;
    float _3546 = fma(_3522, _3514, _3544);
    float _3548 = _3538 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3550 = fma(_3546, 0.5, 0.5);
    float _3552 = _3530 * _3536;
    float _3554 = _3532 * _3536;
    float _3556 = fma(_3552, 0.5, 0.5);
    float _3558 = fma(_3554, -0.5, 0.5);
    float _3560 = _3542 * 0.636619746685028076171875;
    float3 _9058 = float3(_3556, _3558, _3548);
    float _3562 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9058, float3(0.0), isnan(_9058)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9058, float3(0.0), isnan(_9058)), level(0.0)).x;
    float _3564 = -_3540;
    float _3566 = fma(_3560, _3564, 1.0);
    float3 _9074 = float3(_3556, _3558, _3548);
    float4 _3569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9074, float3(0.0), isnan(_9074)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9074, float3(0.0), isnan(_9074)), level(0.0)).xyzw;
    float _3571 = _3569.x;
    float _3573 = _3569.y;
    float _3575 = _3569.z;
    float _3577 = _3569.w;
    float2 _9091 = float2(_3566, _3550);
    float3 _3581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9091, float2(0.0), isnan(_9091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9091, float2(0.0), isnan(_9091)), level(0.0)).xyz;
    float _3583 = _3581.x;
    float _3585 = _3581.y;
    float _3587 = _3581.z;
    float _3589 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3591 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3593 = _3186 > 0.0;
    bool _3595 = isnan(_3186);
    bool _3597 = _3593 || _3595;
    bool _3599 = isnan(0.0);
    bool _3601 = _3597 || _3599;
    float _3603 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3591);
    float _3605 = exp2(_3589);
    bool _3607 = _3248 <= 0.0;
    bool _3609 = !_3601;
    bool _3611 = _3607 || _3609;
    float _3613 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    float _3615 = _3186 * _3248;
    float _3617 = _3502 * 0.5;
    float _3619 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3613);
    float _3621 = _3530 + _3502;
    float _3623 = _3615 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3625 = fma(_3532, -0.5, _3617);
    float _3627 = _3619 + _3502;
    float _3629 = _3621 * 0.5;
    out.gl_Position.x = _3530;
    out.gl_Position.y = _3532;
    out.gl_Position.z = _3619;
    out.gl_Position.w = _3502;
    float _3631 = _3623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3633 = _3627 * 0.5;
    float _3635 = -_3605;
    float _3637 = _3635 + 1.0;
    out.m_45.x = _3631;
    float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3629;
    out.m_68.y = _3625;
    out.m_68.z = _3633;
    out.m_68.w = _3502;
    float _3641 = -_3639;
    float _3643 = _3641 + 1.0;
    float _3645 = _3639 * _3562;
    float _3647 = _3577 * _3645;
    float _3649 = _3577 * _3643;
    float _3651 = _3587 * _3645;
    float _3653 = fma(_3583, _3647, _3571);
    float _3655 = fma(_3585, _3647, _3573);
    float _3657 = fma(_3577, _3651, _3575);
    out.m_70.x = _3653;
    out.m_70.y = _3655;
    out.m_70.z = _3657;
    out.m_70.w = _3649;
    if (!_3611)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3659;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _905 = false;
    bool _753 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3716 = as_type<float>(_105);
        out.gl_Position.z = _3716;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3786 = as_type<float>(_143);
        out.gl_Position.z = _3786;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    float _237 = 0.0;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _147 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _147);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _267;
        _237 = _245;
    }
    float _269 = _235;
    float _271 = _237;
    float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _275 = !_159;
    float _277 = _271;
    float _279 = _269;
    if (!_275)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = 1.0 / _287;
        float _291 = _147 * _283;
        float _293 = exp2(_291);
        float _295 = -_293;
        float _297 = _295 + 1.0;
        float _299 = _297 * _289;
        _277 = _289;
        _211 = _299;
    }
    float _301 = _277;
    float _303 = _211;
    float _305 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = _301;
    float _315 = _303;
    if (!_159)
    {
        float _317 = _123 * _123;
        float _319 = _317 * 0.5;
        _313 = _319;
    }
    float _321 = _313;
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _329 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _331 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _331;
    }
    float _333 = _279;
    bool _335 = !_159;
    float _337 = _333;
    if (!_335)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = _123 * _341;
        float _351 = 1.0 / _345;
        float _353 = _347 * 0.693147182464599609375;
        float _355 = exp2(_349);
        float _357 = 1.0 / _353;
        float _359 = _355 + (-1.0);
        float _361 = -_359;
        float _363 = fma(_361, _357, _123);
        float _365 = _363 * _351;
        float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _337 = _367;
    }
    float _369 = _337;
    float _371 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _373 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _375 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _325);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _381 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _383 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _327);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].x, _379);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].y, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].z, _383);
    float _393 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _395 = fma(_303, _161, _373);
    float _397 = fma(_303, _163, _375);
    float _399 = fma(_303, _165, _385);
    float _401 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].x, _387);
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].y, _389);
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _391);
    if (!_159)
    {
        _315 = _123;
    }
    float _407 = _315;
    bool _409 = !_159;
    float _411 = _407;
    if (!_409)
    {
        float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _415 = log2(_413);
        float _417 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _419 = _417 + 1.0;
        float _421 = 1.0 / _419;
        float _423 = _123 * _415;
        float _425 = exp2(_423);
        float _427 = -_425;
        float _429 = _427 + 1.0;
        float _431 = _429 * _421;
        _411 = _431;
    }
    float _433 = _411;
    float _435 = fma(_433, _163, _403);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = fma(_397, _149, _169);
    float _441 = fma(_433, _161, _401);
    float _443 = -_435;
    float _445 = _397 + _443;
    float _447 = fma(_433, _165, _405);
    float _449 = fma(_395, _149, _167);
    float _451 = -_441;
    float _453 = _395 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _445 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _461 = -_447;
    float _463 = _399 + _461;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _469 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].x, _459);
    float _471 = fma(_399, _149, _171);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    bool _479 = !_437;
    float _481 = _475;
    float _483 = _473;
    float _485 = _477;
    float _503;
    if (!_479)
    {
        float _487 = in.m_54.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_89);
        float _509 = 1.0 / _507;
        float _511 = _123 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = _513 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _513 + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _539 = 1.0 / _525;
    bool _541 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _543 = isnan(_513);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = 1.0 / _529;
    float _557 = 1.0 / _533;
    float _559 = _517 * _539;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _563 = _513 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _567 = _513 + _565;
    float _569 = 1.0 / _537;
    float _571 = _521 * _555;
    bool _573 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _575 = isnan(_513);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_551;
    float _587 = _585 + 1.0;
    float _589 = _583 * _587;
    float _591 = _563 * _557;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _593;
    bool _597 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _599 = isnan(_513);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = fma(_595, _559, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _615 = fma(_611, _571, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = _567 * _569;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _619;
    bool _623 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _625 = isnan(_513);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    bool _635 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _637 = isnan(_513);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_621, _559, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _649 = -_583;
    float _651 = _649 + 1.0;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = _633 * _651;
    float _659 = -_633;
    float _661 = _659 + 1.0;
    float _663 = fma(_655, _571, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = in.m_52.x;
    float _667 = in.m_52.y;
    float _669 = _607 * _661;
    float _671 = -_607;
    float _673 = _671 + 1.0;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = _645 * _673;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _685;
    float _689 = fma(_677, _591, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _691 = _613 * _679;
    float _693 = _647 * _679;
    float _695 = fma(_687, _591, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].x, _691);
    float _703 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _709 = fma(_699, _617, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _711 = fma(_663, _669, _701);
    float _713 = fma(_615, _669, _703);
    float _715 = fma(_707, _617, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _717 = fma(_695, _657, _711);
    float _719 = fma(_689, _657, _713);
    float _721 = fma(_709, _589, _717);
    float _723 = fma(_715, _589, _719);
    float _725 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[147].x, _721);
    float _727 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[147].y, _723);
    float _729 = _725 * _665;
    float _731 = _727 * _667;
    bool _733 = !_553;
    float _751;
    if (!_733)
    {
        float _735 = in.m_54.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_89);
        float _757 = 1.0 / _755;
        float _759 = _123 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _761 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _771 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _773 = isnan(_761);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _787 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _789 = isnan(_761);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _799;
    bool _803 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _805 = isnan(_761);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _769;
    float _817 = -_781;
    float _819 = _817 + 1.0;
    bool _821 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _823 = 1.0 / _785;
    float _825 = _801 * _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _831 = -_813;
    float _833 = _831 + 1.0;
    float _835 = fma(_825, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _837 = _797 * _819;
    float _839 = -_797;
    float _841 = _839 + 1.0;
    float _843 = _781 * _833;
    float _845 = _829 * _823;
    float _847 = _835 * _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _761 + _849;
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _847);
    float _855 = fma(_845, _851, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _857 = fma(_855, _843, _853);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _865 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[117].x, _857);
    float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _867;
    out.m_56.y = _869;
    out.m_56.z = _871;
    out.m_56.w = _873;
    bool _875 = !_821;
    float _899;
    float _901;
    float _903;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _881 = float(_89);
        float _883 = 1.0 / _881;
        float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = _123 * _883;
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _891 = _889 * _879;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = _881;
        _903 = _887;
        _905 = true;
    }
    else
    {
        float _907 = float(_89);
        float _909 = 1.0 / _907;
        float _911 = _123 * _909;
        _899 = _911;
        _901 = _907;
        _903 = _911;
    }
    _905 = false;
    float _913 = _899;
    float _915 = _901;
    float _917 = _903;
    float _919 = in.m_54.x;
    float _921 = in.m_54.y;
    float _923 = in.m_54.z;
    float _925 = in.m_54.w;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _929 = int(_927);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = _913 + _931;
    float _935 = _729 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _937 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _939 = int(_937);
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _947 = float(_929);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _955 = 1.0 / _947;
    float _957 = _919 * 2.0;
    bool _959 = _925 > 0.5;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _961;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _969 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[79].z, _941);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _985 = _983 != 0;
    float _987 = 1.0 / _963;
    float _989 = -_225;
    int _991 = _959 ? as_type<int>(_989) : as_type<int>(_225);
    float _993 = _921 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _997 = _995 != 0;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1001 = !_985;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1011 = _1009 != 0;
    float _1013 = floor(_957);
    bool _1015 = !_977;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = _919 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1021 = !_973;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = _921 + _923;
    bool _1027 = !_981;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = _923 * 2.0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1035 = _1033 != 0;
    float _1037 = 1.0 / _967;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1041 = _1039 != 0;
    float _1043 = _921 + (-0.5);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1047 = _1045 != 0;
    float _1049 = _921 * 2.0;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1057 = !_997;
    float _1059 = _1057 ? _225 : as_type<float>(_991);
    float _1061 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1063 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1065 = !_1011;
    int _1067 = _1065 ? 0 : 1;
    float _1069 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1055);
    bool _1071 = _919 > 0.5;
    float _1073 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1063);
    float _1075 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1061);
    float _1077 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1069);
    float _1079 = -_221;
    int _1081 = _1071 ? as_type<int>(_1079) : as_type<int>(_221);
    float _1083 = 1.0 / _945;
    bool _1085 = _921 > 0.5;
    float _1087 = _933 * _987;
    bool _1089 = !_1041;
    float _1091 = _1089 ? _221 : as_type<float>(_1081);
    float _1093 = _919 + (-0.5);
    float _1095 = -_225;
    int _1097 = _1085 ? as_type<int>(_1095) : as_type<int>(_225);
    bool _1099 = _923 > 0.5;
    float _1101 = 1.0 / _951;
    float _1103 = float(uint(_939));
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1111 = _1109 != 0;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1115 = _1113 != 0;
    float _1117 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    float _1119 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
    float _1121 = _123 * _955;
    float _1123 = -_221;
    int _1125 = _1099 ? as_type<int>(_1123) : as_type<int>(_221);
    float _1127 = 1.0 / _1103;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1131 = _1129 != 0;
    float _1133 = _923 + (-0.5);
    float _1135 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[78].w, _999);
    float _1137 = trunc(_1121);
    int _1139 = int(_1137);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1145 = !_1047;
    float _1147 = _1145 ? _225 : as_type<float>(_1097);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1153 = fma(_993, -2.0, _1141);
    float _1155 = -_1143;
    float _1157 = fma(_1019, 2.0, _1155);
    int _1159 = as_type<int>(_1127) + (-2);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1165 = _923 + _919;
    float _1167 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[78].z, _953);
    float _1169 = _955;
    float _1171 = _1069;
    float _1173 = _923;
    if (!_1131)
    {
        _1169 = _923;
    }
    float _1175 = _1169;
    float _1177 = _921 + _919;
    float _1179 = _1175;
    if (!_1131)
    {
        _1171 = _921;
    }
    float _1181 = _1171;
    float _1183 = 1.0 / _1007;
    float _1185 = float(uint(_1139));
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1191 = !_1131;
    float _1193 = _1191 ? _921 : _919;
    float _1195 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1135);
    float _1197 = _1181;
    if (_1131)
    {
        _1173 = _921;
    }
    float _1199 = _1173;
    float _1201 = as_type<float>(_1159) * _1185;
    if (_1131)
    {
        _1179 = _921;
    }
    float _1203 = _1179;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1207 = _913 + _1205;
    float _1209 = 1.0 / _1151;
    int _1211 = ~_939;
    int _1213 = _1211 + 1;
    float _1215 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1221 = _1013 >= 0.0;
    bool _1223 = isnan(_1013);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    if (_1131)
    {
        _1197 = _919;
    }
    float _1231 = _1197;
    float _1233 = trunc(_1201);
    float _1235 = precise::max(_1233, 0.0);
    uint _1238 = uint(_1235);
    float _1240 = _1207 * _1037;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1242;
    int _1246 = _1229 ? 0 : 1;
    float _1248 = _1244 * _1083;
    bool _1250 = _1013 > 0.0;
    float _1252 = 1.0 / _1163;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1266 = _1256 * _1183;
    float _1268 = _1260 * _1101;
    float _1270 = _1264 * _1209;
    int _1272 = _1213 * int(_1238);
    int _1274 = _1272 + _1139;
    float _1276 = 1.0 / _1189;
    int _1278 = ~_1246;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = float(uint(_1274));
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1286;
    int _1290 = _1282;
    if (!_1250)
    {
        int _1292 = ~_1246;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = 1.0 / _1219;
    bool _1300 = !_1131;
    float _1302 = _1300 ? 1.2345600128173828125 : 1.0;
    float _1304 = as_type<float>(_1159) * _1284;
    float _1306 = _1288 * _1252;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1312 = 1.0 / _915;
    float _1314 = _1310 * _1276;
    int _1316 = abs(_1017);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1318;
    int _1322 = ~_939;
    int _1324 = _1322 + 1;
    float _1326 = floor(_1049);
    int _1328 = abs(_1023);
    float _1330 = _1320 * _1298;
    float _1332 = _1165 + (-1.0);
    float _1334 = _1025 + (-1.0);
    bool _1336 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1338 = isnan(_917);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = trunc(_1304);
    float _1350 = precise::max(_1348, 0.0);
    uint _1352 = uint(_1350);
    float _1354 = float(_939);
    int _1356 = ~_939;
    int _1358 = _1356 + 1;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1362 = _123 * _1354;
    bool _1364 = _1326 >= 0.0;
    bool _1366 = isnan(_1326);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = floor(_1031);
    float _1376 = _1362 * _1312;
    float _1378 = _1302 * _1193;
    float _1380 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1382 = !_1053;
    float _1384 = _1382 ? _221 : as_type<float>(_1125);
    int _1386 = _1372 ? 0 : 1;
    float _1388 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1390 = log2(_1388);
    int _1392 = int(_1238) + int(_1352);
    bool _1394 = _1326 > 0.0;
    int _1396 = _1324 * _1392;
    int _1398 = _1396 + _1139;
    float _1400 = trunc(_1376);
    int _1402 = int(_1400);
    int _1404 = ~_1386;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1412 = uint(_1398) >= uint(_939);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1422;
    bool _1426 = !_1412;
    int _1428 = _1426 ? 0 : (-1);
    float _1430 = floor(_1378);
    float _1432 = _123 * _1390;
    int _1434 = _1408;
    if (!_1394)
    {
        int _1436 = ~_1386;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    float _1442 = fma(_1424, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1444 = _1374 > 0.0;
    float _1446 = fma(_1420, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1448 = _1374 >= 0.0;
    bool _1450 = isnan(_1374);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1458;
    float _1462 = fma(_1416, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1464 = exp2(_1432);
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1470 = float(_1139);
    float _1472 = fma(_1460, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1480 = _917 + _1478;
    bool _1482 = _1470 >= _1354;
    bool _1484 = isnan(_1470);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1354);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = -_1430;
    float _1496 = _1378 + _1494;
    int _1498 = ~_1392;
    int _1500 = _1498 + _1428;
    int _1502 = _1500 + 1;
    float _1504 = fma(_1248, _1480, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1506 = trunc(_1492);
    int _1508 = int(_1506);
    float _1510 = _1496 * _1354;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1514 = _917 + _1512;
    int _1516 = _1456 ? 0 : 1;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1520 = _917 + _1518;
    bool _1522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = -_1464;
    float _1534 = _1532 + 1.0;
    float _1536 = fma(_1268, _1514, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1540 = _917 + _1538;
    int _1542 = _939 * _1502;
    int _1544 = _1542 + _1139;
    float _1546 = fma(_1270, _1520, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1548 = _1530 ? _1534 : 0.0;
    float _1550 = fma(_1306, _1540, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1552 = _939 == 0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1556 = _917 + _1554;
    float _1558 = trunc(_1510);
    int _1560 = int(_1558);
    int _1562 = ~_1508;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    float _1568 = fma(_1476, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1570 = !_1552;
    int _1572 = _1570 ? _1544 : (-1);
    float _1574 = fma(_1468, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1576 = abs(_1067);
    float _1578 = fma(_1314, _1556, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    int _1580 = _939 + (-1);
    int _1582 = _1572 * _1566;
    int _1584 = abs(_1029);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1588 = _917 + _1586;
    int _1590 = _1508 * _1580;
    int _1592 = _1590 + _1582;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1596 = _917 + _1594;
    float _1598 = fma(_1266, _1588, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1600 = _1592 * _1316;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1604 = _1560 * _1576;
    int _1606 = _1604 + _1139;
    bool _1608 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1610 = isnan(_913);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    int _1620 = _1402 * _1328;
    int _1622 = _1620 + _1600;
    float _1624 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1602);
    bool _1626 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1628 = isnan(_917);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = fma(_1330, _1596, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1640 = _1606 * _1584;
    int _1642 = _1640 + _1622;
    bool _1644 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1646 = isnan(_913);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -_1618;
    float _1658 = _1656 + 1.0;
    bool _1660 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1662 = isnan(_917);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = -_1636;
    float _1674 = _1672 + 1.0;
    bool _1676 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1678 = isnan(_913);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1654 * _1658;
    float _1690 = -_1654;
    float _1692 = _1690 + 1.0;
    int _1694 = abs(_1003);
    float _1696 = _1670 * _1674;
    bool _1698 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1700 = isnan(_917);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = -_1670;
    float _1712 = _1710 + 1.0;
    float _1714 = _1686 * _1692;
    int _1716 = _1560 * _1694;
    int _1718 = _1716 + _1642;
    bool _1720 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1722 = isnan(_917);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1708 * _1712;
    float _1734 = -_1708;
    float _1736 = _1734 + 1.0;
    float _1738 = _1442 * _1714;
    float _1740 = _1462 * _1714;
    float _1742 = _1472 * _1714;
    bool _1744 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1746 = isnan(_917);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = _1730 * _1736;
    float _1758 = -_1730;
    float _1760 = _1758 + 1.0;
    float _1762 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _969);
    float _1764 = -_1754;
    float _1766 = _1764 + 1.0;
    float _1768 = _1754 * _1760;
    float _1770 = float(uint(_1718));
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1774 = 1.0 + _1772;
    bool _1776 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1778 = isnan(_917);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1624);
    bool _1790 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1792 = isnan(_917);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1798 = _1794 || _1796;
    float _1800 = float(_1798);
    float _1802 = as_type<float>(_1159) * _1770;
    float _1804 = 1.0 / _1774;
    float _1806 = _1800 * _1766;
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1814 = _1762 * (-0.15915493667125701904296875);
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1818 = _1346 * _1810;
    float _1820 = trunc(_1802);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    float _1826 = -_1346;
    float _1828 = _1826 + 1.0;
    float _1830 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1812);
    float _1832 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1834 = fma(_1215, -2.0, _1816);
    float _1836 = _1786 * _1828;
    float _1838 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1830);
    float _1840 = -_1360;
    float _1842 = fma(_1832, 2.0, _1840);
    float _1844 = _1814 * 6.283185482025146484375;
    float _1846 = sin(_1844);
    float _1848 = _1548 * _1804;
    float _1850 = -_1786;
    float _1852 = _1850 + 1.0;
    float _1854 = _1504 * _1836;
    float _1856 = -_1686;
    float _1858 = _1856 + 1.0;
    int _1860 = ~_1516;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1834);
    int _1868 = _1864;
    if (!_1444)
    {
        int _1870 = ~_1516;
        int _1872 = _1870 + 1;
        _1868 = _1872;
    }
    int _1874 = _1868;
    float _1876 = _1814 * 6.283185482025146484375;
    float _1878 = cos(_1876);
    int _1880 = _1358 * int(_1824);
    int _1882 = _1880 + _1718;
    float _1884 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1738);
    float _1886 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1740);
    float _1888 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1742);
    float _1890 = -_123;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1842);
    float _1894 = float(uint(_1882));
    float _1896 = fma(_1568, _1688, _1884);
    float _1898 = _1147 * _1846;
    float _1900 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1854);
    float _1902 = fma(_1446, _1688, _1886);
    float _1904 = as_type<float>(_1159) * _1894;
    float _1906 = fma(_1574, _1688, _1888);
    bool _1908 = !_1111;
    int _1910 = _1908 ? 0 : 1;
    float _1912 = fma(_1598, _1818, _1900);
    float _1914 = trunc(_1904);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1147 * _1878;
    float _1922 = -_1898;
    float _1924 = fma(_1091, _1878, _1922);
    int _1926 = abs(_1910);
    float _1928 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1902);
    float _1930 = fma(_1091, _1846, _1920);
    float _1932 = _1384 + 0.5;
    float _1934 = _1059 + (-0.5);
    float _1936 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1938 = fma(_1536, _1806, _1912);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1892);
    int _1942 = ~_939;
    int _1944 = _1942 + 1;
    float _1946 = -_1934;
    float _1948 = -_1866;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1948);
    float _1952 = float(_1926);
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1956 = _1936 + _1954;
    float _1958 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1906);
    int _1960 = int(_1824) + int(_1918);
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1964 = float(_1296);
    float _1966 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1896);
    bool _1968 = !_1107;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1944 * _1960;
    int _1974 = _1972 + _1718;
    float _1976 = _1117 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1978 = _1952 * _1964;
    bool _1980 = !_1115;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1986 = uint(_1974) >= uint(_939);
    float _1988 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1976 + _1990;
    float _1994 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1996 = abs(_1970);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2000 = _1988 + _1998;
    int _2002 = abs(_1982);
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1994);
    float _2006 = float(_1440);
    float _2008 = fma(_1546, _1768, _1938);
    bool _2010 = !_1986;
    int _2012 = _2010 ? 0 : (-1);
    float _2014 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2004);
    float _2016 = float(uint(_1606));
    float _2018 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2020 = ~_1960;
    int _2022 = _2020 + _2012;
    int _2024 = _2022 + 1;
    float _2026 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2028 = float(_2002);
    float _2030 = as_type<float>(_1159) * _2016;
    float _2032 = float(_1996);
    int _2034 = _939 * _2024;
    int _2036 = _2034 + _1718;
    float _2038 = float(_1874);
    float _2040 = _2028 * _2006;
    int _2042 = ~_939;
    int _2044 = _2042 + 1;
    float _2046 = trunc(_2030);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    bool _2052 = _2014 >= 0.0;
    float _2054 = _2032 * _2038;
    float _2056 = in.m_58.x;
    float _2058 = in.m_58.y;
    float _2060 = in.m_58.z;
    float _2062 = -_123;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1157);
    float _2066 = _1924 + 0.5;
    bool _2068 = !_1552;
    int _2070 = _2068 ? _2036 : (-1);
    float _2072 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1153);
    float _2074 = fma(_1550, _1756, _2008);
    float _2076 = fma(_2026, _2066, _2064);
    int _2078 = _2070 >> 31;
    float _2080 = _1978 * (-2.0);
    int _2082 = _2070 & 3;
    bool _2084 = _2082 != 0;
    float _2086 = _1930 + (-0.5);
    int _2088 = _2078 & 3;
    int _2090 = _2044 * int(_2050);
    int _2092 = _2090 + _1606;
    bool _2094 = uint(_2082) > 1u;
    float _2096 = fma(_1380, _2080, _1380);
    int _2098 = _2070 & 3;
    bool _2100 = _2098 != 0;
    float _2102 = -_2018;
    float _2104 = -_2072;
    float _2106 = fma(_2102, _2086, _2104);
    int _2108 = _2070 + _2088;
    float _2110 = -_1788;
    float _2112 = _2110 + 1.0;
    float _2114 = float(uint(_2092));
    float _2116 = -_1838;
    float _2118 = _2116 + 1.0;
    int _2120 = _2108 >> 2;
    float _2122 = -_1195;
    float _2124 = _2122 + 1.0;
    int _2126 = _2100 ? 0 : 1;
    float _2128 = fma(_2080, _2058, _2058);
    int _2130 = _2120 << 4;
    int _2132 = _2130 + 512;
    float _2134 = as_type<float>(_1159) * _2114;
    int _2136 = ~_2126;
    int _2138 = _2136 + 1;
    int _2140 = _2138 + 1;
    float _2142 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1167);
    int _2144 = _2140;
    if (!_2094)
    {
        int _2146 = ~_2126;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    int _2152 = _2132 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = -_2142;
    float _2172 = _2170 + 1.0;
    float _2174 = -_2118;
    float _2176 = fma(_1384, _2174, _1940);
    float _2178 = fma(_1930, _2124, _2106);
    float _2180 = fma(_1059, _2112, _1950);
    float _2182 = -_2172;
    float _2184 = fma(_1924, _2182, _2076);
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2188 = uint(int(uint(_2132) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    float _2204 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2206 = _1928 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2208 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2210 = trunc(_2134);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = _2040 * (-2.0);
    bool _2218 = _2082 != 3;
    float _2220 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2222 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2224 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2226 = uint(_2082) >= 2u;
    float _2228 = fma(_1410, _2216, _1410);
    int _2230 = abs(_2150);
    float _2232 = fma(_2216, _2060, _2060);
    bool _2234 = !_2084;
    int _2236 = _2234 ? 0 : 1;
    out.m_60.x = _2220;
    out.m_60.y = _2222;
    out.m_60.z = _2224;
    out.m_60.w = _2186;
    int _2238 = _2226 ? 0 : 1;
    float _2240 = fma(_1578, _1732, _2074);
    int _2242 = ~_939;
    int _2244 = _2242 + 1;
    out.m_62.x = _2184;
    out.m_62.y = _2178;
    out.m_62.z = _2176;
    out.m_62.w = _2180;
    int _2246 = ~_2238;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    float _2252 = fma(_1638, _1696, _2240);
    int _2254 = _2250;
    if (_2218)
    {
        int _2256 = ~_2238;
        int _2258 = _2256 + 1;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2128);
    int _2264 = int(_2050) + int(_2214);
    float _2266 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2252);
    bool _2268 = _2082 != 3;
    if (_2052)
    {
        out.m_45.x = 0.0;
    }
    float _2270 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2232);
    int _2272 = abs(_2236);
    int _2274 = _2244 * _2264;
    int _2276 = _2274 + _1606;
    out.m_64.x = _2266;
    int _2278 = ~_2230;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = abs(_2260);
    int _2286 = ~_2272;
    int _2288 = _2286 + 1;
    int _2290 = _2288 + 1;
    int _2292 = ~_2284;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    bool _2298 = !_2268;
    int _2300 = _2298 ? 0 : (-1);
    bool _2302 = uint(_2276) >= uint(_939);
    int _2304 = abs(_2300);
    int _2306 = _2282 * as_type<int>(_2202);
    bool _2308 = !_2302;
    int _2310 = _2308 ? 0 : (-1);
    int _2312 = _2290 * as_type<int>(_2194);
    int _2314 = _2312 + _2306;
    bool _2316 = !_1035;
    int _2318 = _2316 ? 0 : 1;
    int _2320 = ~_2264;
    int _2322 = _2320 + _2310;
    int _2324 = _2322 + 1;
    int _2326 = _2296 * as_type<int>(_2160);
    int _2328 = _2326 + _2314;
    float _2330 = _1956 * _1956;
    int _2332 = abs(_2318);
    int _2334 = ~_2304;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    float _2340 = fma(_1992, _1992, _2330);
    int _2342 = _939 * _2324;
    int _2344 = _2342 + _1606;
    int _2346 = ~_2332;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    float _2352 = fma(_2000, _2000, _2340);
    int _2354 = _2338 * as_type<int>(_2168);
    int _2356 = _2354 + _2328;
    bool _2358 = !_1552;
    int _2360 = _2358 ? _2344 : (-1);
    float _2362 = as_type<float>(_2304);
    if (_2052)
    {
        _2362 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2364 = _2362;
    int _2366 = _2356 * _2350;
    float _2368 = rsqrt(_2352);
    bool _2370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2372 = isnan(1.0);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2378 = _2374 || _2376;
    float _2380 = _935 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2382 = _2360 * _2332;
    int _2384 = _2382 + _2366;
    int _2386 = as_type<int>(_2364);
    if (_2052)
    {
        float _2388 = _2364 * 5.0;
        _2386 = as_type<int>(_2388);
    }
    int _2390 = _2386;
    bool _2392 = !_2378;
    float _2394 = _2392 ? _123 : _1848;
    float _2396 = float(_2384);
    if (_2052)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7239 = as_type<float>(_2390);
        out.gl_Position.z = _7239;
    }
    float _2398 = fma(_2394, _2096, _2262);
    out.m_66.y = _2396;
    float _2400 = _2398 * 0.15915493667125701904296875;
    float _2402 = _2380 * _2368;
    float _2404 = _1992 * _2402;
    float _2406 = _1956 * _2402;
    if (_2052)
    {
        return out;
    }
    float _2408 = -_2406;
    float _2410 = _1936 + _2408;
    float _2412 = _2000 * _2402;
    float _2414 = -_2404;
    float _2416 = _1976 + _2414;
    float _2418 = fma(_2394, _2228, _2270);
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2422 = _2410 + _2420;
    float _2424 = -_2412;
    float _2426 = _1988 + _2424;
    float _2428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2430 = _2416 + _2428;
    float _2432 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2436 = _2426 + _2434;
    float _2438 = _1177 + (-1.0);
    float _2440 = _2054 * (-2.0);
    float _2442 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2432);
    float _2444 = -_2406;
    float _2446 = _1956 + _2444;
    float _2448 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2450 = fma(_2440, _2056, _2056);
    float _2452 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2442);
    float _2454 = -_2404;
    float _2456 = _1992 + _2454;
    float _2458 = _2446 * _2446;
    float _2460 = fma(_2448, _2440, _2448);
    float _2462 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    bool _2464 = _2452 >= 0.0;
    float _2466 = fma(_2456, _2456, _2458);
    float _2468 = -_2412;
    float _2470 = _2000 + _2468;
    float _2472 = fma(_2394, _2460, _2462);
    float _2474 = _2418 * 0.15915493667125701904296875;
    float _2476 = _2400 * 6.283185482025146484375;
    float _2478 = sin(_2476);
    float _2480 = fma(_2470, _2470, _2466);
    float _2482 = _2472 * 0.15915493667125701904296875;
    float _2484 = _2432;
    float _2486 = _2426;
    if (_2464)
    {
        _2484 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2488 = _2484;
    float _2490 = _2400 * 6.283185482025146484375;
    float _2492 = cos(_2490);
    int _2494 = as_type<int>(_2488);
    if (_2464)
    {
        out.m_45.x = 0.0;
    }
    if (_2464)
    {
        float _2496 = _2488 * 5.0;
        _2494 = as_type<int>(_2496);
    }
    int _2498 = _2494;
    float _2500 = _2474 * 6.283185482025146484375;
    float _2502 = sin(_2500);
    if (_2464)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7415 = as_type<float>(_2498);
        out.gl_Position.z = _7415;
    }
    float _2504 = _2474 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    float _2508 = sqrt(_2480);
    float _2510 = _2482 * 6.283185482025146484375;
    float _2512 = sin(_2510);
    float _2514 = _2492;
    if (_2464)
    {
        return out;
    }
    float _2516 = _2482 * 6.283185482025146484375;
    float _2518 = cos(_2516);
    float _2520 = _2368 * _2508;
    float _2522 = _731 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2524 = _2492 * _2506;
    float _2526 = _2478 * _2502;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2530 = _2520 * _2522;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2534 = fma(_2512, _2526, _2524);
    float _2536 = fma(_2512, _2524, _2526);
    float _2538 = _935 * _2520;
    float _2540 = _2528 * _2530;
    float _2542 = _2492 * _2502;
    float _2544 = _2478 * _2506;
    float _2546 = _2532 * _2538;
    float _2548 = _2506 * _2518;
    float _2550 = -_2542;
    float _2552 = fma(_2512, _2544, _2550);
    float _2554 = _2502 * _2518;
    float _2556 = -_2544;
    float _2558 = fma(_2512, _2542, _2556);
    float _2560 = _2548 * _2540;
    float _2562 = _2552 * _2540;
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2566 = _2564 * 0.5;
    float _2568 = fma(_2554, _2546, _2560);
    float _2570 = _2536 * _2540;
    float _2572 = fma(_2534, _2546, _2562);
    float _2574 = _2518 * _2566;
    float _2576 = -_2512;
    float _2578 = fma(_2576, _2566, _2568);
    float _2580 = fma(_2558, _2546, _2570);
    float _2582 = fma(_2478, _2574, _2572);
    float _2584 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2586 = fma(_2492, _2574, _2580);
    float _2588 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2584);
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2596 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2598 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2600 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2594);
    float _2602 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2596);
    float _2604 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2606 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2608 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2610 = _1988 + _2604;
    float _2612 = _1976 + _2606;
    float _2614 = _1936 + _2608;
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2618 = _2610 + _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2622 = _2612 + _2620;
    float _2624 = _2618 * _2618;
    float _2626 = fma(_2622, _2622, _2624);
    float _2628 = sqrt(_2626);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = _2586;
    float _2634 = _2624;
    float _2636 = _2612;
    float _2638 = _2618;
    float _2640 = _2540;
    float _2642 = _2626;
    float _2644 = _2520;
    if (!_2630)
    {
        _2632 = _2612;
    }
    float _2646 = _2632;
    float _2648 = _2646;
    if (!_2630)
    {
        _2634 = _2610;
    }
    float _2650 = _2634;
    float _2652 = _2650;
    if (!_2630)
    {
        _2636 = _2614;
    }
    float _2654 = _2636;
    bool _2656 = !_2630;
    float _2658 = _2654;
    if (!_2656)
    {
        float _2660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2664 = _2628 + _2662;
        float _2666 = rsqrt(_2626);
        float _2668 = _2664 * _2660;
        float _2670 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2672 = _2668 * 0.15915493667125701904296875;
        float _2674 = _2672 * 6.283185482025146484375;
        float _2676 = cos(_2674);
        float _2678 = _2672 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        float _2682 = _2676 + (-1.0);
        float _2684 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2686 = fma(_2680, _2670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2688 = fma(_2614, _2676, _2684);
        float _2690 = _2666 * _2686;
        float _2692 = fma(_2622, _2690, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2694 = fma(_2618, _2690, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2658 = _2688;
        _2648 = _2692;
        _2652 = _2694;
    }
    float _2696 = _2658;
    float _2698 = _2648;
    float _2700 = _2652;
    float _2702 = -_1936;
    float _2704 = _2702 + _2696;
    float _2706 = -_1976;
    float _2708 = _2706 + _2698;
    float _2710 = -_1988;
    float _2712 = _2710 + _2700;
    float _2714 = _2704 * _2704;
    float _2716 = fma(_2708, _2708, _2714);
    float _2718 = fma(_2712, _2712, _2716);
    float _2720 = sqrt(_2718);
    bool _2722 = _2720 > 0.0;
    float _2724 = _2720;
    float _2726 = _2696;
    float _2728 = _2712;
    float _2730 = _2700;
    float _2732 = _2704;
    if (!_2722)
    {
        _2724 = _2698;
    }
    float _2734 = _2724;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2722)
    {
        _2638 = _2700;
    }
    float _2740 = _2638;
    bool _2742 = !_2722;
    float _2744 = _2740;
    if (!_2742)
    {
        bool _2746 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2748 = _2740;
        if (_2746)
        {
            float _2750 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2748 = _2750;
        }
        float _2752 = _2748;
        float _2754 = _2752;
        if (_2746)
        {
            float _2756 = _473 * _2752;
            _2514 = _2756;
        }
        float _2758 = _2514;
        float _2760 = _2758;
        if (_2746)
        {
            float _2762 = _475 * _2752;
            _2640 = _2762;
        }
        float _2764 = _2640;
        float _2766 = _2764;
        if (_2746)
        {
            float _2768 = _477 * _2752;
            _2642 = _2768;
        }
        float _2770 = _2642;
        float _2772 = _2770;
        if (!_2746)
        {
            bool _2774 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2778 = _2774 || _2776;
            bool _2780 = isnan(1.0);
            bool _2782 = _2778 || _2780;
            float _2784 = _123 + 1.0;
            if (!_2782)
            {
                float _2786 = _2784 * _2784;
                float _2788 = _2786 * 0.5;
                _125 = _2788;
            }
            float _2790 = _125;
            float _2792 = _2790;
            if (!_2782)
            {
                float _2794 = _2790 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2792 = _2794;
            }
            float _2796 = _2792;
            bool _2798 = !_2782;
            float _2800 = _2796;
            if (!_2798)
            {
                float _2802 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2804 = log2(_2802);
                float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2808 = 1.0 + _2806;
                float _2810 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2812 = _2804 * _2784;
                float _2814 = 1.0 / _2808;
                float _2816 = _2810 * 0.693147182464599609375;
                float _2818 = exp2(_2812);
                float _2820 = 1.0 / _2816;
                float _2822 = _2818 + (-1.0);
                float _2824 = -_2822;
                float _2826 = fma(_2824, _2820, _2784);
                float _2828 = _2826 * _2814;
                float _2830 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2800 = _2830;
            }
            float _2832 = _2800;
            float _2834 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2836 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2838 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2840 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2842 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2844 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2846 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2840);
            float _2848 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2842);
            float _2850 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2846);
            float _2852 = _2846;
            _2736 = _2838;
            if (!_2782)
            {
                _2852 = _2784;
            }
            float _2854 = _2852;
            bool _2856 = !_2782;
            float _2858 = _2854;
            if (!_2856)
            {
                float _2860 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2862 = log2(_2860);
                float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2866 = 1.0 + _2864;
                float _2868 = 1.0 / _2866;
                float _2870 = _2862 * _2784;
                float _2872 = exp2(_2870);
                float _2874 = -_2872;
                float _2876 = _2874 + 1.0;
                float _2878 = _2876 * _2868;
                _2858 = _2878;
            }
            float _2880 = _2858;
            float _2882 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2848);
            float _2884 = fma(_2880, _163, _2850);
            float _2886 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2844);
            float _2888 = fma(_2880, _161, _2882);
            float _2890 = -_435;
            float _2892 = _2890 + _2884;
            float _2894 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2886);
            float _2896 = -_441;
            float _2898 = _2896 + _2888;
            float _2900 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2902 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2904 = fma(_2880, _165, _2894);
            float _2906 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2908 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2900);
            float _2910 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2902);
            float _2912 = -_447;
            float _2914 = _2912 + _2904;
            float _2916 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2906);
            float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2908);
            float _2920 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2910);
            float _2922 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2916);
            _481 = _2920;
            _483 = _2918;
            _485 = _2922;
            _2760 = _2918;
            _2766 = _2920;
            _2772 = _2922;
            _2754 = _2892;
        }
        float _2924 = _481;
        float _2926 = _483;
        float _2928 = _485;
        float _2930 = _2760;
        float _2932 = _2766;
        float _2934 = _2772;
        float _2936 = _2754;
        float _2938 = _2736;
        float _2940 = _2924 * _2924;
        float _2942 = rsqrt(_2718);
        float _2944 = fma(_2926, _2926, _2940);
        float _2946 = fma(_2928, _2928, _2944);
        float _2948 = sqrt(_2946);
        float _2950 = _2708 * _2942;
        float _2952 = _2704 * _2942;
        float _2954 = _2712 * _2942;
        bool _2956 = _2948 > 0.0;
        float _2958 = _2938;
        float _2960 = _2936;
        _2728 = _2954;
        if (!_2956)
        {
            _2958 = _2698;
        }
        float _2962 = _2958;
        _2738 = _2962;
        if (!_2956)
        {
            _2960 = _2700;
        }
        float _2964 = _2960;
        bool _2966 = !_2956;
        _2744 = _2964;
        if (!_2966)
        {
            float _2968 = rsqrt(_2946);
            float _2970 = _2968 * _2924;
            float _2972 = _2968 * _2926;
            float _2974 = _2968 * _2928;
            float _2976 = _2952 * _2970;
            float _2978 = fma(_2950, _2972, _2976);
            float _2980 = fma(_2954, _2974, _2978);
            float _2982 = _2980 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2984 = fma(_2930, _2982, _2698);
            float _2986 = fma(_2932, _2982, _2696);
            float _2988 = fma(_2934, _2982, _2700);
            _2726 = _2986;
            _2744 = _2988;
            _2738 = _2984;
        }
    }
    float _2990 = _2726;
    float _2992 = _2744;
    float _2994 = _2738;
    float _2996 = _2728;
    float _2998 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3000 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3002 = isnan(0.5);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3008 = _3004 || _3006;
    float _3010 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2998);
    float _3012 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3014 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3016 = isnan(0.5);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3022 = _3018 || _3020;
    float _3024 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3010);
    float _3026 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3028 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3012);
    float _3030 = 1.0 / _3026;
    float _3032 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3028);
    float _3034 = _2996;
    if (_3022)
    {
        _2730 = 1.0;
    }
    float _3036 = _2730;
    float _3038 = _3032 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3040 = _3038 + _3026;
    float _3042 = -_2406;
    float _3044 = _3042 + _2990;
    float _3046 = _3040 * _3030;
    float _3048 = _3046 * 0.5;
    float _3050 = -_2412;
    float _3052 = _3050 + _2992;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3054);
    float _3058 = -_2404;
    float _3060 = _3058 + _2994;
    float _3062 = 1.0 / _3056;
    float _3064 = _3044;
    float _3066 = _3060;
    float _3068 = _3052;
    float _3070 = _3036;
    if (!_3008)
    {
        float _3072 = _2422 * _2422;
        float _3074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3076 = -_1988;
        float _3078 = _3076 + _2992;
        float _3080 = -_1976;
        float _3082 = _3080 + _2994;
        float _3084 = fma(_2430, _2430, _3072);
        float _3086 = -_1936;
        float _3088 = _3086 + _2990;
        float _3090 = fma(_2436, _2436, _3084);
        float _3092 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3094 = sqrt(_3090);
        float _3096 = 1.0 / _2520;
        float _3098 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3100 = precise::min(_3094, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3102 = _3100 * _3074;
        float _3104 = _3102 * _3096;
        float _3106 = _3098 * _3104;
        float _3108 = _3078 * _3104;
        float _3110 = fma(_3082, _3106, _2416);
        float _3112 = fma(_3088, _3106, _2410);
        float _3114 = fma(_3098, _3108, _2426);
        _3064 = _3112;
        _3066 = _3110;
        _3068 = _3114;
        _2644 = _3096;
    }
    float _3116 = _3064;
    float _3118 = _3066;
    float _3120 = _3068;
    float _3122 = _2644;
    float _3124 = _3122;
    if (_3022)
    {
        _2732 = 1.0;
    }
    float _3126 = _2732;
    float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3130 = _3062 * _3128;
    float _3132 = _3126;
    if (!_3022)
    {
        float _3134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3136 = _3134 * 0.15915493667125701904296875;
        float _3138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3140 = _3136 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        float _3144 = _3138 * 0.15915493667125701904296875;
        float _3146 = _3136 * 6.283185482025146484375;
        float _3148 = sin(_3146);
        float _3150 = 1.0 / _3142;
        float _3152 = _3144 * 6.283185482025146484375;
        float _3154 = cos(_3152);
        float _3156 = _3148 * _3150;
        float _3158 = _3144 * 6.283185482025146484375;
        float _3160 = sin(_3158);
        float _3162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3164 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3162;
        float _3166 = _3154 * _3156;
        float _3168 = 1.0 / _3164;
        float _3170 = 1.0 / _3166;
        float _3172 = _3160 * _3170;
        float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3176 = fma(_3130, _3172, _3174);
        float _3178 = _3176 * _3168;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        _2486 = _3168;
        _3124 = _3136;
        _3070 = _3180;
    }
    float _3182 = _2486;
    float _3184 = _3124;
    float _3186 = _3070;
    float _3188 = _3182;
    float _3190 = _3184;
    if (!_3022)
    {
        float _3192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3194 = _3192 * 0.15915493667125701904296875;
        float _3196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3198 = _3194 * 6.283185482025146484375;
        float _3200 = cos(_3198);
        float _3202 = _3196 * 0.15915493667125701904296875;
        float _3204 = _3194 * 6.283185482025146484375;
        float _3206 = sin(_3204);
        float _3208 = 1.0 / _3200;
        float _3210 = _3202 * 6.283185482025146484375;
        float _3212 = cos(_3210);
        float _3214 = _3206 * _3208;
        float _3216 = _3202 * 6.283185482025146484375;
        float _3218 = sin(_3216);
        float _3220 = _3212 * _3214;
        float _3222 = 1.0 / _3220;
        float _3224 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3226 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3224;
        float _3228 = 1.0 / _3226;
        float _3230 = _3218 * _3222;
        float _3232 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3234 = fma(_3130, _3230, _3232);
        float _3236 = _3234 * _3228;
        float _3238 = precise::clamp(_3236, 0.0, 1.0);
        float _3240 = -_3238;
        float _3242 = _3240 + 1.0;
        _3188 = _3222;
        _3190 = _3220;
        _3132 = _3242;
    }
    float _3244 = _3188;
    float _3246 = _3190;
    float _3248 = _3132;
    float _3250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3252 = _3116 + _3250;
    float _3254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3256 = _3118 + _3254;
    float _3258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3260 = _3120 + _3258;
    float _3262 = _3252 * _3252;
    float _3264 = fma(_3256, _3256, _3262);
    float _3266 = fma(_3260, _3260, _3264);
    float _3268 = rsqrt(_3266);
    float _3270 = sqrt(_3266);
    float _3272 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3274 = _3256 * _3272;
    float _3276 = _3260 * _3272;
    float _3278 = _3274 * _3274;
    float _3280 = _3276 * _3276;
    float _3282 = _3278 + _3280;
    float _3284 = sqrt(_3282);
    bool _3286 = _3284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3290 = _3284 + _3288;
    float _3292 = _3260;
    float _3294 = _3246;
    float _3296 = _3290;
    float _3298 = _3244;
    float _3300 = _3252;
    if (_3286)
    {
        float _3302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3292 = _3302;
    }
    float _3304 = _3292;
    if (_3286)
    {
        float _3306 = rsqrt(_3282);
        _3294 = _3306;
    }
    float _3308 = _3294;
    float _3310 = _3308;
    if (_3286)
    {
        float _3312 = _3290 * _3304;
        _3296 = _3312;
    }
    float _3314 = _3296;
    if (_3286)
    {
        float _3316 = _3314 * 0.15915493667125701904296875;
        _3298 = _3316;
    }
    float _3318 = _3298;
    float _3320 = _3268;
    if (_3286)
    {
        float _3322 = _3318 * 6.283185482025146484375;
        float _3324 = sin(_3322);
        _3320 = _3324;
    }
    float _3326 = _3320;
    float _3328 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3330 = precise::max(0.0, _3328);
    float _3332 = _3262;
    float _3334 = _3330;
    float _3336 = _3328;
    if (_3286)
    {
        float _3338 = _3318 * 6.283185482025146484375;
        float _3340 = cos(_3338);
        _3332 = _3340;
    }
    float _3342 = _3332;
    float _3344 = -_3272;
    float _3346 = -_3330;
    float _3348 = fma(_3252, _3344, _3346);
    if (!_3286)
    {
        _3300 = _3278;
    }
    float _3350 = _3300;
    float _3352 = _3350;
    if (_3286)
    {
        float _3354 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3334 = _3354;
    }
    float _3356 = _3334;
    float _3358 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3360 = _3356;
    float _3362 = _3326;
    if (_3286)
    {
        float _3364 = fma(_3326, _3356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3360 = _3364;
    }
    float _3366 = _3360;
    float _3368 = _3366;
    if (!_3286)
    {
        _3362 = _3274;
    }
    float _3370 = _3362;
    float _3372 = _3370;
    float _3374 = _3342;
    if (_3286)
    {
        float _3376 = _3342 + (-1.0);
        _3336 = _3376;
    }
    float _3378 = _3336;
    float _3380 = _3378;
    if (_3286)
    {
        float _3382 = _3308 * _3366;
        _3034 = _3382;
    }
    float _3384 = _3034;
    if (!_3286)
    {
        _3368 = _3348;
    }
    float _3386 = _3368;
    float _3388 = _3386;
    if (_3286)
    {
        float _3390 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3310 = _3390;
    }
    float _3392 = _3310;
    if (_3286)
    {
        float _3394 = _3274 * _3384;
        _3372 = _3394;
    }
    float _3396 = _3372;
    if (!_3286)
    {
        _3380 = _3276;
    }
    float _3398 = _3380;
    float _3400 = _3398;
    if (_3286)
    {
        float _3402 = _3276 * _3384;
        _3400 = _3402;
    }
    float _3404 = _3400;
    if (_3286)
    {
        float _3406 = fma(_3348, _3342, _3392);
        _3388 = _3406;
    }
    float _3408 = _3388;
    if (_3286)
    {
        float _3410 = _3396 * _3396;
        _3352 = _3410;
    }
    float _3412 = _3352;
    if (!_3286)
    {
        _3374 = _3280;
    }
    float _3414 = _3374;
    float _3416 = _3414;
    if (_3286)
    {
        float _3418 = _3404 * _3404;
        _3416 = _3418;
    }
    float _3420 = _3416;
    float _3422 = fma(_3408, _3408, _3412);
    float _3424 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3426 = _3422 + _3420;
    float _3428 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3358);
    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3432 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3430);
    float _3434 = precise::clamp(_3432, 0.0, 1.0);
    float _3436 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3438 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3440 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3442 = rsqrt(_3426);
    float _3444 = -_3434;
    float _3446 = _3444 + 1.0;
    float _3448 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3436);
    float _3450 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3438);
    float _3452 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3440);
    float _3454 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3428);
    float _3456 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3448);
    float _3458 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3450);
    float _3460 = abs(_3446);
    float _3462 = log2(_3460);
    float _3464 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3452);
    float _3466 = _3456 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3468 = _3454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3470 = _3458 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3472 = _3464 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3474 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3476 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3478 = _3442 * _3396;
    float _3480 = _3442 * _3408;
    float _3482 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3474);
    float _3484 = _3442 * _3404;
    float _3486 = _3478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3488 = -_3476;
    float _3490 = fma(_3488, _3424, 1.0);
    float _3492 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3482);
    float _3494 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3496 = -_3486;
    float _3498 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3496);
    float _3500 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3502 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3492);
    float _3504 = log2(_3490);
    float _3506 = -_3484;
    float _3508 = fma(_3506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3498);
    float _3510 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3512 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3494);
    float _3514 = _3480 + 1.0;
    float _3516 = fma(_3508, -0.5, 0.5);
    float _3518 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3510);
    float _3520 = fma(_3508, 0.5, 0.5);
    float _3522 = exp2(_3500);
    float _3524 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3512);
    float _3526 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3518);
    float _3528 = fma(_3520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3530 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3524);
    float _3532 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3526);
    float _3534 = fma(_3520, _3528, -0.212114393711090087890625);
    float _3536 = 1.0 / _3502;
    float _3538 = _3504 * 0.693147182464599609375;
    float _3540 = fma(_3520, _3534, 1.570728778839111328125);
    float _3542 = sqrt(_3516);
    float _3544 = -_3480;
    float _3546 = fma(_3522, _3514, _3544);
    float _3548 = _3538 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3550 = fma(_3546, 0.5, 0.5);
    float _3552 = _3530 * _3536;
    float _3554 = _3532 * _3536;
    float _3556 = fma(_3552, 0.5, 0.5);
    float _3558 = fma(_3554, -0.5, 0.5);
    float _3560 = _3542 * 0.636619746685028076171875;
    float3 _9058 = float3(_3556, _3558, _3548);
    float _3562 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9058, float3(0.0), isnan(_9058)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9058, float3(0.0), isnan(_9058)), level(0.0)).x;
    float _3564 = -_3540;
    float _3566 = fma(_3560, _3564, 1.0);
    float3 _9074 = float3(_3556, _3558, _3548);
    float4 _3569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9074, float3(0.0), isnan(_9074)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9074, float3(0.0), isnan(_9074)), level(0.0)).xyzw;
    float _3571 = _3569.x;
    float _3573 = _3569.y;
    float _3575 = _3569.z;
    float _3577 = _3569.w;
    float2 _9091 = float2(_3566, _3550);
    float3 _3581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9091, float2(0.0), isnan(_9091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9091, float2(0.0), isnan(_9091)), level(0.0)).xyz;
    float _3583 = _3581.x;
    float _3585 = _3581.y;
    float _3587 = _3581.z;
    float _3589 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3591 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3593 = _3186 > 0.0;
    bool _3595 = isnan(_3186);
    bool _3597 = _3593 || _3595;
    bool _3599 = isnan(0.0);
    bool _3601 = _3597 || _3599;
    float _3603 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3591);
    float _3605 = exp2(_3589);
    bool _3607 = _3248 <= 0.0;
    bool _3609 = !_3601;
    bool _3611 = _3607 || _3609;
    float _3613 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    float _3615 = _3186 * _3248;
    float _3617 = _3502 * 0.5;
    float _3619 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3613);
    float _3621 = _3530 + _3502;
    float _3623 = _3615 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3625 = fma(_3532, -0.5, _3617);
    float _3627 = _3619 + _3502;
    float _3629 = _3621 * 0.5;
    out.gl_Position.x = _3530;
    out.gl_Position.y = _3532;
    out.gl_Position.z = _3619;
    out.gl_Position.w = _3502;
    float _3631 = _3623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3633 = _3627 * 0.5;
    float _3635 = -_3605;
    float _3637 = _3635 + 1.0;
    out.m_45.x = _3631;
    float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3629;
    out.m_68.y = _3625;
    out.m_68.z = _3633;
    out.m_68.w = _3502;
    float _3641 = -_3639;
    float _3643 = _3641 + 1.0;
    float _3645 = _3639 * _3562;
    float _3647 = _3577 * _3645;
    float _3649 = _3577 * _3643;
    float _3651 = _3587 * _3645;
    float _3653 = fma(_3583, _3647, _3571);
    float _3655 = fma(_3585, _3647, _3573);
    float _3657 = fma(_3577, _3651, _3575);
    out.m_70.x = _3653;
    out.m_70.y = _3655;
    out.m_70.z = _3657;
    out.m_70.w = _3649;
    if (!_3611)
    {
        return out;
    }
    float _3659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3659;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _905 = false;
    bool _753 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3716 = as_type<float>(_105);
        out.gl_Position.z = _3716;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3786 = as_type<float>(_143);
        out.gl_Position.z = _3786;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    float _237 = 0.0;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _147 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _147);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _267;
        _237 = _245;
    }
    float _269 = _235;
    float _271 = _237;
    float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _275 = !_159;
    float _277 = _271;
    float _279 = _269;
    if (!_275)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = 1.0 / _287;
        float _291 = _147 * _283;
        float _293 = exp2(_291);
        float _295 = -_293;
        float _297 = _295 + 1.0;
        float _299 = _297 * _289;
        _277 = _289;
        _211 = _299;
    }
    float _301 = _277;
    float _303 = _211;
    float _305 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = _301;
    float _315 = _303;
    if (!_159)
    {
        float _317 = _123 * _123;
        float _319 = _317 * 0.5;
        _313 = _319;
    }
    float _321 = _313;
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _329 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _331 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _331;
    }
    float _333 = _279;
    bool _335 = !_159;
    float _337 = _333;
    if (!_335)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = _123 * _341;
        float _351 = 1.0 / _345;
        float _353 = _347 * 0.693147182464599609375;
        float _355 = exp2(_349);
        float _357 = 1.0 / _353;
        float _359 = _355 + (-1.0);
        float _361 = -_359;
        float _363 = fma(_361, _357, _123);
        float _365 = _363 * _351;
        float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _337 = _367;
    }
    float _369 = _337;
    float _371 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _373 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _375 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _325);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _381 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _383 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _327);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].x, _379);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].y, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].z, _383);
    float _393 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _395 = fma(_303, _161, _373);
    float _397 = fma(_303, _163, _375);
    float _399 = fma(_303, _165, _385);
    float _401 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].x, _387);
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].y, _389);
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _391);
    if (!_159)
    {
        _315 = _123;
    }
    float _407 = _315;
    bool _409 = !_159;
    float _411 = _407;
    if (!_409)
    {
        float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _415 = log2(_413);
        float _417 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _419 = _417 + 1.0;
        float _421 = 1.0 / _419;
        float _423 = _123 * _415;
        float _425 = exp2(_423);
        float _427 = -_425;
        float _429 = _427 + 1.0;
        float _431 = _429 * _421;
        _411 = _431;
    }
    float _433 = _411;
    float _435 = fma(_433, _163, _403);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = fma(_397, _149, _169);
    float _441 = fma(_433, _161, _401);
    float _443 = -_435;
    float _445 = _397 + _443;
    float _447 = fma(_433, _165, _405);
    float _449 = fma(_395, _149, _167);
    float _451 = -_441;
    float _453 = _395 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _445 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _461 = -_447;
    float _463 = _399 + _461;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _469 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].x, _459);
    float _471 = fma(_399, _149, _171);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    bool _479 = !_437;
    float _481 = _475;
    float _483 = _473;
    float _485 = _477;
    float _503;
    if (!_479)
    {
        float _487 = in.m_54.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_89);
        float _509 = 1.0 / _507;
        float _511 = _123 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = _513 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _513 + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _539 = 1.0 / _525;
    bool _541 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _543 = isnan(_513);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = 1.0 / _529;
    float _557 = 1.0 / _533;
    float _559 = _517 * _539;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _563 = _513 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _567 = _513 + _565;
    float _569 = 1.0 / _537;
    float _571 = _521 * _555;
    bool _573 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _575 = isnan(_513);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_551;
    float _587 = _585 + 1.0;
    float _589 = _583 * _587;
    float _591 = _563 * _557;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _593;
    bool _597 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _599 = isnan(_513);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = fma(_595, _559, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _615 = fma(_611, _571, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = _567 * _569;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _619;
    bool _623 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _625 = isnan(_513);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    bool _635 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _637 = isnan(_513);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_621, _559, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _649 = -_583;
    float _651 = _649 + 1.0;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = _633 * _651;
    float _659 = -_633;
    float _661 = _659 + 1.0;
    float _663 = fma(_655, _571, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = in.m_52.x;
    float _667 = in.m_52.y;
    float _669 = _607 * _661;
    float _671 = -_607;
    float _673 = _671 + 1.0;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = _645 * _673;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _685;
    float _689 = fma(_677, _591, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _691 = _613 * _679;
    float _693 = _647 * _679;
    float _695 = fma(_687, _591, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].x, _691);
    float _703 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _709 = fma(_699, _617, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _711 = fma(_663, _669, _701);
    float _713 = fma(_615, _669, _703);
    float _715 = fma(_707, _617, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _717 = fma(_695, _657, _711);
    float _719 = fma(_689, _657, _713);
    float _721 = fma(_709, _589, _717);
    float _723 = fma(_715, _589, _719);
    float _725 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[147].x, _721);
    float _727 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[147].y, _723);
    float _729 = _725 * _665;
    float _731 = _727 * _667;
    bool _733 = !_553;
    float _751;
    if (!_733)
    {
        float _735 = in.m_54.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_89);
        float _757 = 1.0 / _755;
        float _759 = _123 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _761 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _771 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _773 = isnan(_761);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _787 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _789 = isnan(_761);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _799;
    bool _803 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _805 = isnan(_761);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _769;
    float _817 = -_781;
    float _819 = _817 + 1.0;
    bool _821 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _823 = 1.0 / _785;
    float _825 = _801 * _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _831 = -_813;
    float _833 = _831 + 1.0;
    float _835 = fma(_825, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _837 = _797 * _819;
    float _839 = -_797;
    float _841 = _839 + 1.0;
    float _843 = _781 * _833;
    float _845 = _829 * _823;
    float _847 = _835 * _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _761 + _849;
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _847);
    float _855 = fma(_845, _851, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _857 = fma(_855, _843, _853);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _865 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[117].x, _857);
    float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _867;
    out.m_56.y = _869;
    out.m_56.z = _871;
    out.m_56.w = _873;
    bool _875 = !_821;
    float _899;
    float _901;
    float _903;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _881 = float(_89);
        float _883 = 1.0 / _881;
        float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = _123 * _883;
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _891 = _889 * _879;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = _881;
        _903 = _887;
        _905 = true;
    }
    else
    {
        float _907 = float(_89);
        float _909 = 1.0 / _907;
        float _911 = _123 * _909;
        _899 = _911;
        _901 = _907;
        _903 = _911;
    }
    _905 = false;
    float _913 = _899;
    float _915 = _901;
    float _917 = _903;
    float _919 = in.m_54.x;
    float _921 = in.m_54.y;
    float _923 = in.m_54.z;
    float _925 = in.m_54.w;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _929 = int(_927);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = _913 + _931;
    float _935 = _729 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _937 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _939 = int(_937);
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _947 = float(_929);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _955 = 1.0 / _947;
    float _957 = _919 * 2.0;
    bool _959 = _925 > 0.5;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _961;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _969 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[79].z, _941);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _985 = _983 != 0;
    float _987 = 1.0 / _963;
    float _989 = -_225;
    int _991 = _959 ? as_type<int>(_989) : as_type<int>(_225);
    float _993 = _921 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _997 = _995 != 0;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1001 = !_985;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1011 = _1009 != 0;
    float _1013 = floor(_957);
    bool _1015 = !_977;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = _919 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1021 = !_973;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = _921 + _923;
    bool _1027 = !_981;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = _923 * 2.0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1035 = _1033 != 0;
    float _1037 = 1.0 / _967;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1041 = _1039 != 0;
    float _1043 = _921 + (-0.5);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1047 = _1045 != 0;
    float _1049 = _921 * 2.0;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1057 = !_997;
    float _1059 = _1057 ? _225 : as_type<float>(_991);
    float _1061 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1063 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1065 = !_1011;
    int _1067 = _1065 ? 0 : 1;
    float _1069 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1055);
    bool _1071 = _919 > 0.5;
    float _1073 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1063);
    float _1075 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1061);
    float _1077 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1069);
    float _1079 = -_221;
    int _1081 = _1071 ? as_type<int>(_1079) : as_type<int>(_221);
    float _1083 = 1.0 / _945;
    bool _1085 = _921 > 0.5;
    float _1087 = _933 * _987;
    bool _1089 = !_1041;
    float _1091 = _1089 ? _221 : as_type<float>(_1081);
    float _1093 = _919 + (-0.5);
    float _1095 = -_225;
    int _1097 = _1085 ? as_type<int>(_1095) : as_type<int>(_225);
    bool _1099 = _923 > 0.5;
    float _1101 = 1.0 / _951;
    float _1103 = float(uint(_939));
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1111 = _1109 != 0;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1115 = _1113 != 0;
    float _1117 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    float _1119 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
    float _1121 = _123 * _955;
    float _1123 = -_221;
    int _1125 = _1099 ? as_type<int>(_1123) : as_type<int>(_221);
    float _1127 = 1.0 / _1103;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1131 = _1129 != 0;
    float _1133 = _923 + (-0.5);
    float _1135 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[78].w, _999);
    float _1137 = trunc(_1121);
    int _1139 = int(_1137);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1145 = !_1047;
    float _1147 = _1145 ? _225 : as_type<float>(_1097);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1153 = fma(_993, -2.0, _1141);
    float _1155 = -_1143;
    float _1157 = fma(_1019, 2.0, _1155);
    int _1159 = as_type<int>(_1127) + (-2);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1165 = _923 + _919;
    float _1167 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[78].z, _953);
    float _1169 = _955;
    float _1171 = _1069;
    float _1173 = _923;
    if (!_1131)
    {
        _1169 = _923;
    }
    float _1175 = _1169;
    float _1177 = _921 + _919;
    float _1179 = _1175;
    if (!_1131)
    {
        _1171 = _921;
    }
    float _1181 = _1171;
    float _1183 = 1.0 / _1007;
    float _1185 = float(uint(_1139));
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1191 = !_1131;
    float _1193 = _1191 ? _921 : _919;
    float _1195 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1135);
    float _1197 = _1181;
    if (_1131)
    {
        _1173 = _921;
    }
    float _1199 = _1173;
    float _1201 = as_type<float>(_1159) * _1185;
    if (_1131)
    {
        _1179 = _921;
    }
    float _1203 = _1179;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1207 = _913 + _1205;
    float _1209 = 1.0 / _1151;
    int _1211 = ~_939;
    int _1213 = _1211 + 1;
    float _1215 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1221 = _1013 >= 0.0;
    bool _1223 = isnan(_1013);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    if (_1131)
    {
        _1197 = _919;
    }
    float _1231 = _1197;
    float _1233 = trunc(_1201);
    float _1235 = precise::max(_1233, 0.0);
    uint _1238 = uint(_1235);
    float _1240 = _1207 * _1037;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1242;
    int _1246 = _1229 ? 0 : 1;
    float _1248 = _1244 * _1083;
    bool _1250 = _1013 > 0.0;
    float _1252 = 1.0 / _1163;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1266 = _1256 * _1183;
    float _1268 = _1260 * _1101;
    float _1270 = _1264 * _1209;
    int _1272 = _1213 * int(_1238);
    int _1274 = _1272 + _1139;
    float _1276 = 1.0 / _1189;
    int _1278 = ~_1246;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = float(uint(_1274));
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1286;
    int _1290 = _1282;
    if (!_1250)
    {
        int _1292 = ~_1246;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = 1.0 / _1219;
    bool _1300 = !_1131;
    float _1302 = _1300 ? 1.2345600128173828125 : 1.0;
    float _1304 = as_type<float>(_1159) * _1284;
    float _1306 = _1288 * _1252;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1312 = 1.0 / _915;
    float _1314 = _1310 * _1276;
    int _1316 = abs(_1017);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1318;
    int _1322 = ~_939;
    int _1324 = _1322 + 1;
    float _1326 = floor(_1049);
    int _1328 = abs(_1023);
    float _1330 = _1320 * _1298;
    float _1332 = _1165 + (-1.0);
    float _1334 = _1025 + (-1.0);
    bool _1336 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1338 = isnan(_917);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = trunc(_1304);
    float _1350 = precise::max(_1348, 0.0);
    uint _1352 = uint(_1350);
    float _1354 = float(_939);
    int _1356 = ~_939;
    int _1358 = _1356 + 1;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1362 = _123 * _1354;
    bool _1364 = _1326 >= 0.0;
    bool _1366 = isnan(_1326);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = floor(_1031);
    float _1376 = _1362 * _1312;
    float _1378 = _1302 * _1193;
    float _1380 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1382 = !_1053;
    float _1384 = _1382 ? _221 : as_type<float>(_1125);
    int _1386 = _1372 ? 0 : 1;
    float _1388 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1390 = log2(_1388);
    int _1392 = int(_1238) + int(_1352);
    bool _1394 = _1326 > 0.0;
    int _1396 = _1324 * _1392;
    int _1398 = _1396 + _1139;
    float _1400 = trunc(_1376);
    int _1402 = int(_1400);
    int _1404 = ~_1386;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1412 = uint(_1398) >= uint(_939);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1422;
    bool _1426 = !_1412;
    int _1428 = _1426 ? 0 : (-1);
    float _1430 = floor(_1378);
    float _1432 = _123 * _1390;
    int _1434 = _1408;
    if (!_1394)
    {
        int _1436 = ~_1386;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    float _1442 = fma(_1424, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1444 = _1374 > 0.0;
    float _1446 = fma(_1420, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1448 = _1374 >= 0.0;
    bool _1450 = isnan(_1374);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1458;
    float _1462 = fma(_1416, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1464 = exp2(_1432);
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1470 = float(_1139);
    float _1472 = fma(_1460, _1087, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1480 = _917 + _1478;
    bool _1482 = _1470 >= _1354;
    bool _1484 = isnan(_1470);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1354);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = -_1430;
    float _1496 = _1378 + _1494;
    int _1498 = ~_1392;
    int _1500 = _1498 + _1428;
    int _1502 = _1500 + 1;
    float _1504 = fma(_1248, _1480, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1506 = trunc(_1492);
    int _1508 = int(_1506);
    float _1510 = _1496 * _1354;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1514 = _917 + _1512;
    int _1516 = _1456 ? 0 : 1;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1520 = _917 + _1518;
    bool _1522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = -_1464;
    float _1534 = _1532 + 1.0;
    float _1536 = fma(_1268, _1514, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1540 = _917 + _1538;
    int _1542 = _939 * _1502;
    int _1544 = _1542 + _1139;
    float _1546 = fma(_1270, _1520, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1548 = _1530 ? _1534 : 0.0;
    float _1550 = fma(_1306, _1540, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1552 = _939 == 0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1556 = _917 + _1554;
    float _1558 = trunc(_1510);
    int _1560 = int(_1558);
    int _1562 = ~_1508;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    float _1568 = fma(_1476, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1570 = !_1552;
    int _1572 = _1570 ? _1544 : (-1);
    float _1574 = fma(_1468, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1576 = abs(_1067);
    float _1578 = fma(_1314, _1556, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    int _1580 = _939 + (-1);
    int _1582 = _1572 * _1566;
    int _1584 = abs(_1029);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1588 = _917 + _1586;
    int _1590 = _1508 * _1580;
    int _1592 = _1590 + _1582;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1596 = _917 + _1594;
    float _1598 = fma(_1266, _1588, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1600 = _1592 * _1316;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1604 = _1560 * _1576;
    int _1606 = _1604 + _1139;
    bool _1608 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1610 = isnan(_913);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    int _1620 = _1402 * _1328;
    int _1622 = _1620 + _1600;
    float _1624 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1602);
    bool _1626 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1628 = isnan(_917);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = fma(_1330, _1596, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1640 = _1606 * _1584;
    int _1642 = _1640 + _1622;
    bool _1644 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1646 = isnan(_913);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -_1618;
    float _1658 = _1656 + 1.0;
    bool _1660 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1662 = isnan(_917);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = -_1636;
    float _1674 = _1672 + 1.0;
    bool _1676 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1678 = isnan(_913);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1654 * _1658;
    float _1690 = -_1654;
    float _1692 = _1690 + 1.0;
    int _1694 = abs(_1003);
    float _1696 = _1670 * _1674;
    bool _1698 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1700 = isnan(_917);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = -_1670;
    float _1712 = _1710 + 1.0;
    float _1714 = _1686 * _1692;
    int _1716 = _1560 * _1694;
    int _1718 = _1716 + _1642;
    bool _1720 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1722 = isnan(_917);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1708 * _1712;
    float _1734 = -_1708;
    float _1736 = _1734 + 1.0;
    float _1738 = _1442 * _1714;
    float _1740 = _1462 * _1714;
    float _1742 = _1472 * _1714;
    bool _1744 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1746 = isnan(_917);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = _1730 * _1736;
    float _1758 = -_1730;
    float _1760 = _1758 + 1.0;
    float _1762 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _969);
    float _1764 = -_1754;
    float _1766 = _1764 + 1.0;
    float _1768 = _1754 * _1760;
    float _1770 = float(uint(_1718));
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1774 = 1.0 + _1772;
    bool _1776 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1778 = isnan(_917);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1624);
    bool _1790 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1792 = isnan(_917);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1798 = _1794 || _1796;
    float _1800 = float(_1798);
    float _1802 = as_type<float>(_1159) * _1770;
    float _1804 = 1.0 / _1774;
    float _1806 = _1800 * _1766;
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1814 = _1762 * (-0.15915493667125701904296875);
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1818 = _1346 * _1810;
    float _1820 = trunc(_1802);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    float _1826 = -_1346;
    float _1828 = _1826 + 1.0;
    float _1830 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1812);
    float _1832 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1834 = fma(_1215, -2.0, _1816);
    float _1836 = _1786 * _1828;
    float _1838 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1830);
    float _1840 = -_1360;
    float _1842 = fma(_1832, 2.0, _1840);
    float _1844 = _1814 * 6.283185482025146484375;
    float _1846 = sin(_1844);
    float _1848 = _1548 * _1804;
    float _1850 = -_1786;
    float _1852 = _1850 + 1.0;
    float _1854 = _1504 * _1836;
    float _1856 = -_1686;
    float _1858 = _1856 + 1.0;
    int _1860 = ~_1516;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1834);
    int _1868 = _1864;
    if (!_1444)
    {
        int _1870 = ~_1516;
        int _1872 = _1870 + 1;
        _1868 = _1872;
    }
    int _1874 = _1868;
    float _1876 = _1814 * 6.283185482025146484375;
    float _1878 = cos(_1876);
    int _1880 = _1358 * int(_1824);
    int _1882 = _1880 + _1718;
    float _1884 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1738);
    float _1886 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1740);
    float _1888 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1742);
    float _1890 = -_123;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1842);
    float _1894 = float(uint(_1882));
    float _1896 = fma(_1568, _1688, _1884);
    float _1898 = _1147 * _1846;
    float _1900 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1854);
    float _1902 = fma(_1446, _1688, _1886);
    float _1904 = as_type<float>(_1159) * _1894;
    float _1906 = fma(_1574, _1688, _1888);
    bool _1908 = !_1111;
    int _1910 = _1908 ? 0 : 1;
    float _1912 = fma(_1598, _1818, _1900);
    float _1914 = trunc(_1904);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1147 * _1878;
    float _1922 = -_1898;
    float _1924 = fma(_1091, _1878, _1922);
    int _1926 = abs(_1910);
    float _1928 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1902);
    float _1930 = fma(_1091, _1846, _1920);
    float _1932 = _1384 + 0.5;
    float _1934 = _1059 + (-0.5);
    float _1936 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1938 = fma(_1536, _1806, _1912);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1892);
    int _1942 = ~_939;
    int _1944 = _1942 + 1;
    float _1946 = -_1934;
    float _1948 = -_1866;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1948);
    float _1952 = float(_1926);
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1956 = _1936 + _1954;
    float _1958 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1906);
    int _1960 = int(_1824) + int(_1918);
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1964 = float(_1296);
    float _1966 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1896);
    bool _1968 = !_1107;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1944 * _1960;
    int _1974 = _1972 + _1718;
    float _1976 = _1117 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1978 = _1952 * _1964;
    bool _1980 = !_1115;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1986 = uint(_1974) >= uint(_939);
    float _1988 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1976 + _1990;
    float _1994 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1996 = abs(_1970);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2000 = _1988 + _1998;
    int _2002 = abs(_1982);
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1994);
    float _2006 = float(_1440);
    float _2008 = fma(_1546, _1768, _1938);
    bool _2010 = !_1986;
    int _2012 = _2010 ? 0 : (-1);
    float _2014 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2004);
    float _2016 = float(uint(_1606));
    float _2018 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2020 = ~_1960;
    int _2022 = _2020 + _2012;
    int _2024 = _2022 + 1;
    float _2026 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2028 = float(_2002);
    float _2030 = as_type<float>(_1159) * _2016;
    float _2032 = float(_1996);
    int _2034 = _939 * _2024;
    int _2036 = _2034 + _1718;
    float _2038 = float(_1874);
    float _2040 = _2028 * _2006;
    int _2042 = ~_939;
    int _2044 = _2042 + 1;
    float _2046 = trunc(_2030);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    bool _2052 = _2014 >= 0.0;
    float _2054 = _2032 * _2038;
    float _2056 = in.m_58.x;
    float _2058 = in.m_58.y;
    float _2060 = in.m_58.z;
    float _2062 = -_123;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1157);
    float _2066 = _1924 + 0.5;
    bool _2068 = !_1552;
    int _2070 = _2068 ? _2036 : (-1);
    float _2072 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1153);
    float _2074 = fma(_1550, _1756, _2008);
    float _2076 = fma(_2026, _2066, _2064);
    int _2078 = _2070 >> 31;
    float _2080 = _1978 * (-2.0);
    int _2082 = _2070 & 3;
    bool _2084 = _2082 != 0;
    float _2086 = _1930 + (-0.5);
    int _2088 = _2078 & 3;
    int _2090 = _2044 * int(_2050);
    int _2092 = _2090 + _1606;
    bool _2094 = uint(_2082) > 1u;
    float _2096 = fma(_1380, _2080, _1380);
    int _2098 = _2070 & 3;
    bool _2100 = _2098 != 0;
    float _2102 = -_2018;
    float _2104 = -_2072;
    float _2106 = fma(_2102, _2086, _2104);
    int _2108 = _2070 + _2088;
    float _2110 = -_1788;
    float _2112 = _2110 + 1.0;
    float _2114 = float(uint(_2092));
    float _2116 = -_1838;
    float _2118 = _2116 + 1.0;
    int _2120 = _2108 >> 2;
    float _2122 = -_1195;
    float _2124 = _2122 + 1.0;
    int _2126 = _2100 ? 0 : 1;
    float _2128 = fma(_2080, _2058, _2058);
    int _2130 = _2120 << 4;
    int _2132 = _2130 + 512;
    float _2134 = as_type<float>(_1159) * _2114;
    int _2136 = ~_2126;
    int _2138 = _2136 + 1;
    int _2140 = _2138 + 1;
    float _2142 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1167);
    int _2144 = _2140;
    if (!_2094)
    {
        int _2146 = ~_2126;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    int _2152 = _2132 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = -_2142;
    float _2172 = _2170 + 1.0;
    float _2174 = -_2118;
    float _2176 = fma(_1384, _2174, _1940);
    float _2178 = fma(_1930, _2124, _2106);
    float _2180 = fma(_1059, _2112, _1950);
    float _2182 = -_2172;
    float _2184 = fma(_1924, _2182, _2076);
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2188 = uint(int(uint(_2132) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    float _2204 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2206 = _1928 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2208 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2210 = trunc(_2134);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = _2040 * (-2.0);
    bool _2218 = _2082 != 3;
    float _2220 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2222 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2224 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2226 = uint(_2082) >= 2u;
    float _2228 = fma(_1410, _2216, _1410);
    int _2230 = abs(_2150);
    float _2232 = fma(_2216, _2060, _2060);
    bool _2234 = !_2084;
    int _2236 = _2234 ? 0 : 1;
    out.m_60.x = _2220;
    out.m_60.y = _2222;
    out.m_60.z = _2224;
    out.m_60.w = _2186;
    int _2238 = _2226 ? 0 : 1;
    float _2240 = fma(_1578, _1732, _2074);
    int _2242 = ~_939;
    int _2244 = _2242 + 1;
    out.m_62.x = _2184;
    out.m_62.y = _2178;
    out.m_62.z = _2176;
    out.m_62.w = _2180;
    int _2246 = ~_2238;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    float _2252 = fma(_1638, _1696, _2240);
    int _2254 = _2250;
    if (_2218)
    {
        int _2256 = ~_2238;
        int _2258 = _2256 + 1;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2128);
    int _2264 = int(_2050) + int(_2214);
    float _2266 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2252);
    bool _2268 = _2082 != 3;
    if (_2052)
    {
        out.m_45.x = 0.0;
    }
    float _2270 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2232);
    int _2272 = abs(_2236);
    int _2274 = _2244 * _2264;
    int _2276 = _2274 + _1606;
    out.m_64.x = _2266;
    int _2278 = ~_2230;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = abs(_2260);
    int _2286 = ~_2272;
    int _2288 = _2286 + 1;
    int _2290 = _2288 + 1;
    int _2292 = ~_2284;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    bool _2298 = !_2268;
    int _2300 = _2298 ? 0 : (-1);
    bool _2302 = uint(_2276) >= uint(_939);
    int _2304 = abs(_2300);
    int _2306 = _2282 * as_type<int>(_2202);
    bool _2308 = !_2302;
    int _2310 = _2308 ? 0 : (-1);
    int _2312 = _2290 * as_type<int>(_2194);
    int _2314 = _2312 + _2306;
    bool _2316 = !_1035;
    int _2318 = _2316 ? 0 : 1;
    int _2320 = ~_2264;
    int _2322 = _2320 + _2310;
    int _2324 = _2322 + 1;
    int _2326 = _2296 * as_type<int>(_2160);
    int _2328 = _2326 + _2314;
    float _2330 = _1956 * _1956;
    int _2332 = abs(_2318);
    int _2334 = ~_2304;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    float _2340 = fma(_1992, _1992, _2330);
    int _2342 = _939 * _2324;
    int _2344 = _2342 + _1606;
    int _2346 = ~_2332;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    float _2352 = fma(_2000, _2000, _2340);
    int _2354 = _2338 * as_type<int>(_2168);
    int _2356 = _2354 + _2328;
    bool _2358 = !_1552;
    int _2360 = _2358 ? _2344 : (-1);
    float _2362 = as_type<float>(_2304);
    if (_2052)
    {
        _2362 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2364 = _2362;
    int _2366 = _2356 * _2350;
    float _2368 = rsqrt(_2352);
    bool _2370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2372 = isnan(1.0);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2378 = _2374 || _2376;
    float _2380 = _935 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2382 = _2360 * _2332;
    int _2384 = _2382 + _2366;
    int _2386 = as_type<int>(_2364);
    if (_2052)
    {
        float _2388 = _2364 * 5.0;
        _2386 = as_type<int>(_2388);
    }
    int _2390 = _2386;
    bool _2392 = !_2378;
    float _2394 = _2392 ? _123 : _1848;
    float _2396 = float(_2384);
    if (_2052)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7239 = as_type<float>(_2390);
        out.gl_Position.z = _7239;
    }
    float _2398 = fma(_2394, _2096, _2262);
    out.m_66.y = _2396;
    float _2400 = _2398 * 0.15915493667125701904296875;
    float _2402 = _2380 * _2368;
    float _2404 = _1992 * _2402;
    float _2406 = _1956 * _2402;
    if (_2052)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2408 = -_2406;
    float _2410 = _1936 + _2408;
    float _2412 = _2000 * _2402;
    float _2414 = -_2404;
    float _2416 = _1976 + _2414;
    float _2418 = fma(_2394, _2228, _2270);
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2422 = _2410 + _2420;
    float _2424 = -_2412;
    float _2426 = _1988 + _2424;
    float _2428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2430 = _2416 + _2428;
    float _2432 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2436 = _2426 + _2434;
    float _2438 = _1177 + (-1.0);
    float _2440 = _2054 * (-2.0);
    float _2442 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2432);
    float _2444 = -_2406;
    float _2446 = _1956 + _2444;
    float _2448 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2450 = fma(_2440, _2056, _2056);
    float _2452 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2442);
    float _2454 = -_2404;
    float _2456 = _1992 + _2454;
    float _2458 = _2446 * _2446;
    float _2460 = fma(_2448, _2440, _2448);
    float _2462 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    bool _2464 = _2452 >= 0.0;
    float _2466 = fma(_2456, _2456, _2458);
    float _2468 = -_2412;
    float _2470 = _2000 + _2468;
    float _2472 = fma(_2394, _2460, _2462);
    float _2474 = _2418 * 0.15915493667125701904296875;
    float _2476 = _2400 * 6.283185482025146484375;
    float _2478 = sin(_2476);
    float _2480 = fma(_2470, _2470, _2466);
    float _2482 = _2472 * 0.15915493667125701904296875;
    float _2484 = _2432;
    float _2486 = _2426;
    if (_2464)
    {
        _2484 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2488 = _2484;
    float _2490 = _2400 * 6.283185482025146484375;
    float _2492 = cos(_2490);
    int _2494 = as_type<int>(_2488);
    if (_2464)
    {
        out.m_45.x = 0.0;
    }
    if (_2464)
    {
        float _2496 = _2488 * 5.0;
        _2494 = as_type<int>(_2496);
    }
    int _2498 = _2494;
    float _2500 = _2474 * 6.283185482025146484375;
    float _2502 = sin(_2500);
    if (_2464)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7415 = as_type<float>(_2498);
        out.gl_Position.z = _7415;
    }
    float _2504 = _2474 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    float _2508 = sqrt(_2480);
    float _2510 = _2482 * 6.283185482025146484375;
    float _2512 = sin(_2510);
    float _2514 = _2492;
    if (_2464)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2516 = _2482 * 6.283185482025146484375;
    float _2518 = cos(_2516);
    float _2520 = _2368 * _2508;
    float _2522 = _731 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2524 = _2492 * _2506;
    float _2526 = _2478 * _2502;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2530 = _2520 * _2522;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2534 = fma(_2512, _2526, _2524);
    float _2536 = fma(_2512, _2524, _2526);
    float _2538 = _935 * _2520;
    float _2540 = _2528 * _2530;
    float _2542 = _2492 * _2502;
    float _2544 = _2478 * _2506;
    float _2546 = _2532 * _2538;
    float _2548 = _2506 * _2518;
    float _2550 = -_2542;
    float _2552 = fma(_2512, _2544, _2550);
    float _2554 = _2502 * _2518;
    float _2556 = -_2544;
    float _2558 = fma(_2512, _2542, _2556);
    float _2560 = _2548 * _2540;
    float _2562 = _2552 * _2540;
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2566 = _2564 * 0.5;
    float _2568 = fma(_2554, _2546, _2560);
    float _2570 = _2536 * _2540;
    float _2572 = fma(_2534, _2546, _2562);
    float _2574 = _2518 * _2566;
    float _2576 = -_2512;
    float _2578 = fma(_2576, _2566, _2568);
    float _2580 = fma(_2558, _2546, _2570);
    float _2582 = fma(_2478, _2574, _2572);
    float _2584 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2586 = fma(_2492, _2574, _2580);
    float _2588 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2584);
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2596 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2598 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2600 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2594);
    float _2602 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2596);
    float _2604 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2606 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2608 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2610 = _1988 + _2604;
    float _2612 = _1976 + _2606;
    float _2614 = _1936 + _2608;
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2618 = _2610 + _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2622 = _2612 + _2620;
    float _2624 = _2618 * _2618;
    float _2626 = fma(_2622, _2622, _2624);
    float _2628 = sqrt(_2626);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = _2586;
    float _2634 = _2624;
    float _2636 = _2612;
    float _2638 = _2618;
    float _2640 = _2540;
    float _2642 = _2626;
    float _2644 = _2520;
    if (!_2630)
    {
        _2632 = _2612;
    }
    float _2646 = _2632;
    float _2648 = _2646;
    if (!_2630)
    {
        _2634 = _2610;
    }
    float _2650 = _2634;
    float _2652 = _2650;
    if (!_2630)
    {
        _2636 = _2614;
    }
    float _2654 = _2636;
    bool _2656 = !_2630;
    float _2658 = _2654;
    if (!_2656)
    {
        float _2660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2664 = _2628 + _2662;
        float _2666 = rsqrt(_2626);
        float _2668 = _2664 * _2660;
        float _2670 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2672 = _2668 * 0.15915493667125701904296875;
        float _2674 = _2672 * 6.283185482025146484375;
        float _2676 = cos(_2674);
        float _2678 = _2672 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        float _2682 = _2676 + (-1.0);
        float _2684 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2686 = fma(_2680, _2670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2688 = fma(_2614, _2676, _2684);
        float _2690 = _2666 * _2686;
        float _2692 = fma(_2622, _2690, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2694 = fma(_2618, _2690, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2658 = _2688;
        _2648 = _2692;
        _2652 = _2694;
    }
    float _2696 = _2658;
    float _2698 = _2648;
    float _2700 = _2652;
    float _2702 = -_1936;
    float _2704 = _2702 + _2696;
    float _2706 = -_1976;
    float _2708 = _2706 + _2698;
    float _2710 = -_1988;
    float _2712 = _2710 + _2700;
    float _2714 = _2704 * _2704;
    float _2716 = fma(_2708, _2708, _2714);
    float _2718 = fma(_2712, _2712, _2716);
    float _2720 = sqrt(_2718);
    bool _2722 = _2720 > 0.0;
    float _2724 = _2720;
    float _2726 = _2696;
    float _2728 = _2712;
    float _2730 = _2700;
    float _2732 = _2704;
    if (!_2722)
    {
        _2724 = _2698;
    }
    float _2734 = _2724;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2722)
    {
        _2638 = _2700;
    }
    float _2740 = _2638;
    bool _2742 = !_2722;
    float _2744 = _2740;
    if (!_2742)
    {
        bool _2746 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2748 = _2740;
        if (_2746)
        {
            float _2750 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2748 = _2750;
        }
        float _2752 = _2748;
        float _2754 = _2752;
        if (_2746)
        {
            float _2756 = _473 * _2752;
            _2514 = _2756;
        }
        float _2758 = _2514;
        float _2760 = _2758;
        if (_2746)
        {
            float _2762 = _475 * _2752;
            _2640 = _2762;
        }
        float _2764 = _2640;
        float _2766 = _2764;
        if (_2746)
        {
            float _2768 = _477 * _2752;
            _2642 = _2768;
        }
        float _2770 = _2642;
        float _2772 = _2770;
        if (!_2746)
        {
            bool _2774 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2778 = _2774 || _2776;
            bool _2780 = isnan(1.0);
            bool _2782 = _2778 || _2780;
            float _2784 = _123 + 1.0;
            if (!_2782)
            {
                float _2786 = _2784 * _2784;
                float _2788 = _2786 * 0.5;
                _125 = _2788;
            }
            float _2790 = _125;
            float _2792 = _2790;
            if (!_2782)
            {
                float _2794 = _2790 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2792 = _2794;
            }
            float _2796 = _2792;
            bool _2798 = !_2782;
            float _2800 = _2796;
            if (!_2798)
            {
                float _2802 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2804 = log2(_2802);
                float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2808 = 1.0 + _2806;
                float _2810 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2812 = _2804 * _2784;
                float _2814 = 1.0 / _2808;
                float _2816 = _2810 * 0.693147182464599609375;
                float _2818 = exp2(_2812);
                float _2820 = 1.0 / _2816;
                float _2822 = _2818 + (-1.0);
                float _2824 = -_2822;
                float _2826 = fma(_2824, _2820, _2784);
                float _2828 = _2826 * _2814;
                float _2830 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2800 = _2830;
            }
            float _2832 = _2800;
            float _2834 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2836 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2838 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2840 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2842 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2844 = _2834 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2846 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2840);
            float _2848 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2842);
            float _2850 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2846);
            float _2852 = _2846;
            _2736 = _2838;
            if (!_2782)
            {
                _2852 = _2784;
            }
            float _2854 = _2852;
            bool _2856 = !_2782;
            float _2858 = _2854;
            if (!_2856)
            {
                float _2860 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2862 = log2(_2860);
                float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2866 = 1.0 + _2864;
                float _2868 = 1.0 / _2866;
                float _2870 = _2862 * _2784;
                float _2872 = exp2(_2870);
                float _2874 = -_2872;
                float _2876 = _2874 + 1.0;
                float _2878 = _2876 * _2868;
                _2858 = _2878;
            }
            float _2880 = _2858;
            float _2882 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2848);
            float _2884 = fma(_2880, _163, _2850);
            float _2886 = fma(_2836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2844);
            float _2888 = fma(_2880, _161, _2882);
            float _2890 = -_435;
            float _2892 = _2890 + _2884;
            float _2894 = fma(_2838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2886);
            float _2896 = -_441;
            float _2898 = _2896 + _2888;
            float _2900 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2902 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2904 = fma(_2880, _165, _2894);
            float _2906 = _2892 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2908 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2900);
            float _2910 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2902);
            float _2912 = -_447;
            float _2914 = _2912 + _2904;
            float _2916 = fma(_2898, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2906);
            float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2908);
            float _2920 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2910);
            float _2922 = fma(_2914, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2916);
            _481 = _2920;
            _483 = _2918;
            _485 = _2922;
            _2760 = _2918;
            _2766 = _2920;
            _2772 = _2922;
            _2754 = _2892;
        }
        float _2924 = _481;
        float _2926 = _483;
        float _2928 = _485;
        float _2930 = _2760;
        float _2932 = _2766;
        float _2934 = _2772;
        float _2936 = _2754;
        float _2938 = _2736;
        float _2940 = _2924 * _2924;
        float _2942 = rsqrt(_2718);
        float _2944 = fma(_2926, _2926, _2940);
        float _2946 = fma(_2928, _2928, _2944);
        float _2948 = sqrt(_2946);
        float _2950 = _2708 * _2942;
        float _2952 = _2704 * _2942;
        float _2954 = _2712 * _2942;
        bool _2956 = _2948 > 0.0;
        float _2958 = _2938;
        float _2960 = _2936;
        _2728 = _2954;
        if (!_2956)
        {
            _2958 = _2698;
        }
        float _2962 = _2958;
        _2738 = _2962;
        if (!_2956)
        {
            _2960 = _2700;
        }
        float _2964 = _2960;
        bool _2966 = !_2956;
        _2744 = _2964;
        if (!_2966)
        {
            float _2968 = rsqrt(_2946);
            float _2970 = _2968 * _2924;
            float _2972 = _2968 * _2926;
            float _2974 = _2968 * _2928;
            float _2976 = _2952 * _2970;
            float _2978 = fma(_2950, _2972, _2976);
            float _2980 = fma(_2954, _2974, _2978);
            float _2982 = _2980 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2984 = fma(_2930, _2982, _2698);
            float _2986 = fma(_2932, _2982, _2696);
            float _2988 = fma(_2934, _2982, _2700);
            _2726 = _2986;
            _2744 = _2988;
            _2738 = _2984;
        }
    }
    float _2990 = _2726;
    float _2992 = _2744;
    float _2994 = _2738;
    float _2996 = _2728;
    float _2998 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3000 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3002 = isnan(0.5);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3008 = _3004 || _3006;
    float _3010 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2998);
    float _3012 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3014 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3016 = isnan(0.5);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3022 = _3018 || _3020;
    float _3024 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3010);
    float _3026 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3028 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3012);
    float _3030 = 1.0 / _3026;
    float _3032 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3028);
    float _3034 = _2996;
    if (_3022)
    {
        _2730 = 1.0;
    }
    float _3036 = _2730;
    float _3038 = _3032 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3040 = _3038 + _3026;
    float _3042 = -_2406;
    float _3044 = _3042 + _2990;
    float _3046 = _3040 * _3030;
    float _3048 = _3046 * 0.5;
    float _3050 = -_2412;
    float _3052 = _3050 + _2992;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3054);
    float _3058 = -_2404;
    float _3060 = _3058 + _2994;
    float _3062 = 1.0 / _3056;
    float _3064 = _3044;
    float _3066 = _3060;
    float _3068 = _3052;
    float _3070 = _3036;
    if (!_3008)
    {
        float _3072 = _2422 * _2422;
        float _3074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3076 = -_1988;
        float _3078 = _3076 + _2992;
        float _3080 = -_1976;
        float _3082 = _3080 + _2994;
        float _3084 = fma(_2430, _2430, _3072);
        float _3086 = -_1936;
        float _3088 = _3086 + _2990;
        float _3090 = fma(_2436, _2436, _3084);
        float _3092 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3094 = sqrt(_3090);
        float _3096 = 1.0 / _2520;
        float _3098 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3100 = precise::min(_3094, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3102 = _3100 * _3074;
        float _3104 = _3102 * _3096;
        float _3106 = _3098 * _3104;
        float _3108 = _3078 * _3104;
        float _3110 = fma(_3082, _3106, _2416);
        float _3112 = fma(_3088, _3106, _2410);
        float _3114 = fma(_3098, _3108, _2426);
        _3064 = _3112;
        _3066 = _3110;
        _3068 = _3114;
        _2644 = _3096;
    }
    float _3116 = _3064;
    float _3118 = _3066;
    float _3120 = _3068;
    float _3122 = _2644;
    float _3124 = _3122;
    if (_3022)
    {
        _2732 = 1.0;
    }
    float _3126 = _2732;
    float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3130 = _3062 * _3128;
    float _3132 = _3126;
    if (!_3022)
    {
        float _3134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3136 = _3134 * 0.15915493667125701904296875;
        float _3138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3140 = _3136 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        float _3144 = _3138 * 0.15915493667125701904296875;
        float _3146 = _3136 * 6.283185482025146484375;
        float _3148 = sin(_3146);
        float _3150 = 1.0 / _3142;
        float _3152 = _3144 * 6.283185482025146484375;
        float _3154 = cos(_3152);
        float _3156 = _3148 * _3150;
        float _3158 = _3144 * 6.283185482025146484375;
        float _3160 = sin(_3158);
        float _3162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3164 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3162;
        float _3166 = _3154 * _3156;
        float _3168 = 1.0 / _3164;
        float _3170 = 1.0 / _3166;
        float _3172 = _3160 * _3170;
        float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3176 = fma(_3130, _3172, _3174);
        float _3178 = _3176 * _3168;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        _2486 = _3168;
        _3124 = _3136;
        _3070 = _3180;
    }
    float _3182 = _2486;
    float _3184 = _3124;
    float _3186 = _3070;
    float _3188 = _3182;
    float _3190 = _3184;
    if (!_3022)
    {
        float _3192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3194 = _3192 * 0.15915493667125701904296875;
        float _3196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3198 = _3194 * 6.283185482025146484375;
        float _3200 = cos(_3198);
        float _3202 = _3196 * 0.15915493667125701904296875;
        float _3204 = _3194 * 6.283185482025146484375;
        float _3206 = sin(_3204);
        float _3208 = 1.0 / _3200;
        float _3210 = _3202 * 6.283185482025146484375;
        float _3212 = cos(_3210);
        float _3214 = _3206 * _3208;
        float _3216 = _3202 * 6.283185482025146484375;
        float _3218 = sin(_3216);
        float _3220 = _3212 * _3214;
        float _3222 = 1.0 / _3220;
        float _3224 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3226 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3224;
        float _3228 = 1.0 / _3226;
        float _3230 = _3218 * _3222;
        float _3232 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3234 = fma(_3130, _3230, _3232);
        float _3236 = _3234 * _3228;
        float _3238 = precise::clamp(_3236, 0.0, 1.0);
        float _3240 = -_3238;
        float _3242 = _3240 + 1.0;
        _3188 = _3222;
        _3190 = _3220;
        _3132 = _3242;
    }
    float _3244 = _3188;
    float _3246 = _3190;
    float _3248 = _3132;
    float _3250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3252 = _3116 + _3250;
    float _3254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3256 = _3118 + _3254;
    float _3258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3260 = _3120 + _3258;
    float _3262 = _3252 * _3252;
    float _3264 = fma(_3256, _3256, _3262);
    float _3266 = fma(_3260, _3260, _3264);
    float _3268 = rsqrt(_3266);
    float _3270 = sqrt(_3266);
    float _3272 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3274 = _3256 * _3272;
    float _3276 = _3260 * _3272;
    float _3278 = _3274 * _3274;
    float _3280 = _3276 * _3276;
    float _3282 = _3278 + _3280;
    float _3284 = sqrt(_3282);
    bool _3286 = _3284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3290 = _3284 + _3288;
    float _3292 = _3260;
    float _3294 = _3246;
    float _3296 = _3290;
    float _3298 = _3244;
    float _3300 = _3252;
    if (_3286)
    {
        float _3302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3292 = _3302;
    }
    float _3304 = _3292;
    if (_3286)
    {
        float _3306 = rsqrt(_3282);
        _3294 = _3306;
    }
    float _3308 = _3294;
    float _3310 = _3308;
    if (_3286)
    {
        float _3312 = _3290 * _3304;
        _3296 = _3312;
    }
    float _3314 = _3296;
    if (_3286)
    {
        float _3316 = _3314 * 0.15915493667125701904296875;
        _3298 = _3316;
    }
    float _3318 = _3298;
    float _3320 = _3268;
    if (_3286)
    {
        float _3322 = _3318 * 6.283185482025146484375;
        float _3324 = sin(_3322);
        _3320 = _3324;
    }
    float _3326 = _3320;
    float _3328 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3330 = precise::max(0.0, _3328);
    float _3332 = _3262;
    float _3334 = _3330;
    float _3336 = _3328;
    if (_3286)
    {
        float _3338 = _3318 * 6.283185482025146484375;
        float _3340 = cos(_3338);
        _3332 = _3340;
    }
    float _3342 = _3332;
    float _3344 = -_3272;
    float _3346 = -_3330;
    float _3348 = fma(_3252, _3344, _3346);
    if (!_3286)
    {
        _3300 = _3278;
    }
    float _3350 = _3300;
    float _3352 = _3350;
    if (_3286)
    {
        float _3354 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3334 = _3354;
    }
    float _3356 = _3334;
    float _3358 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3360 = _3356;
    float _3362 = _3326;
    if (_3286)
    {
        float _3364 = fma(_3326, _3356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3360 = _3364;
    }
    float _3366 = _3360;
    float _3368 = _3366;
    if (!_3286)
    {
        _3362 = _3274;
    }
    float _3370 = _3362;
    float _3372 = _3370;
    float _3374 = _3342;
    if (_3286)
    {
        float _3376 = _3342 + (-1.0);
        _3336 = _3376;
    }
    float _3378 = _3336;
    float _3380 = _3378;
    if (_3286)
    {
        float _3382 = _3308 * _3366;
        _3034 = _3382;
    }
    float _3384 = _3034;
    if (!_3286)
    {
        _3368 = _3348;
    }
    float _3386 = _3368;
    float _3388 = _3386;
    if (_3286)
    {
        float _3390 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3310 = _3390;
    }
    float _3392 = _3310;
    if (_3286)
    {
        float _3394 = _3274 * _3384;
        _3372 = _3394;
    }
    float _3396 = _3372;
    if (!_3286)
    {
        _3380 = _3276;
    }
    float _3398 = _3380;
    float _3400 = _3398;
    if (_3286)
    {
        float _3402 = _3276 * _3384;
        _3400 = _3402;
    }
    float _3404 = _3400;
    if (_3286)
    {
        float _3406 = fma(_3348, _3342, _3392);
        _3388 = _3406;
    }
    float _3408 = _3388;
    if (_3286)
    {
        float _3410 = _3396 * _3396;
        _3352 = _3410;
    }
    float _3412 = _3352;
    if (!_3286)
    {
        _3374 = _3280;
    }
    float _3414 = _3374;
    float _3416 = _3414;
    if (_3286)
    {
        float _3418 = _3404 * _3404;
        _3416 = _3418;
    }
    float _3420 = _3416;
    float _3422 = fma(_3408, _3408, _3412);
    float _3424 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3426 = _3422 + _3420;
    float _3428 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3358);
    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3432 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3430);
    float _3434 = precise::clamp(_3432, 0.0, 1.0);
    float _3436 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3438 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3440 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3442 = rsqrt(_3426);
    float _3444 = -_3434;
    float _3446 = _3444 + 1.0;
    float _3448 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3436);
    float _3450 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3438);
    float _3452 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3440);
    float _3454 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3428);
    float _3456 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3448);
    float _3458 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3450);
    float _3460 = abs(_3446);
    float _3462 = log2(_3460);
    float _3464 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3452);
    float _3466 = _3456 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3468 = _3454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3470 = _3458 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3472 = _3464 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3474 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3476 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3478 = _3442 * _3396;
    float _3480 = _3442 * _3408;
    float _3482 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3474);
    float _3484 = _3442 * _3404;
    float _3486 = _3478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3488 = -_3476;
    float _3490 = fma(_3488, _3424, 1.0);
    float _3492 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3482);
    float _3494 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3496 = -_3486;
    float _3498 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3496);
    float _3500 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3502 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3492);
    float _3504 = log2(_3490);
    float _3506 = -_3484;
    float _3508 = fma(_3506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3498);
    float _3510 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3512 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3494);
    float _3514 = _3480 + 1.0;
    float _3516 = fma(_3508, -0.5, 0.5);
    float _3518 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3510);
    float _3520 = fma(_3508, 0.5, 0.5);
    float _3522 = exp2(_3500);
    float _3524 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3512);
    float _3526 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3518);
    float _3528 = fma(_3520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3530 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3524);
    float _3532 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3526);
    float _3534 = fma(_3520, _3528, -0.212114393711090087890625);
    float _3536 = 1.0 / _3502;
    float _3538 = _3504 * 0.693147182464599609375;
    float _3540 = fma(_3520, _3534, 1.570728778839111328125);
    float _3542 = sqrt(_3516);
    float _3544 = -_3480;
    float _3546 = fma(_3522, _3514, _3544);
    float _3548 = _3538 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3550 = fma(_3546, 0.5, 0.5);
    float _3552 = _3530 * _3536;
    float _3554 = _3532 * _3536;
    float _3556 = fma(_3552, 0.5, 0.5);
    float _3558 = fma(_3554, -0.5, 0.5);
    float _3560 = _3542 * 0.636619746685028076171875;
    float3 _9058 = float3(_3556, _3558, _3548);
    float _3562 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9058, float3(0.0), isnan(_9058)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9058, float3(0.0), isnan(_9058)), level(0.0)).x;
    float _3564 = -_3540;
    float _3566 = fma(_3560, _3564, 1.0);
    float3 _9074 = float3(_3556, _3558, _3548);
    float4 _3569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9074, float3(0.0), isnan(_9074)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9074, float3(0.0), isnan(_9074)), level(0.0)).xyzw;
    float _3571 = _3569.x;
    float _3573 = _3569.y;
    float _3575 = _3569.z;
    float _3577 = _3569.w;
    float2 _9091 = float2(_3566, _3550);
    float3 _3581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9091, float2(0.0), isnan(_9091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9091, float2(0.0), isnan(_9091)), level(0.0)).xyz;
    float _3583 = _3581.x;
    float _3585 = _3581.y;
    float _3587 = _3581.z;
    float _3589 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3591 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3593 = _3186 > 0.0;
    bool _3595 = isnan(_3186);
    bool _3597 = _3593 || _3595;
    bool _3599 = isnan(0.0);
    bool _3601 = _3597 || _3599;
    float _3603 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3591);
    float _3605 = exp2(_3589);
    bool _3607 = _3248 <= 0.0;
    bool _3609 = !_3601;
    bool _3611 = _3607 || _3609;
    float _3613 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    float _3615 = _3186 * _3248;
    float _3617 = _3502 * 0.5;
    float _3619 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3613);
    float _3621 = _3530 + _3502;
    float _3623 = _3615 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3625 = fma(_3532, -0.5, _3617);
    float _3627 = _3619 + _3502;
    float _3629 = _3621 * 0.5;
    out.gl_Position.x = _3530;
    out.gl_Position.y = _3532;
    out.gl_Position.z = _3619;
    out.gl_Position.w = _3502;
    float _3631 = _3623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3633 = _3627 * 0.5;
    float _3635 = -_3605;
    float _3637 = _3635 + 1.0;
    out.m_45.x = _3631;
    float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3629;
    out.m_68.y = _3625;
    out.m_68.z = _3633;
    out.m_68.w = _3502;
    float _3641 = -_3639;
    float _3643 = _3641 + 1.0;
    float _3645 = _3639 * _3562;
    float _3647 = _3577 * _3645;
    float _3649 = _3577 * _3643;
    float _3651 = _3587 * _3645;
    float _3653 = fma(_3583, _3647, _3571);
    float _3655 = fma(_3585, _3647, _3573);
    float _3657 = fma(_3577, _3651, _3575);
    out.m_70.x = _3653;
    out.m_70.y = _3655;
    out.m_70.z = _3657;
    out.m_70.w = _3649;
    if (!_3611)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3659;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

